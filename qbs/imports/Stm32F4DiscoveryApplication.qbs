import qbs

Product {
    type: "application" // To suppress bundle generation on Mac
    consoleApplication: true

    property string stm32cubef4Path: "/opt/stm32cubef4/"

    Depends { name: "cpp" }
    cpp.includePaths: [
        "../config/",
        stm32cubef4Path + "/Drivers/CMSIS/Include/",
        stm32cubef4Path + "/Drivers/STM32F4xx_HAL_Driver/Inc",
        stm32cubef4Path + "/Drivers/BSP/STM32F4-Discovery",
        stm32cubef4Path + "/Drivers/CMSIS/Device/ST/STM32F4xx/Include"
    ]
    cpp.commonCompilerFlags: [
        "-mcpu=cortex-m4",
        "-mthumb",
        "-mfpu=fpv4-sp-d16",
        "-mfloat-abi=softfp"
    ]
    cpp.linkerFlags: [
        "-mcpu=cortex-m4",
        "-mthumb",
        "-mfpu=fpv4-sp-d16",
        "-mfloat-abi=softfp",
        "-Xlinker",
        "--gc-sections"
    ]

    cpp.positionIndependentCode: false
    cpp.executableSuffix: ".elf"

    cpp.defines: [
        "STM32F407xx",
        "USE_STDPERIPH_DRIVER",
        "HSE_VALUE=168000000",
    ]


    cpp.linkerScripts: [
        "../config/STM32F407VG_FLASH.ld"
    ]

    cpp.cxxFlags: [ "-std=c++11" ]
    cpp.cFlags: [ "-std=gnu99" ]
    cpp.warningLevel: 'all'

    Group {
        name: "bsp"
        prefix: stm32cubef4Path + "/Drivers/BSP/STM32F4-Discovery/"
        files: [
            "*.c"
        ]
        cpp.cxxFlags: [ "-std=c++11" ]
        cpp.cFlags: [ "-std=gnu99" ]
        cpp.warningLevel: "none"
    }
    Group {
        name: "hal"
        prefix: stm32cubef4Path + "/Drivers/STM32F4xx_HAL_Driver/Src/"
        files: [
            "*.c"
        ]
        cpp.warningLevel: "none"
    }
}
