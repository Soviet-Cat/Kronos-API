#pragma once

#ifdef KAPI_EXPORT
    #define KAPI __declspec(dllexport)
#else
    #define KAPI __declspec(dllimport)
#endif

void KAPI func(float x);