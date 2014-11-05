list(APPEND WTF_INCLUDE_DIRECTORIES
    "${WTF_DIR}/icu"
)

list(APPEND WTF_SOURCES
    mac/DeprecatedSymbolsUsedBySafari.mm
    mac/MainThreadMac.mm

    ios/WebCoreThread.cpp

    text/cf/AtomicStringCF.cpp
    text/cf/StringCF.cpp
    text/cf/StringImplCF.cpp
    text/cf/StringViewCF.cpp

    text/mac/StringImplMac.mm
    text/mac/StringMac.mm
    text/mac/StringViewObjC.mm
)
