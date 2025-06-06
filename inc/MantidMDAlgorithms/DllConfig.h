#ifndef MANTID_MDALGORITHMS_DLL_H
#define MANTID_MDALGORITHMS_DLL_H

#define MANTID_MDALGORITHMS_DLL
#define MANTID_MDALGORITHMS_NO_EXPORT

#ifndef MANTID_MDALGORITHMS_DEPRECATED
#  define MANTID_MDALGORITHMS_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef MANTID_MDALGORITHMS_DEPRECATED_EXPORT
#  define MANTID_MDALGORITHMS_DEPRECATED_EXPORT MANTID_MDALGORITHMS_DLL MANTID_MDALGORITHMS_DEPRECATED
#endif

#ifndef MANTID_MDALGORITHMS_DEPRECATED_NO_EXPORT
#  define MANTID_MDALGORITHMS_DEPRECATED_NO_EXPORT MANTID_MDALGORITHMS_NO_EXPORT MANTID_MDALGORITHMS_DEPRECATED
#endif

#ifndef MDALGORITHMS_DEPRECATED
    #define MDALGORITHMS_DEPRECATED(func) MANTID_MDALGORITHMS_DEPRECATED func
#endif

// MantidKernel/System.h will be removed
#include "MantidKernel/System.h"

#define EXTERN_MANTID_MDALGORITHMS
 
#endif /* MANTID_MDALGORITHMS_DLL_H */
