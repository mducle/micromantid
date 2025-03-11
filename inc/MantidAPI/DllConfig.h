#ifndef MANTID_API_DLL_H
#define MANTID_API_DLL_H

#define MANTID_API_DLL
#define EXTERN_MANTID_API

#ifndef DLLExport
#define DLLExport
#endif

#ifndef UNUSED_ARG
#define UNUSED_ARG(x) (void)x;
#endif

#endif /* MANTID_API_DLL_H */
#include "MantidKernel/System.h"
