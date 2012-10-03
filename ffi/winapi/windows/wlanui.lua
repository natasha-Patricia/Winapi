require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef DWORD WINAPI_WlanVersion; //Alias
  static const DWORD WLAN_UI_API_VERSION = 1;
  typedef UINT WL_DISPLAY_PAGES; //Alias
  static const UINT WLConnectionPage = 0;
  static const UINT WLSecurityPage = 1;
  WINAPI_ERROR_CODE WlanUIEditProfile( WINAPI_WlanVersion dwClientVersion, LPCWSTR wstrProfileName, GUID* pInterfaceGuid, HWND hWnd, WL_DISPLAY_PAGES wlStartPage, PVOID pReserved, PWLAN_REASON_CODE pWlanReasonCode);
]]
return ffi.load( 'Wlanui.dll' )
