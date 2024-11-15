project "Main"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++20"
    staticruntime "off"

    files { "src/**.h", "src/**.cpp" }

    includedirs
    {
        "Source",
        --"../Core/Include",
        "../Lib/SQLiteCpp/include",
        "../Lib/SFML/include",
        "../Assets"
    }

    libdirs { "../Lib/SFML/lib" }

    filter "configurations:Debug"
        defines { "DEBUG" }
        runtime "Debug"
        symbols "On"
        links
        {
            --"Core",
            "sfml-graphics-d",
            "sfml-window-d",
            "sfml-system-d"
        }

    filter "configurations:Release"
        defines { "NDEBUG" }
        runtime "Release"
        optimize "On"
        symbols "On"
        links
        {
            --"Core",
            "sfml-graphics",
            "sfml-window",
            "sfml-system"
        }

    filter "configurations:Dist"
        defines { "DIST" }
        runtime "Release"
        optimize "On"
        symbols "Off"
        links
        {
            --"Core",
            "sfml-graphics",
            "sfml-window",
            "sfml-system"
        }

    targetdir ("../Binaries/%{cfg.buildcfg}/%{prj.name}")
    objdir ("../Binaries/Intermediates/%{cfg.buildcfg}/%{prj.name}")

    filter "system:windows"
        systemversion "latest"
        defines { "WINDOWS" }
