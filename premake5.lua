workspace "Bismut"
    architecture "x64"

    configurations {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Bismut"
    location "Bismut"
    kind "SharedLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-obj/" .. outputdir .. "/%{prj.name}")

    files {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs {
        "%{prj.name}/src"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines {
            "BS_PLATFORM_WINDOWS",
            "BS_BUILD_DLL"
        }

        postbuildcommands {
            ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
        }

    filter "configurations:Debug"
        defines "BS_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "BS_RELEASE"
        optimize"On"

    filter "configurations:Dist"
        defines "BS_DIST"
        symbols "On"


project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"
    
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-obj/" .. outputdir .. "/%{prj.name}")
    
    files {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs {
        "%{prj.name}/src",
        "Bismut/src"
    }

    links {
        "Bismut"
    }
    
    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"
    
        defines {
            "BS_PLATFORM_WINDOWS"
        }
    
    filter "configurations:Debug"
        defines "BS_DEBUG"
        symbols "On"
    
    filter "configurations:Release"
        defines "BS_RELEASE"
        optimize"On"
    
    filter "configurations:Dist"
        defines "BS_DIST"
        optimize "On"