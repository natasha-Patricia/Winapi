require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef UINT TRANSPORTPROVIDER_CALLBACK_ID; //Alias
  static const UINT WDS_TRANSPORTPROVIDER_CREATE_INSTANCE = 0;
  static const UINT WDS_TRANSPORTPROVIDER_COMPARE_CONTENT = 1;
  static const UINT WDS_TRANSPORTPROVIDER_OPEN_CONTENT = 2;
  static const UINT WDS_TRANSPORTPROVIDER_USER_ACCESS_CHECK = 3;
  static const UINT WDS_TRANSPORTPROVIDER_GET_CONTENT_SIZE = 4;
  static const UINT WDS_TRANSPORTPROVIDER_READ_CONTENT = 5;
  static const UINT WDS_TRANSPORTPROVIDER_CLOSE_CONTENT = 6;
  static const UINT WDS_TRANSPORTPROVIDER_CLOSE_INSTANCE = 7;
  static const UINT WDS_TRANSPORTPROVIDER_SHUTDOWN = 8;
  static const UINT WDS_TRANSPORTPROVIDER_DUMP_STATE = 9;
  static const UINT WDS_TRANSPORTPROVIDER_REFRESH_SETTINGS = 10;
  static const UINT WDS_TRANSPORTPROVIDER_GET_CONTENT_METADATA = 11;
  static const UINT WDS_TRANSPORTPROVIDER_MAX_CALLBACKS = 12;
  typedef UINT WDS_MC_SEVERITY; //Alias
  static const UINT WDS_MC_TRACE_VERBOSE = 0x00010000;
  static const UINT WDS_MC_TRACE_INFO = 0x00020000;
  static const UINT WDS_MC_TRACE_WARNING = 0x00040000;
  static const UINT WDS_MC_TRACE_ERROR = 0x00080000;
  static const UINT WDS_MC_TRACE_FATAL = 0x00010000;
  PVOID   WdsTransportServerAllocateBuffer(   HANDLE hProvider, ULONG ulBufferSize);
  HRESULT WdsTransportServerCompleteRead(     HANDLE hProvider, ULONG ulBytesRead, PVOID pvUserData, HRESULT hReadResult);
  HRESULT WdsTransportServerFreeBuffer(       HANDLE hProvider, PVOID pvBuffer);
  HRESULT WdsTransportServerRegisterCallback( HANDLE hProvider, TRANSPORTPROVIDER_CALLBACK_ID CallbackId, PVOID pfnCallback);
  HRESULT WdsTransportServerTrace(            HANDLE hProvider, WDS_MC_SEVERITY Severity, LPCWSTR pwszFormat);
  HRESULT WdsTransportServerTraceV(           HANDLE hProvider, WDS_MC_SEVERITY Severity, LPCWSTR pwszFormat, va_list Params);
]]
return ffi.load( 'Wdsmc.dll' )
