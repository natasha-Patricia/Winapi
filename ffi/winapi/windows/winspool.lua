require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/registry' )
local ffi = require( 'ffi' )
ffi.cdef [[
  BOOL              AddJob(                               HANDLE hPrinter, DWORD Level, LPBYTE pData, DWORD cbBuf, LPDWORD pcbNeeded);
  BOOL              AddMonitor(                           LPTSTR pName, DWORD Level, LPBYTE pMonitors);
  HANDLE            AddPrinter(                           LPTSTR* pName, DWORD Level, LPBYTE pPrinter);
  BOOL              AddPrinterConnection(                 LPTSTR pName);
  BOOL              AddPrinterConnection2(                HWND hWnd, LPCTSTR pszName, DWORD dwLevel, PVOID pConnectionInfo);
  BOOL              AddPrinterDriver(                     LPTSTR pName, DWORD Level, LPBYTE pDriverInfo);
  BOOL              AddPrinterDriverEx(                   LPTSTR pName, DWORD Level, LPBYTE pDriverInfo, DWORD dwFileCopyFlags);
  BOOL              AddPrintProcessor(                    LPTSTR pName, LPTSTR pEnvironment, LPTSTR pPathName, LPTSTR pPrintProcessorName);
  BOOL              AddPrintProvidor(                     LPTSTR pName, DWORD Level, LPBYTE pProviderInfo);
  BOOL              ConfigurePort(                        LPTSTR pName, HWND hWnd, LPTSTR pPortName);
  BOOL              DeleteForm(                           HANDLE hPrinter, LPTSTR pFormName);
  BOOL              DeleteMonitor(                        LPTSTR pName, LPTSTR pEnvironment, LPTSTR pMonitorName);
  BOOL              DeletePort(                           LPTSTR pName, HWND hWnd, LPTSTR pPortName);
  BOOL              DeletePrinterConnection(              LPTSTR pName);
  WINAPI_ERROR_CODE DeletePrinterData(                    HANDLE hPrinter, LPTSTR pValueName);
  WINAPI_ERROR_CODE DeletePrinterDataEx(                  HANDLE hPrinter, LPCTSTR pKeyName, LPCTSTR pValueName);
  BOOL              DeletePrinterDriver(                  LPTSTR pName, LPTSTR pEnvironment, LPTSTR pDriverName);
  BOOL              DeletePrinterDriverEx(                LPTSTR pName, LPTSTR pEnvironment, LPTSTR pDriverName, DWORD dwDeleteFlag, DWORD dwVersionFlag);
  WINAPI_ERROR_CODE DeletePrinterKey(                     HANDLE hPrinter, LPCTSTR pKeyName);
  BOOL              DeletePrintProcessor(                 LPTSTR pName, LPTSTR pEnvironment, LPTSTR pPrintProcessorName);
  BOOL              DeletePrintProvidor(                  LPTSTR pName, LPTSTR pEnvironment, LPTSTR pPrintProviderName);
  BOOL              EnumForms(                            HANDLE hPrinter, DWORD Level, LPBYTE pForm, DWORD cbBuf, LPDWORD pcbNeeded, LPDWORD pcReturned);
  BOOL              EnumJobs(                             HANDLE hPrinter, DWORD FirstJob, DWORD NoJobs, DWORD Level, LPBYTE pJob, DWORD cbBuf, LPDWORD pcbNeeded, LPDWORD pcReturned);
  BOOL              EnumMonitors(                         LPTSTR pName, DWORD Level, LPBYTE pMonitors, DWORD cbBuf, LPDWORD pcbNeeded, LPDWORD pcReturned);
  BOOL              EnumPorts(                            LPTSTR pName, DWORD Level, LPBYTE pPorts, DWORD cbBuf, LPDWORD pcbNeeded, LPDWORD pcReturned);
  WINAPI_ERROR_CODE EnumPrinterData(                      HANDLE hPrinter, DWORD dwIndex, LPTSTR pValueName, DWORD cbValueName, LPDWORD pcbValueName, LPDWORD pType, LPBYTE pData, DWORD cbData, LPDWORD pcbData);
  WINAPI_ERROR_CODE EnumPrinterDataEx(                    HANDLE hPrinter, LPCTSTR pKeyName, LPBYTE pEnumValues, DWORD cbEnumValues, LPDWORD pcbEnumValues, LPDWORD pnEnumValues);
  BOOL              EnumPrinterDrivers(                   LPTSTR pName, LPTSTR pEnvironment, DWORD Level, LPBYTE pDriverInfo, DWORD cbBuf, LPDWORD pcbNeeded, LPDWORD pcReturned);
  WINAPI_ERROR_CODE EnumPrinterKey(                       HANDLE hPrinter, LPCTSTR pKeyName, LPTSTR pSubkey, DWORD cbSubkey, LPDWORD pcbSubkey);
  BOOL              EnumPrinters(                         WINAPI_EnumPrintersFlags Flags, LPTSTR Name, DWORD Level, LPBYTE pPrinterEnum, DWORD cbBuf, LPDWORD pcbNeeded, LPDWORD pcReturned);
  BOOL              EnumPrintProcessorDatatypes(          LPTSTR pName, LPTSTR pPrintProcessorName, DWORD Level, LPBYTE pDatatypes, DWORD cbBuf, LPDWORD pcbNeeded, LPDWORD pcReturned);
  BOOL              EnumPrintProcessors(                  LPTSTR pName, LPTSTR pEnvironment, DWORD Level, LPBYTE pPrintProcessorInfo, DWORD cbBuf, LPDWORD pcbNeeded, LPDWORD pcReturned);
  BOOL              FlushPrinter(                         HANDLE hPrinter, LPVOID pBuf, DWORD cbBuf, LPDWORD pcWritten, DWORD cSleep);
  BOOL              GetForm(                              HANDLE hPrinter, LPTSTR pFormName, DWORD Level, LPBYTE pForm, DWORD cbBuf, LPDWORD pcbNeeded);
  BOOL              GetJob(                               HANDLE hPrinter, DWORD JobId, DWORD Level, LPBYTE pJob, DWORD cbBuf, LPDWORD pcbNeeded);
  BOOL              GetPrinter(                           HANDLE hPrinter, DWORD Level, LPBYTE pPrinter, DWORD cbBuf, LPDWORD pcbNeeded);
  WINAPI_ERROR_CODE GetPrinterData(                       HANDLE hPrinter, LPTSTR pValueName, WINAPI_RegType* pType, LPBYTE pData, DWORD nSize, LPDWORD pcbNeeded);
  WINAPI_ERROR_CODE GetPrinterDataEx(                     HANDLE hPrinter, LPCTSTR pKeyName, LPCTSTR pValueName, WINAPI_RegType* pType, LPBYTE pData, DWORD nSize, LPDWORD pcbNeeded);
  BOOL              GetPrinterDriver(                     HANDLE hPrinter, LPTSTR pEnvironment, DWORD Level, LPBYTE pDriverInfo, DWORD cbBuf, LPDWORD pcbNeeded);
  BOOL              GetPrinterDriverDirectory(            LPTSTR pName, LPTSTR pEnvironment, DWORD Level, LPWSTR pDriverDirectory, DWORD cbBuf, LPDWORD pcbNeeded);
  BOOL              GetPrintProcessorDirectory(           LPTSTR pName, LPTSTR pEnvironment, DWORD Level, LPBYTE pPrintProcessorInfo, DWORD cbBuf, LPDWORD pcbNeeded);
  BOOL              OpenPrinter(                          LPTSTR pPrinterName, LPHANDLE phPrinter, LPPRINTER_DEFAULTS pDefault);
  BOOL              ResetPrinter(                         HANDLE hPrinter, LPPRINTER_DEFAULTS pDefault);
  DWORD             StartDocPrinter(                      HANDLE hPrinter, DWORD Level, LPBYTE pDocInfo);
  BOOL              SetForm(                              HANDLE hPrinter, LPTSTR pFormName, DWORD Level, LPTSTR pForm);
  BOOL              SetJob(                               HANDLE hPrinter, DWORD JobId, DWORD Level, LPBYTE pJob, WINAPI_JobControl Command);
  BOOL              SetPort(                              LPTSTR pName, LPTSTR pPortName, DWORD dwLevel, LPBYTE pPortInfo);
  BOOL              SetPrinter(                           HANDLE hPrinter, DWORD Level, LPBYTE pPrinter, WINAPI_PrinterControl Command);
  WINAPI_ERROR_CODE SetPrinterData(                       HANDLE hPrinter, LPTSTR pValueName, WINAPI_RegType Type, LPBYTE pData, DWORD cbData);
  WINAPI_ERROR_CODE SetPrinterDataEx(                     HANDLE hPrinter, LPCTSTR pKeyName, LPCTSTR pValueName, WINAPI_RegType Type, LPBYTE pData, DWORD cbData);
  DWORD             DeviceCapabilities(                   LPCTSTR pDevice, LPCTSTR pPort, WINAPI_DeviceCapability fwCapability, LPTSTR pOutput, WINAPI_DEVMODE* pDevMode);
  HRESULT           CorePrinterDriverInstalled(           LPCTSTR pszServer, LPCTSTR pszEnvironment, GUID CoreDriverGUID, FILETIME ftDriverDate, DWORDLONG dwlDriverVersion, BOOL* pbDriverInstalled);
  HRESULT           DeletePrinterDriverPackage(           LPCTSTR pszServer, LPCTSTR pszInfPath, LPCTSTR pszEnvironment);
  HRESULT           GetCorePrinterDrivers(                LPCTSTR pszServer, LPCTSTR pszEnvironment, LPCTSTR pszzCoreDriverDependencies, DWORD cCorePrinterDrivers, PCORE_PRINTER_DRIVER pCorePrinterDrivers);
  HRESULT           GetPrinterDriverPackagePath(          LPCTSTR pszServer, LPCTSTR pszEnvironment, LPCTSTR pszLanguage, LPCTSTR pszPackageID, LPTSTR pszDriverPackageCab, DWORD cchDriverPackageCab, LPDWORD pcchRequiredSize);
  HRESULT           InstallPrinterDriverFromPackage(      LPCTSTR pszServer, LPCTSTR pszInfPath, LPCTSTR pszDriverName, LPCTSTR pszEnvironment, DWORD dwFlags);
  HRESULT           UploadPrinterDriverPackage(           LPCTSTR pszServer, LPCTSTR pszInfPath, LPCTSTR pszEnvironment, DWORD dwFlags, HWND hwnd, LPTSTR pszDestInfPath, PULONG pcchDestInfPath);
  BOOL              AbortPrinter(                         HANDLE hPrinter);
  BOOL              AddForm(                              HANDLE hPrinter, DWORD Level, LPBYTE pForm);
  BOOL              AddPort(                              LPTSTR pName, HWND hWnd, LPTSTR pMonitorName);
  LONG              AdvancedDocumentProperties(           HWND hWnd, HANDLE hPrinter, LPTSTR pDeviceName, PDEVMODE pDevModeOutput, PDEVMODE pDevModeInput);
  BOOL              ClosePrinter(                         HANDLE hPrinter);
  HANDLE            ConnectToPrinterDlg(                  HWND hwnd, DWORD Flags);
  HRESULT           CreatePrintAsyncNotifyChannel(        LPCWSTR pName, PrintAsyncNotificationType* pSchema, PrintAsyncNotifyUserFilter filter, PrintAsyncNotifyConversationStyle directionality, IPrintAsyncNotifyCallback* pCallback, IPrintAsyncNotifyChannel** ppChannel);
  BOOL              DeletePrinter(                        HANDLE hPrinter);
  LONG              DocumentProperties(                   HWND hWnd, HANDLE hPrinter, LPTSTR pDeviceName, PDEVMODE pDevModeOutput, PDEVMODE pDevModeInput, WINAPI_DocumentMode fMode);
  BOOL              EndDocPrinter(                        HANDLE hPrinter);
  BOOL              EndPagePrinter(                       HANDLE hPrinter);
  BOOL              FindClosePrinterChangeNotification(   HANDLE hChange);
  HANDLE            FindFirstPrinterChangeNotification(   HANDLE hPrinter, WINAPI_PrinterChangeFlags fdwFilter, DWORD fdwOptions, PPRINTER_NOTIFY_OPTIONS pPrinterNotifyOptions);
  BOOL              FindNextPrinterChangeNotification(    HANDLE hChange, WINAPI_PrinterChangeFlags* pdwChange, PPRINTER_NOTIFY_OPTIONS pPrinterNotifyOptions, LPVOID* ppPrinterNotifyInfo);
  BOOL              FreePrinterNotifyInfo(                PPRINTER_NOTIFY_INFO pPrinterNotifyInfo);
  BOOL              GetDefaultPrinter(                    LPTSTR pszBuffer, LPDWORD pcchBuffer);
  BOOL              GetPrinterDriver2(                    HWND hWnd, HANDLE hPrinter, LPTSTR pEnvironment, DWORD Level, LPBYTE pDriverInfo, DWORD cbBuf, LPDWORD pcbNeeded);
  BOOL              OpenPrinter2(                         LPCTSTR pPrinterName, LPHANDLE phPrinter, LPPRINTER_DEFAULTS pDefault, PPRINTER_OPTIONS pOptions);
  BOOL              PrinterProperties(                    HWND hWnd, HANDLE hPrinter);
  BOOL              ReadPrinter(                          HANDLE hPrinter, LPVOID pBuf, DWORD cbBuf, LPDWORD pNoBytesRead);
  HRESULT           RegisterForPrintAsyncNotifications(   LPCWSTR pName, PrintAsyncNotificationType* pSchema, PrintAsyncNotifyUserFilter filter, PrintAsyncNotifyConversationStyle directionality, IPrintAsyncNotifyCallback* pCallback, HANDLE* pRegistrationHandler);
  HRESULT           ReportJobProcessingProgress(          HANDLE printerHandle, ULONG jobId, EPrintXPSJobOperation jobOperation, EPrintXPSJobProgress jobProgress);
  BOOL              ScheduleJob(                          HANDLE hPrinter, DWORD dwJobID);
  BOOL              SetDefaultPrinter(                    LPCTSTR pszPrinter);
  BOOL              StartPagePrinter(                     HANDLE hPrinter);
  HRESULT           UnRegisterForPrintAsyncNotifications( HANDLE hRegistrationHandler);
  BOOL              WritePrinter(                         HANDLE hPrinter, LPVOID pBuf, DWORD cbBuf, LPDWORD pcWritten);
]]
return ffi.load( 'Winspool.drv' )
