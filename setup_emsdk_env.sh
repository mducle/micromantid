#!/bin/bash

set -e

export SYSROOT=`pwd`/sysroot

$MAMBA_EXE create -n ems -c conda-forge python=3.12 pybind11 cmake eigen pyodide-build
eval "$($MAMBA_EXE shell activate ems)"
mkdir build_env && cd build_env
wd=$(pwd)
mkdir -p $SYSROOT

export PYODIDE_EMSCRIPTEN_VERSION=$(pyodide config get emscripten_version)
export SIDE_MODULE_CXXFLAGS=$(pyodide config get cxxflags)
export SIDE_MODULE_CFLAGS=$(pyodide config get cflags)
export SIDE_MODULE_LDFLAGS=$(pyodide config get ldflags)
export PLATFORM_TRIPLET=wasm32-emscripten
git clone https://github.com/emscripten-core/emsdk.git
cd emsdk
./emsdk install ${PYODIDE_EMSCRIPTEN_VERSION}
./emsdk activate ${PYODIDE_EMSCRIPTEN_VERSION}
source emsdk_env.sh
cd $wd

wget https://github.com/boostorg/boost/releases/download/boost-1.84.0/boost-1.84.0.tar.gz
tar zxf boost-1.84.0.tar.gz && cd boost-1.84.0 && \
./bootstrap.sh --prefix=${SYSROOT}
# https://github.com/emscripten-core/emscripten/issues/17052
# Without this, boost outputs WASM modules not static library archives as an output.
# I don't understand why... the jam file used by boost is quite hard to understand.
printf "using clang : emscripten : emcc : <archiver>emar <ranlib>emranlib <linker>emlink ;" | tee -a ./project-config.jam
./b2 variant=release toolset=clang-emscripten link=static threading=single \
  --with-date_time --with-filesystem --with-python --with-headers --with-serialization \
  --with-system --with-regex --with-chrono --with-random --with-program_options --disable-icu \
  cxxflags="$SIDE_MODULE_CXXFLAGS -fexceptions -DBOOST_SP_DISABLE_THREADS=1" \
  cflags="$SIDE_MODULE_CFLAGS -fexceptions -DBOOST_SP_DISABLE_THREADS=1" \
  linkflags="-fpic $SIDE_MODULE_LDFLAGS" \
  --layout=system -j1 --prefix=${SYSROOT} \
  install
cd $wd
rsync -av ${SYSROOT} ${EMSDK}/upstream/emscripten/cache

git clone https://github.com/emscripten-core/musl
cd musl/include/sys && \
  mkdir -p ${SYSROOT}/include/sys && \
  cp -rpa inotify.h prctl.h eventfd.h epoll.h ${SYSROOT}/include/sys/
cd $wd
rsync -av ${SYSROOT} ${EMSDK}/upstream/emscripten/cache

git clone https://github.com/pocoproject/poco
cd poco && git checkout poco-1.14.0-release && mkdir bld && cd bld && \
  emcmake cmake -DENABLE_ACTIVERECORD_COMPILER=OFF \
                -DENABLE_PAGECOMPILER=OFF \
                -DENABLE_PAGECOMPILER_FILE2PAGE=off \
                -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
                -DBUILD_SHARED_LIBS=OFF \
                -DCMAKE_INSTALL_PREFIX=${SYSROOT} .. && \
  emmake make -j 8 install
cd $wd
rsync -av ${SYSROOT} ${EMSDK}/upstream/emscripten/cache

git clone https://github.com/open-source-parsers/jsoncpp
cd jsoncpp && git checkout 1.9.6 && mkdir bld && cd bld && \
  emcmake cmake -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
                -DBUILD_SHARED_LIBS=OFF \
                -DJSONCPP_WITH_TESTS=OFF \
                -DCMAKE_INSTALL_PREFIX=${SYSROOT} .. && \
  emmake make -j 8 install && \
cd $wd
rsync -av ${SYSROOT} ${EMSDK}/upstream/emscripten/cache

git clone https://github.com/madler/zlib/
cd zlib && git checkout v1.3.1 && mkdir bld && cd bld && \
  emcmake cmake -DZLIB_BUILD_EXAMPLES=OFF \
                -DCMAKE_C_FLAGS="-fPIC -Wno-deprecated-non-prototype" \
                -DCMAKE_INSTALL_PREFIX=${SYSROOT} .. && \
  emmake make -j 8 && \
  emmake make install && \
cd $wd
rsync -av ${SYSROOT} ${EMSDK}/upstream/emscripten/cache

git clone https://github.com/HDFGroup/hdf5 libhdf5
cd libhdf5 && git checkout hdf5_1.14.5
cat <<EOF > float_exception.patch
diff --git a/src/H5Tinit_float.c b/src/H5Tinit_float.c
index 2642554b0f..20238e16c9 100644
--- a/src/H5Tinit_float.c
+++ b/src/H5Tinit_float.c
@@ -609,8 +609,8 @@ H5T__init_native_float_types(void)
 
 done:
     /* Clear any FE_INVALID exceptions from NaN handling */
-    if (feclearexcept(FE_INVALID) != 0)
-        HSYS_GOTO_ERROR(H5E_DATATYPE, H5E_CANTSET, FAIL, "can't clear floating-point exceptions");
+    //if (feclearexcept(FE_INVALID) != 0)
+    //    HSYS_GOTO_ERROR(H5E_DATATYPE, H5E_CANTSET, FAIL, "can't clear floating-point exceptions");
 
     /* Restore the original environment */
     if (feupdateenv(&saved_fenv) != 0)
EOF
patch -p1 < float_exception.patch
mkdir bld && cd bld
emcmake cmake -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=1 -DBUILD_STATIC_LIBS=0 -DONLY_SHARED_LIBS=1 -DBUILD_TESTING=0 \
    -DCMAKE_C_FLAGS="-fPIC -Wno-incompatible-pointer-types-discards-qualifiers" \
    -DCMAKE_CXX_FLAGS="-fPIC -Wno-incompatible-pointer-types-discards-qualifiers" \
    -DCMAKE_SHARED_LINKER_FLAGS="${SIDE_MODULE_LDFLAGS} -s NODERAWFS=1 -sFORCE_FILESYSTEM=1" \
    -DHDF5_BUILD_EXAMPLES=0 -DHDF5_BUILD_TOOLS=0 -DHDF5_BUILD_UTILS=0 -DHDF5_BUILD_CPP_LIB=1 \
    -DHDF5_ENABLE_Z_LIB_SUPPORT=1 -DHDF5_ENABLE_ROS3_VFD=0 \
    -DCMAKE_INSTALL_PREFIX=${SYSROOT} .. && \
emmake make -j 8 install
cd $wd
rsync -av ${SYSROOT} ${EMSDK}/upstream/emscripten/cache

git clone https://github.com/beltoforion/muparser
cd muparser && git checkout v2.3.5 && mkdir bld && cd bld
emcmake cmake -DENABLE_SAMPLES=OFF \
              -DENABLE_OPENMP=OFF \
              -DENABLE_WIDE_CHAR=OFF \
              -DBUILD_SHARED_LIBS=OFF \
              -DCMAKE_CXX_FLAGS="-fPIC" \
              -DCMAKE_INSTALL_PREFIX=${SYSROOT} .. && \
emmake make -j 8 install
cd $wd
rsync -av ${SYSROOT} ${EMSDK}/upstream/emscripten/cache

wget https://ftp.gnu.org/gnu/gsl/gsl-2.8.tar.gz && tar zxf gsl-2.8.tar.gz && rm gsl-2.8.tar.gz && cd gsl-2.8
emconfigure ./configure CFLAGS="-fPIC" \
                        --enable-shared=no \
                        --prefix=${SYSROOT} && \
emmake make -j 8 && \
emmake make install
cd $wd
rsync -av ${SYSROOT} ${EMSDK}/upstream/emscripten/cache
