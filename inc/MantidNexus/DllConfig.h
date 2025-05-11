#ifndef MANTID_NEXUS_DLL_H
#define MANTID_NEXUS_DLL_H

#define MANTID_NEXUS_DLL
#define MANTID_NEXUS_NO_EXPORT

#ifndef MANTID_NEXUS_DEPRECATED
#  define MANTID_NEXUS_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef MANTID_NEXUS_DEPRECATED_EXPORT
#  define MANTID_NEXUS_DEPRECATED_EXPORT MANTID_NEXUS_DLL MANTID_NEXUS_DEPRECATED
#endif

#ifndef MANTID_NEXUS_DEPRECATED_NO_EXPORT
#  define MANTID_NEXUS_DEPRECATED_NO_EXPORT MANTID_NEXUS_NO_EXPORT MANTID_NEXUS_DEPRECATED
#endif

#ifndef NEXUS_DEPRECATED
    #define NEXUS_DEPRECATED(func) MANTID_NEXUS_DEPRECATED func
#endif

// MantidKernel/System.h will be removed
#include "MantidKernel/System.h"

// Use extern keyword in client code to suppress class template instantiation
#ifdef Nexus_EXPORTS
#define EXTERN_MANTID_NEXUS
#else
// EXTERN_IMPORT is defined in MantidKernel/System.h

#define EXTERN_MANTID_NEXUS EXTERN_IMPORT
#endif /* Nexus_EXPORTS*/

 
#endif /* MANTID_NEXUS_DLL_H */
