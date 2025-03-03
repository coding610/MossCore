workspace "moss"
    configurations { "debug", "release" }
    architecture "x86_64"
    location "scripts"
    toolset "clang"
    linkoptions { "-fuse-ld=lld" } -- use more modern LLVM linker than default
    buildoptions { "-Wno-macro-redefined"}

project "mossCore"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    targetdir "bin/%{cfg.buildcfg}"
    objdir "build/%{cfg.buildcfg}"

    files { "src/**.cpp" }
    includedirs { "include", "entt" }
    links { "raylib", "fmt" }

    filter "configurations:debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:release"
        defines { "NDEBUG" }
        optimize "On"
