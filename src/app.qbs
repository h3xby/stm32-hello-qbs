import qbs
import Stm32F4DiscoveryApplication

Stm32F4DiscoveryApplication {
    type: "application" // To suppress bundle generation on Mac
    consoleApplication: true

    Group {
        name: "sources"
        prefix: "./**/"
        files: [
            "*.c",
            "*.cpp",
            "*.h",
            "*.s"
        ]
        cpp.cxxFlags: [ "-std=c++11" ]
        cpp.cFlags: [ "-std=gnu99" ]
        cpp.warningLevel: "all"
    }
}

