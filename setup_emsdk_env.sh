#!/bin/bash

set -e

export SYSROOT=`pwd`/sysroot

$MAMBA_EXE create -y -n ems -c conda-forge python=3.12 pybind11 cmake eigen pyodide-build gtest rsync
eval "$($MAMBA_EXE shell activate ems --shell=bash)"
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
./b2 variant=release toolset=clang-emscripten threading=single \
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
cd poco && git checkout poco-1.14.0-release 
cat <<EOF > overrideprops.cmake
set_property(GLOBAL PROPERTY TARGET_SUPPORTS_SHARED_LIBS TRUE)
set(CMAKE_SHARED_LIBRARY_CREATE_C_FLAGS "-s WASM_BIGINT -s SIDE_MODULE=1")
set(CMAKE_SHARED_LIBRARY_CREATE_CXX_FLAGS "-s WASM_BIGINT -s SIDE_MODULE=1")
set(CMAKE_STRIP FALSE)
EOF
cat <<EOF > foundationcmake.diff
diff --git a/Foundation/CMakeLists.txt b/Foundation/CMakeLists.txt
index 5898d22f5..e985cc39a 100644
--- a/Foundation/CMakeLists.txt
+++ b/Foundation/CMakeLists.txt
@@ -159,7 +159,7 @@ else()
 				target_link_libraries(Foundation PUBLIC \${CMAKE_DL_LIBS} rt Threads::Threads)
 			else()
 				target_compile_definitions(Foundation PUBLIC _XOPEN_SOURCE=500 POCO_HAVE_FD_EPOLL)
-				target_link_libraries(Foundation PUBLIC pthread atomic \${CMAKE_DL_LIBS} rt)
+				target_link_libraries(Foundation PUBLIC pthread \${CMAKE_DL_LIBS} rt)
 			endif()
 		endif(APPLE)
 	endif(UNIX AND NOT ANDROID)
EOF
patch -p1 < foundationcmake.diff
mkdir bld && cd bld && \
  emcmake cmake -DENABLE_ACTIVERECORD_COMPILER=OFF \
                -DENABLE_PAGECOMPILER=OFF \
                -DENABLE_PAGECOMPILER_FILE2PAGE=off \
                -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
                -DBUILD_SHARED_LIBS=ON \
                -DCMAKE_PROJECT_INCLUDE=overrideprops.cmake \
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
cat <<EOF > disable_progs.patch
--- gsl-2.8/Makefile.in	2024-05-25 14:26:32.000000000 +0100
+++ gsl-2.8/Makefile.in	2025-10-23 21:44:37.061488497 +0100
@@ -94,7 +94,7 @@
 POST_UNINSTALL = :
 build_triplet = @build@
 host_triplet = @host@
-bin_PROGRAMS = gsl-randist\$(EXEEXT) gsl-histogram\$(EXEEXT)
+bin_PROGRAMS = 
 subdir = .
 ACLOCAL_M4 = \$(top_srcdir)/aclocal.m4
 am__aclocal_m4_deps = \$(top_srcdir)/configure.ac
--- gsl-2.8/configure	2024-05-25 14:26:49.000000000 +0100
+++ gsl-2.8/configure	2025-10-23 23:14:36.955089054 +0100
@@ -10634,7 +10634,7 @@
     && test no = "\$tmp_diet"
       then
    tmp_addflag=' \$pic_flag'
-   tmp_sharedflag='-shared'
+   tmp_sharedflag='-s WASM_BIGINT -s SIDE_MODULE=1'
    case \$cc_basename,\$host_cpu in
         pgcc*)             # Portland Group C compiler
      whole_archive_flag_spec=
@@ -11733,7 +11733,7 @@
      then
        lt_cv_archive_cmds_need_lc=no
      else
-       lt_cv_archive_cmds_need_lc=yes
+       lt_cv_archive_cmds_need_lc=no
      fi
      allow_undefined_flag=\$lt_save_allow_undefined_flag
    else
EOF
patch -p1 --ignore-whitespace < disable_progs.patch
emconfigure ./configure CFLAGS="-fPIC" \
                        --enable-shared=yes \
                        --disable-dependency-tracking \
                        --prefix=${SYSROOT} && \
emmake make -j 8 && \
emmake make install
cd $wd
rsync -av ${SYSROOT} ${EMSDK}/upstream/emscripten/cache
