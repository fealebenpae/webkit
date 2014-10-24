find_library(COREFOUNDATION_LIBRARY CoreFoundation)
find_library(FOUNDATION_LIBRARY Foundation)
list(APPEND JavaScriptCore_LIBRARIES
    ${COREFOUNDATION_LIBRARY}
    ${FOUNDATION_LIBRARY}
    libicucore.dylib
)

list(APPEND JavaScriptCore_INCLUDE_DIRECTORIES
    "${WTF_DIR}/icu"
)

if (ENABLE_REMOTE_INSPECTOR)
    list(APPEND JavaScriptCore_SOURCES
        inspector/remote/RemoteInspector.mm
        inspector/remote/RemoteInspectorDebuggable.cpp
        inspector/remote/RemoteInspectorDebuggableConnection.mm
        inspector/remote/RemoteInspectorXPCConnection.mm
    )
endif ()

if (NOT DEFINED JSC_OBJC_API_ENABLED)
    set (JSC_OBJC_API_ENABLED ON)
endif ()

if (JSC_OBJC_API_ENABLED)
    list(APPEND JavaScriptCore_SOURCES
        API/JSAPIWrapperObject.mm
        API/JSContext.mm
        API/JSManagedValue.mm
        API/JSStringRefCF.cpp
        API/JSValue.mm
        API/JSVirtualMachine.mm
        API/JSWrapperMap.mm
        API/ObjCCallbackFunction.mm
    )
endif ()

add_definitions(-DSTATICALLY_LINKED_WITH_WTF -DJSC_OBJC_API_ENABLED=${JSC_OBJC_API_ENABLED})
