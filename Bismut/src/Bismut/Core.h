#pragma once


// ------- Basic makros for dll binding on windows -------------

#ifdef BS_PLATFORM_WINDOWS
	#ifdef BS_BUILD_DLL
		#define BISMUT_API __declspec(dllexport)

	#else
		#define BISMUT_API __declspec(dllimport)

	#endif // BS_BUIDL_DLL

#else
	#error Bismut is only supported for windows!

#endif // BS_PLATFORM_WINDOWS

// -------------------------------------------------------------