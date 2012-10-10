require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/registry' )
require( 'ffi/winapi/headers/shell' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef HANDLE HUSKEY; //Alias
  typedef HUSKEY *PHUSKEY; //Pointer
  typedef ERROR_CODE LSTATUS; //Alias
  typedef void* IConnectionPoint; //Interface
  typedef void* IObjectWithSite; //Interface
  typedef void* IXMLDOMNode; //Interface
  typedef void* IPropertyBag; //Interface
  typedef UINT SHREGENUM_FLAGS; //Alias
  static const SHREGENUM_FLAGS SHREGENUM_DEFAULT = 0x00000000;
  static const SHREGENUM_FLAGS SHREGENUM_HKCU = 0x00000001;
  static const SHREGENUM_FLAGS SHREGENUM_HKLM = 0x00000010;
  static const SHREGENUM_FLAGS SHREGENUM_BOTH = 0x00000011;
  typedef UINT SHREGDEL_FLAGS; //Alias
  static const SHREGDEL_FLAGS SHREGDEL_DEFAULT = 0x00000000;
  static const SHREGDEL_FLAGS SHREGDEL_HKCU = 0x00000001;
  static const SHREGDEL_FLAGS SHREGDEL_HKLM = 0x00000010;
  static const SHREGDEL_FLAGS SHREGDEL_BOTH = 0x00000011;
  typedef UINT ShRegSetFlags; //Alias
  typedef DWORD SHCT_FLAGS; //Alias
  typedef UINT STIF_FLAGS; //Alias
  typedef UINT SFBS_FLAGS; //Alias
  typedef UINT SRRF; //Alias
  typedef struct QITAB {
    IID* piid;
    int dwOffset;
  } QITAB;
  typedef QITAB *LPCQITAB; //Pointer
  typedef UINT URLIS; //Alias
  static const URLIS URLIS_URL = 0;
  static const URLIS URLIS_OPAQUE = 1;
  static const URLIS URLIS_NOHISTORY = 2;
  static const URLIS URLIS_FILEURL = 3;
  static const URLIS URLIS_APPLIABLE = 4;
  static const URLIS URLIS_DIRECTORY = 5;
  static const URLIS URLIS_HASQUERY = 6;
  typedef UINT URL_SCHEME; //Alias
  static const URL_SCHEME URL_SCHEME_INVALID = -1;
  static const URL_SCHEME URL_SCHEME_UNKNOWN = 0;
  static const URL_SCHEME URL_SCHEME_FTP = 1;
  static const URL_SCHEME URL_SCHEME_HTTP = 2;
  static const URL_SCHEME URL_SCHEME_GOPHER = 3;
  static const URL_SCHEME URL_SCHEME_MAILTO = 4;
  static const URL_SCHEME URL_SCHEME_NEWS = 5;
  static const URL_SCHEME URL_SCHEME_NNTP = 6;
  static const URL_SCHEME URL_SCHEME_TELNET = 7;
  static const URL_SCHEME URL_SCHEME_WAIS = 8;
  static const URL_SCHEME URL_SCHEME_FILE = 9;
  static const URL_SCHEME URL_SCHEME_MK = 10;
  static const URL_SCHEME URL_SCHEME_HTTPS = 11;
  static const URL_SCHEME URL_SCHEME_SHELL = 12;
  static const URL_SCHEME URL_SCHEME_SNEWS = 13;
  static const URL_SCHEME URL_SCHEME_LOCAL = 14;
  static const URL_SCHEME URL_SCHEME_JAVASCRIPT = 15;
  static const URL_SCHEME URL_SCHEME_VBSCRIPT = 16;
  static const URL_SCHEME URL_SCHEME_ABOUT = 17;
  static const URL_SCHEME URL_SCHEME_RES = 18;
  static const URL_SCHEME URL_SCHEME_MSSHELLROOTED = 19;
  static const URL_SCHEME URL_SCHEME_MSSHELLIDLIST = 20;
  static const URL_SCHEME URL_SCHEME_MSHELP = 21;
  static const URL_SCHEME URL_SCHEME_MSSHELLDEVICE = 22;
  static const URL_SCHEME URL_SCHEME_WILDCARD = 23;
  static const URL_SCHEME URL_SCHEME_SEARCH_MS = 24;
  static const URL_SCHEME URL_SCHEME_SEARCH = 25;
  static const URL_SCHEME URL_SCHEME_KNOWNFOLDER = 26;
  static const URL_SCHEME URL_SCHEME_MAXVALUE = 27;
  typedef struct PARSEDURL {
    DWORD cbSize;
    LPCTSTR pszProtocol;
    UINT cchProtocol;
    LPCTSTR pszSuffix;
    UINT cchSuffix;
    URL_SCHEME nScheme;
  } PARSEDURL;
  typedef UINT SHGLOBALCOUNTER; //Alias
  static const SHGLOBALCOUNTER GLOBALCOUNTER_SEARCHMANAGER = 0;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_SEARCHOPTIONS = 1;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_FOLDERSETTINGSCHANGE = 2;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RATINGS = 3;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_APPROVEDSITES = 4;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RESTRICTIONS = 5;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_SHELLSETTINGSCHANGED = 6;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_SYSTEMPIDLCHANGE = 7;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_OVERLAYMANAGER = 8;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_QUERYASSOCIATIONS = 9;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_IESESSIONS = 10;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_IEONLY_SESSIONS = 11;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_APPLICATION_DESTINATIONS = 12;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_CSCSYNCINPROGRESS = 13;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_BITBUCKETNUMDELETERS = 14;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_SHARES = 15;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_A = 16;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_B = 17;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_C = 18;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_D = 19;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_E = 20;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_F = 21;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_G = 22;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_H = 23;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_I = 24;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_J = 25;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_K = 26;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_L = 27;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_M = 28;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_N = 29;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_O = 30;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_P = 31;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_Q = 32;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_R = 33;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_S = 34;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_T = 35;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_U = 36;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_V = 37;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_W = 38;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_X = 39;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_Y = 40;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_Z = 41;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEDIRTYCOUNT_SERVERDRIVE = 42;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEGLOBALDIRTYCOUNT = 43;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEBINENUM = 44;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RECYCLEBINCORRUPTED = 45;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_RATINGS_STATECOUNTER = 46;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_PRIVATE_PROFILE_CACHE = 47;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_INTERNETTOOLBAR_LAYOUT = 48;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_FOLDERDEFINITION_CACHE = 49;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_COMMONPLACES_LIST_CACHE = 50;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_PRIVATE_PROFILE_CACHE_MACHINEWIDE = 51;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_ASSOCCHANGED = 52;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_APP_ITEMS_STATE_STORE_CACHE = 53;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_IMMERSIVE_SCALE_CACHE = 54;
  static const SHGLOBALCOUNTER GLOBALCOUNTER_SETTINGSYNC_ENABLED = 55;
  typedef SHGLOBALCOUNTER SHGLOBALCOUNTER; //Alias
  HANDLE           SHAllocShared(                       void* pvData, DWORD dwSize, DWORD dwDestinationProcessId);
  MessageBoxResult ShellMessageBox(                     HINSTANCE hInst, HWND hWnd, LPCTSTR pszMsg, LPCTSTR pszTitle, MessageBoxType fuStyle);
  HRESULT          SHGetViewStatePropertyBag(           PCIDLIST_ABSOLUTE pidl, LPCWSTR pszBagName, DWORD dwFlags, REFIID riid, void** ppv);
  LPVOID           SHLockShared(                        HANDLE* hData, DWORD dwOtherProcId);
  BOOL             SHUnlockShared(                      void* pvData);
  BOOL             SHFreeShared(                        HANDLE hData, DWORD dwSourceProcId);
  LPCWSTR          StrStrNW(                            LPCWSTR lpFirst, LPCWSTR lpSrch, UINT cchMax);
  LPCWSTR          StrStrNIW(                           LPCWSTR lpFirst, LPCWSTR lpSrch, UINT cchMax);
  COLORREF         ColorAdjustLuma(                     COLORREF clrRGB, int n, BOOL fScale);
  COLORREF         ColorHLSToRGB(                       WORD wHue, WORD wLuminance, WORD wSaturation);
  void             ColorRGBToHLS(                       COLORREF clrRGB, WORD* pwHue, WORD* pwLuminance, WORD* pwSaturation);
  HPALETTE         SHCreateShellPalette(                HDC hdc);
  HRESULT          SHGetInverseCMAP(                    BYTE* pbMap, ULONG cbMap);
  LPTSTR           PathAddBackslash(                    LPTSTR lpszPath);
  BOOL             PathAddExtension(                    LPTSTR pszPath, LPCTSTR pszExtension);
  BOOL             PathAppend(                          LPTSTR pszPath, LPCTSTR pszMore);
  LPTSTR           PathBuildRoot(                       LPTSTR szRoot, int iDrive);
  BOOL             PathCanonicalize(                    LPTSTR lpszDst, LPCTSTR lpszSrc);
  LPTSTR           PathCombine(                         LPTSTR lpszDest, LPCTSTR lpszDir, LPCTSTR lpszFile);
  int              PathCommonPrefix(                    LPCTSTR pszFile1, LPCTSTR pszFile2, LPTSTR pszPath);
  BOOL             PathCompactPath(                     HDC hDC, LPTSTR lpszPath, UINT dx);
  BOOL             PathCompactPathEx(                   LPTSTR pszOut, LPCTSTR pszSrc, UINT cchMax, DWORD dwFlags);
  HRESULT          PathCreateFromUrl(                   PCTSTR pszUrl, PTSTR pszPath, DWORD* pcchPath, DWORD dwFlags);
  HRESULT          PathCreateFromUrlAlloc(              PCWSTR pszIn, PWSTR* ppszOut, DWORD dwFlags);
  BOOL             PathFileExists(                      LPCTSTR pszPath);
  PTSTR            PathFindExtension(                   PTSTR pszPath);
  PTSTR            PathFindFileName(                    PTSTR pPath);
  PTSTR            PathFindNextComponent(               PTSTR pszPath);
  BOOL             PathFindOnPath(                      LPTSTR pszFile, LPCTSTR* ppszOtherDirs);
  LPCTSTR          PathFindSuffixArray(                 LPCTSTR pszPath, LPCTSTR* apszSuffix, int iArraySize);
  PTSTR            PathGetArgs(                         PTSTR pszPath);
  UINT             PathGetCharType(                     TCHAR ch);
  int              PathGetDriveNumber(                  LPCTSTR lpsz);
  BOOL             PathIsContentType(                   LPCTSTR pszPath, LPCTSTR pszContentType);
  BOOL             PathIsDirectory(                     LPCTSTR pszPath);
  BOOL             PathIsDirectoryEmpty(                LPCTSTR pszPath);
  BOOL             PathIsFileSpec(                      LPCTSTR lpszPath);
  BOOL             PathIsHTMLFile(                      LPCTSTR pszFile);
  BOOL             PathIsLFNFileSpec(                   LPCTSTR pszName);
  BOOL             PathIsNetworkPath(                   LPCTSTR pszPath);
  BOOL             PathIsPrefix(                        LPCTSTR pszPrefix, LPCTSTR pszPath);
  BOOL             PathIsRelative(                      LPCTSTR lpszPath);
  BOOL             PathIsRoot(                          LPCTSTR pPath);
  BOOL             PathIsSameRoot(                      LPCTSTR pszPath1, LPCTSTR pszPath2);
  BOOL             PathIsSystemFolder(                  LPCTSTR pszPath, DWORD dwAttrb);
  BOOL             PathIsUNC(                           LPCTSTR pszPath);
  BOOL             PathIsUNCServer(                     LPCTSTR pszPath);
  BOOL             PathIsUNCServerShare(                LPCTSTR pszPath);
  BOOL             PathIsURL(                           LPCTSTR pszPath);
  BOOL             PathMakePretty(                      LPTSTR lpPath);
  BOOL             PathMakeSystemFolder(                LPTSTR pszPath);
  BOOL             PathMatchSpec(                       LPCSTR pszFile, LPCSTR pszSpec);
  HRESULT          PathMatchSpecEx(                     LPCTSTR pszFile, LPCTSTR pszSpec, DWORD dwFlags);
  int              PathParseIconLocation(               LPTSTR pszIconFile);
  BOOL             PathQuoteSpaces(                     LPTSTR lpsz);
  BOOL             PathRelativePathTo(                  LPTSTR pszPath, LPCTSTR pszFrom, DWORD dwAttrFrom, LPCTSTR pszTo, DWORD dwAttrTo);
  void             PathRemoveArgs(                      LPTSTR pszPath);
  LPTSTR           PathRemoveBackslash(                 LPTSTR lpszPath);
  void             PathRemoveBlanks(                    LPTSTR lpszString);
  void             PathRemoveExtension(                 LPTSTR pszPath);
  BOOL             PathRemoveFileSpec(                  LPTSTR pszPath);
  BOOL             PathRenameExtension(                 LPTSTR pszPath, LPCTSTR pszExt);
  BOOL             PathSearchAndQualify(                LPCTSTR pcszPath, LPTSTR pszFullyQualifiedPath, UINT cchFullyQualifiedPath);
  void             PathSetDlgItemPath(                  HWND hDlg, int id, LPCSTR pszPath);
  PTSTR            PathSkipRoot(                        PTSTR pszPath);
  void             PathStripPath(                       LPTSTR pszPath);
  BOOL             PathStripToRoot(                     LPTSTR szRoot);
  void             PathUndecorate(                      LPTSTR pszPath);
  BOOL             PathUnExpandEnvStrings(              LPCTSTR pszPath, LPTSTR pszBuf, UINT cchBuf);
  BOOL             PathUnmakeSystemFolder(              LPTSTR pszPath);
  void             PathUnquoteSpaces(                   LPTSTR lpsz);
  BOOL             SHSkipJunction(                      IBindCtx* pbc, CLSID* pclsid);
  HRESULT          UrlApplyScheme(                      PCTSTR pszIn, PTSTR pszOut, DWORD* pcchOut, DWORD dwFlags);
  HRESULT          UrlCanonicalize(                     PCTSTR pszUrl, PTSTR pszCanonicalized, DWORD* pcchCanonicalized, DWORD dwFlags);
  HRESULT          UrlCombine(                          PCTSTR pszBase, PCTSTR pszRelative, PTSTR pszCombined, DWORD* pcchCombined, DWORD dwFlags);
  int              UrlCompare(                          PCTSTR psz1, PCTSTR psz2, BOOL fIgnoreSlash);
  HRESULT          UrlCreateFromPath(                   PCTSTR pszPath, PTSTR pszUrl, DWORD* pcchUrl, DWORD dwFlags);
  HRESULT          UrlEscape(                           PCTSTR pszURL, PTSTR pszEscaped, DWORD* pcchEscaped, DWORD dwFlags);
  HRESULT          UrlEscapeSpaces(                     LPCTSTR pszURL, LPTSTR pszEscaped, LPDWORD pcchEscaped);
  HRESULT          UrlFixupW(                           PCWSTR pcszUrl, PWSTR pszTranslatedUrl, DWORD cchMax);
  LPCTSTR          UrlGetLocation(                      PCTSTR pszURL);
  HRESULT          UrlGetPart(                          PCTSTR pszIn, PTSTR pszOut, DWORD* pcchOut, DWORD dwPart, DWORD dwFlags);
  HRESULT          UrlHash(                             PCTSTR pszURL, BYTE* pbHash, DWORD cbHash);
  BOOL             UrlIs(                               PCTSTR pszUrl, URLIS UrlIs);
  BOOL             UrlIsFileUrl(                        LPCTSTR pszUrl);
  BOOL             UrlIsNoHistory(                      PCTSTR pszURL);
  BOOL             UrlIsOpaque(                         PCTSTR pszURL);
  HRESULT          UrlUnescape(                         PTSTR pszURL, PTSTR pszUnescaped, DWORD* pcchUnescaped, DWORD dwFlags);
  HRESULT          UrlUnescapeInPlace(                  LPTSTR pszURL, DWORD dwFlags);
  HRESULT          AssocCreate(                         CLSID clsid, REFIID riid, void** ppv);
  HRESULT          AssocGetPerceivedType(               PCWSTR pszExt, PERCEIVED* ptype, PERCEIVEDFLAG* pflag, PWSTR* ppszType);
  BOOL             AssocIsDangerous(                    PCWSTR pszAssoc);
  HRESULT          AssocQueryKey(                       ASSOCF flags, ASSOCKEY key, LPCTSTR pszAssoc, LPCTSTR pszExtra, HKEY* phkeyOut);
  HRESULT          AssocQueryString(                    ASSOCF flags, ASSOCSTR str, LPCTSTR pszAssoc, LPCTSTR pszExtra, LPTSTR pszOut, DWORD* pcchOut);
  HRESULT          AssocQueryStringByKey(               ASSOCF flags, ASSOCSTR str, HKEY hkAssoc, LPCTSTR pszExtra, LPTSTR pszOut, DWORD* pcchOut);
  LSTATUS          SHCopyKey(                           HKEY hkeySrc, LPCTSTR pszSrcSubKey, HKEY hkeyDest, DWORD fReserved);
  LSTATUS          SHDeleteEmptyKey(                    HKEY hkey, LPCTSTR pszSubKey);
  LSTATUS          SHDeleteKey(                         HKEY hkey, LPCTSTR pszSubKey);
  LSTATUS          SHDeleteValue(                       HKEY hkey, LPCTSTR pszSubKey, LPCTSTR pszValue);
  LSTATUS          SHEnumKeyEx(                         HKEY hkey, DWORD dwIndex, LPTSTR pszName, LPDWORD pcchName);
  LSTATUS          SHEnumValue(                         HKEY hkey, DWORD dwIndex, LPTSTR pszValueName, LPDWORD pcchValueName, RegType* pdwType, LPVOID pvData, LPDWORD pcbData);
  LSTATUS          SHGetValue(                          HKEY hkey, LPCTSTR pszSubKey, LPCTSTR pszValue, RegType* pdwType, LPVOID pvData, LPDWORD pcbData);
  IStream*         SHOpenRegStream(                     HKEY hkey, LPCTSTR pszSubkey, LPCTSTR pszValue, STGM_FLAGS grfMode);
  IStream*         SHOpenRegStream2(                    HKEY hkey, LPCTSTR pszSubkey, LPCTSTR pszValue, STGM_FLAGS grfMode);
  LSTATUS          SHQueryInfoKey(                      HKEY hkey, LPDWORD pcSubKeys, LPDWORD pcchMaxSubKeyLen, LPDWORD pcValues, LPDWORD pcchMaxValueNameLen);
  ERROR_CODE       SHQueryValueEx(                      HKEY hkey, LPCTSTR pszValue, LPDWORD pdwReserved, RegType* pdwType, LPVOID pvData, LPDWORD pcbData);
  LSTATUS          SHRegCloseUSKey(                     HUSKEY hUSKey);
  LSTATUS          SHRegCreateUSKey(                    LPCTSTR pszPath, REGSAM samDesired, HUSKEY hRelativeUSKey, PHUSKEY phNewUSKey, ShRegSetFlags dwFlags);
  LSTATUS          SHRegDeleteEmptyUSKey(               HUSKEY hUSKey, LPCSTR pszValue, SHREGDEL_FLAGS delRegFlags);
  LSTATUS          SHRegDeleteUSValue(                  HUSKEY hUSKey, LPCTSTR pszValue, SHREGDEL_FLAGS delRegFlags);
  HKEY             SHRegDuplicateHKey(                  HKEY hkey);
  LSTATUS          SHRegEnumUSKey(                      HUSKEY hUSKey, DWORD dwIndex, LPTSTR pszName, LPDWORD pcchName, SHREGENUM_FLAGS enumRegFlags);
  LSTATUS          SHRegEnumUSValue(                    HUSKEY hUSKey, DWORD dwIndex, LPTSTR pszValueName, LPDWORD pcchValueNameLen, RegType* pdwType, void* pvData, LPDWORD pcbData, SHREGENUM_FLAGS enumRegFlags);
  BOOL             SHRegGetBoolUSValue(                 LPCTSTR pszSubKey, LPCTSTR pszValue, BOOL fIgnoreHKCU, BOOL fDefault);
  int              SHRegGetIntW(                        HKEY hk, LPCWSTR szKey, int nDefault);
  LSTATUS          SHRegGetPath(                        HKEY hkey, LPCTSTR pszSubkey, LPCTSTR pszValue, LPTSTR pszPath, DWORD dwFlags);
  LSTATUS          SHRegGetUSValue(                     LPCTSTR pszSubKey, LPCTSTR pszValue, DWORD* pdwType, void* pvData, DWORD* pcbData, BOOL fIgnoreHKCU, void* pvDefaultData, DWORD dwDefaultDataSize);
  LSTATUS          SHRegGetValue(                       HKEY hkey, LPCTSTR pszSubKey, LPCTSTR pszValue, SRRF srrfFlags, LPDWORD pdwType, LPVOID pvData, LPDWORD pcbData);
  LSTATUS          SHRegOpenUSKey(                      LPCTSTR pszPath, REGSAM samDesired, HUSKEY hRelativeUSKey, PHUSKEY phNewUSKey, BOOL fIgnoreHKCU);
  LSTATUS          SHRegQueryInfoUSKey(                 HUSKEY hUSKey, LPDWORD pcSubKeys, LPDWORD pcchMaxSubKeyLen, LPDWORD pcValues, LPDWORD pcchMaxValueNameLen, SHREGENUM_FLAGS enumRegFlags);
  LSTATUS          SHRegQueryUSValue(                   HUSKEY hUSKey, LPCTSTR pszValue, RegType* pdwType, LPVOID pvData, LPDWORD pcbData, BOOL fIgnoreHKCU, LPVOID pvDefaultData, DWORD dwDefaultDataSize);
  LSTATUS          SHRegSetPath(                        HKEY hkey, LPCTSTR pszSubkey, LPCTSTR pszValue, LPCTSTR pszPath, DWORD dwFlags);
  LSTATUS          SHRegSetUSValue(                     LPCTSTR pszSubKey, LPCTSTR pszValue, DWORD dwType, LPVOID pvData, DWORD cbData, DWORD dwFlags);
  LSTATUS          SHRegSetValue(                       HKEY hkey, LPCTSTR pszSubKey, LPCTSTR pszValue, SRRF srrfFlags, DWORD dwType, LPCVOID pvData, DWORD cbData);
  LSTATUS          SHRegWriteUSValue(                   HUSKEY hUSKey, LPCTSTR pszValue, DWORD dwType, LPVOID pvData, DWORD cbData, DWORD dwFlags);
  LSTATUS          SHSetValue(                          HKEY hkey, LPCTSTR pszSubKey, LPCTSTR pszValue, RegType dwType, LPCVOID pvData, DWORD cbData);
  LPWSTR           CharLowerWrapW(                      LPWSTR pch);
  DWORD            CharUpperBuffWrapW(                  LPWSTR pch, DWORD cchLength);
  BOOL             ChrCmpI(                             TCHAR w1, TCHAR w2);
  int              CompareStringWrapW(                  LCID Locale, DWORD dwCmpFlags, LPCWSTR lpString1, int cchCount1, LPCWSTR lpString2, int cchCount2);
  HRESULT          GetAcceptLanguages(                  LPTSTR pszLanguages, DWORD* pcchLanguages);
  int              GetDateFormatWrapW(                  LCID Locale, DWORD dwFlags, SYSTEMTIME* lpDate, LPCWSTR pwzFormat, LPWSTR pwzDateStr, int cchDate);
  int              GetTimeFormatWrapW(                  LCID Locale, DWORD dwFlags, SYSTEMTIME* lpTime, LPCWSTR pwzFormat, LPWSTR pwzTimeStr, int cchTime);
  BOOL             IntlStrEqN(                          LPCTSTR pszStr1, LPCTSTR pszStr2, int nChar);
  BOOL             IntlStrEqNI(                         LPCTSTR pszStr1, LPCTSTR pszStr2, int nChar);
  BOOL             IntlStrEqWorker(                     BOOL fCaseSens, LPCTSTR pszStr1, LPCTSTR pszStr2, int nChar);
  BOOL             IsCharAlphaNumericWrapW(             WCHAR ch);
  BOOL             IsCharSpace(                         TCHAR wch);
  void             OutputDebugStringWrapW(              LPCWSTR lpOutputString);
  HRESULT          SHLoadIndirectString(                PCWSTR pszSource, PWSTR pszOutBuf, UINT cchOutBuf, void** ppvReserved);
  HRESULT          SHStrDup(                            LPCTSTR pszSource, LPTSTR* ppwsz);
  PTSTR            StrCat(                              PTSTR psz1, PCTSTR psz2);
  PTSTR            StrCatBuff(                          PTSTR pszDest, PCTSTR pszSrc, int cchDestBuffSize);
  DWORD            StrCatChainW(                        PWSTR pszDst, DWORD cchDst, DWORD ichAt, PCWSTR pszSrc);
  PTSTR            StrChr(                              PTSTR pszStart, TCHAR wMatch);
  PTSTR            StrChrI(                             PTSTR pszStart, TCHAR wMatch);
  PWSTR            StrChrNIW(                           PCWSTR pszStart, WCHAR wMatch, UINT cchMax);
  PWSTR            StrChrNW(                            PWSTR pszStart, WCHAR wMatch, UINT cchMax);
  int              StrCmp(                              PCTSTR psz1, PCTSTR psz2);
  int              StrCmpC(                             LPCTSTR lpStr1, LPCTSTR lpStr2);
  int              StrCmpI(                             PCTSTR psz1, PCTSTR psz2);
  int              StrCmpIC(                            LPCTSTR lpStr1, LPCTSTR lpStr2);
  int              StrCmpLogicalW(                      PCWSTR psz1, PCWSTR psz2);
  int              StrCmpN(                             PCTSTR psz1, PCTSTR psz2, int nChar);
  int              StrCmpNC(                            LPCTSTR pszStr1, LPCTSTR pszStr2, int nChar);
  int              StrCmpNI(                            PCTSTR psz1, PCTSTR psz2, int nChar);
  int              StrCmpNIC(                           LPCTSTR pszStr1, LPCTSTR pszStr2, int nChar);
  PTSTR            StrCpy(                              PTSTR psz1, PCTSTR psz2);
  PTSTR            StrCpyN(                             PTSTR pszDst, PCTSTR pszSrc, int cchMax);
  int              StrCSpn(                             PCTSTR pszStr, PCTSTR pszSet);
  int              StrCSpnI(                            PCTSTR pszStr, PCTSTR pszSet);
  PTSTR            StrDup(                              PCTSTR pszSrch);
  PTSTR            StrFormatByteSize64(                 LONGLONG qdw, PTSTR pszBuf, UINT cchBuf);
  PSTR             StrFormatByteSizeA(                  DWORD dw, PSTR pszBuf, UINT cchBuf);
  PWSTR            StrFormatByteSizeW(                  LONGLONG qdw, PWSTR pszBuf, UINT cchBuf);
  HRESULT          StrFormatByteSizeEx(                 ULONGLONG ull, SFBS_FLAGS flags, LPWSTR pszBuf, UINT cchBuf);
  PTSTR            StrFormatKBSize(                     LONGLONG qdw, PTSTR pszBuf, UINT cchBuf);
  int              StrFromTimeInterval(                 PTSTR pszOut, UINT cchMax, DWORD dwTimeMS, int digits);
  BOOL             StrIsIntlEqual(                      BOOL fCaseSens, PCTSTR pszString1, PCTSTR pszString2, int nChar);
  PTSTR            StrNCat(                             PTSTR psz1, PCTSTR psz2, int cchMax);
  PTSTR            StrPBrk(                             PTSTR psz, PCTSTR pszSet);
  PTSTR            StrRChr(                             PTSTR pszStart, PCTSTR pszEnd, TCHAR wMatch);
  PTSTR            StrRChrI(                            PTSTR pszStart, PCTSTR pszEnd, TCHAR wMatch);
  HRESULT          StrRetToBSTR(                        STRRET* pstr, PCUITEMID_CHILD pidl, BSTR* pbstr);
  HRESULT          StrRetToBuf(                         STRRET* pstr, PCUITEMID_CHILD pidl, LPTSTR pszBuf, UINT cchBuf);
  HRESULT          StrRetToStr(                         STRRET* pstr, PCUITEMID_CHILD pidl, LPTSTR* ppszName);
  PTSTR            StrRStrI(                            PTSTR pszSource, PCTSTR pszLast, PCTSTR pszSrch);
  int              StrSpn(                              PCTSTR psz, PCTSTR pszSet);
  PTSTR            StrStr(                              PTSTR pszFirst, PCTSTR pszSrch);
  PTSTR            StrStrI(                             PTSTR pszFirst, PCTSTR pszSrch);
  int              StrToInt(                            PCTSTR pszSrc);
  BOOL             StrToInt64Ex(                        PCTSTR pszString, STIF_FLAGS dwFlags, LONGLONG* pllRet);
  BOOL             StrToIntEx(                          PCTSTR pszString, STIF_FLAGS dwFlags, int* piRet);
  BOOL             StrTrim(                             PTSTR psz, PCTSTR pszTrimChars);
  int              wnsprintf(                           PTSTR pszDest, int cchDest, PCTSTR pszFmt);
  int              wvnsprintf(                          PTSTR pszDest, int cchDest, PCTSTR pszFmt, va_list arglist);
  HRESULT          ConnectToConnectionPoint(            IUnknown* punk, REFIID riidEvent, BOOL fConnect, IUnknown* punkTarget, DWORD* pdwCookie, IConnectionPoint** ppcpOut);
  HRESULT          DllInstall(                          BOOL bInstall, PCWSTR pszCmdLine);
  HRSRC            FindResourceWrapW(                   HMODULE hModule, LPCWSTR lpName, LPCWSTR lpType);
  int              GetMenuPosFromID(                    HMENU hmenu, UINT id);
  HRESULT          HashData(                            BYTE* pbData, DWORD cbData, BYTE* pbHash, DWORD cbHash);
  BOOL             GUIDFromString(                      LPCTSTR psz, LPGUID pguid);
  BOOL             IsInternetESCEnabled(                );
  BOOL             IsOS(                                DWORD dwOS);
  HRESULT          IStream_Copy(                        IStream* pstmFrom, IStream* pstmTo, DWORD cb);
  HRESULT          IStream_Read(                        IStream* pstm, VOID* pv, ULONG cb);
  HRESULT          IStream_ReadPidl(                    IStream* pstm, PIDLIST_RELATIVE* ppidlOut);
  HRESULT          IStream_ReadStr(                     IStream* pstm, PWSTR* ppsz);
  HRESULT          IStream_Reset(                       IStream* pstm);
  HRESULT          IStream_Size(                        IStream* pstm, ULARGE_INTEGER* pui);
  HRESULT          IStream_Write(                       IStream* pstm, void* pv, ULONG cb);
  HRESULT          IStream_WritePidl(                   IStream* pstm, PCUIDLIST_RELATIVE pidlWrite);
  HRESULT          IStream_WriteStr(                    IStream* pstm, PCWSTR psz);
  void             IUnknown_AtomicRelease(              void** ppunk);
  HRESULT          IUnknown_GetSite(                    IUnknown* punk, REFIID riid, VOID** ppvSite);
  HRESULT          IUnknown_GetWindow(                  IUnknown* punk, HWND* phwnd);
  HRESULT          IUnknown_QueryService(               IUnknown* punk, REFGUID guidService, REFIID riid, void** ppvOut);
  void             IUnknown_Set(                        IUnknown* ppunk, IUnknown* punk);
  HRESULT          IUnknown_SetSite(                    IUnknown* punk, IUnknown* punkSite);
  BOOL             MLFreeLibrary(                       HMODULE hModule);
  HINSTANCE        MLLoadLibrary(                       LPCTSTR lpszLibFileName, HMODULE hModule, DWORD dwCrossCodePage);
  HWND             MLHtmlHelp(                          HWND hwndCaller, LPCTSTR pszFile, UINT uCommand, DWORD_PTR dwData, DWORD dwCrossCodePage);
  BOOL             MLWinHelp(                           HWND hWndMain, LPCTSTR lpszHelp, UINT uCommand, DWORD_PTR dwData);
  HRESULT          ParseURL(                            LPCTSTR pcszUrl, PARSEDURL* ppu);
  HRESULT          QISearch(                            void* that, LPCQITAB pqit, REFIID riid, void** ppv);
  int              SHAnsiToAnsi(                        LPCSTR pszSrc, LPWSTR pszDst, int cchBuf);
  int              SHAnsiToUnicode(                     PCSTR pszSrc, PWSTR pwszDst, int cwchBuf);
  HRESULT          SHAutoComplete(                      HWND hwndEdit, DWORD dwFlags);
  IStream*         SHCreateMemStream(                   BYTE* pInit, UINT cbInit);
  HRESULT          SHCreateStreamOnFile(                LPCTSTR pszFile, STGM_FLAGS grfMode, IStream** ppstm);
  HRESULT          SHCreateStreamOnFileEx(              LPCWSTR pszFile, STGM_FLAGS grfMode, DWORD dwAttributes, BOOL fCreate, IStream* pstmTemplate, IStream** ppstm);
  BOOL             SHCreateThread(                      LPTHREAD_START_ROUTINE pfnThreadProc, void* pData, SHCT_FLAGS dwFlags, LPTHREAD_START_ROUTINE pfnCallback);
  HRESULT          SHCreateThreadRef(                   LONG* pcRef, IUnknown** ppunk);
  BOOL             SHCreateThreadWithHandle(            LPTHREAD_START_ROUTINE pfnThreadProc, void* pData, SHCT_FLAGS flags, LPTHREAD_START_ROUTINE pfnCallback, HANDLE* pHandle);
  int              SHFormatDateTime(                    FILETIME* pft, DWORD* pdwFlags, LPTSTR pszBuf, UINT cchBuf);
  HRESULT          SHGetThreadRef(                      IUnknown** ppunk);
  HRESULT          SHSetThreadRef(                      IUnknown* punk);
  HRESULT          SHReleaseThreadRef(                  );
  long             SHGlobalCounterDecrement(            SHGLOBALCOUNTER id);
  long             SHGlobalCounterGetValue(             SHGLOBALCOUNTER id);
  long             SHGlobalCounterIncrement(            SHGLOBALCOUNTER id);
  HRESULT          SHIsChildOrSelf(                     HWND hwndParent, HWND hwnd);
  BOOL             SHIsLowMemoryMachine(                DWORD dwType);
  int              SHMessageBoxCheck(                   HWND hwnd, LPCTSTR pszText, LPCTSTR pszCaption, UINT uType, int iDefault, LPCTSTR pszRegVal);
  LRESULT          SHSendMessageBroadcast(              UINT uMsg, WPARAM wParam, LPARAM lParam);
  TCHAR            SHStripMneumonic(                    LPTSTR* pszMenu);
  int              SHUnicodeToAnsi(                     PCWSTR pwszSrc, PSTR pszDst, int cchBuf);
  int              SHUnicodeToUnicode(                  PCWSTR pwzSrc, PWSTR pwzDst, int cwchBuf);
  ERROR_CODE       StopWatchFlush(                      );
  DWORD            StopWatchMode(                       );
  UINT             WhichPlatform(                       );
  HRESULT          SHRunIndirectRegClientCommand(       HWND hwnd, LPCWSTR pszClientType);
  HRESULT          DupWideToAnsi(                       LPCWSTR pwszString, LPSTR* ppszStr);
  HRESULT          IStream_ReadStrLong(                 IStream* pStream, LPWSTR* ppwszString);
  HRESULT          IStream_WriteStrLong(                IStream* pStream, LPCWSTR pwszString);
  HRESULT          IUnknown_RemoveBackReferences(       IUnknown* pUnk);
  HRESULT          IUnknown_TranslateAcceleratorGlobal( IUnknown* pUnk, MSG* pMsg);
  HRESULT          IUnknown_TranslateAcceleratorIO(     IUnknown* pUnk, MSG* pMsg);
  HRESULT          MapWin32ErrorToSTG(                  HRESULT hrWin32);
  HRESULT          ModeToCreateFileFlags(               DWORD grfFlags, BOOL bCreate, DWORD* pDesiredAccess, DWORD* pShareMode, DWORD* pDisposition);
  BOOL             PathUnExpandEnvStringsForUserW(      HANDLE hUserToken, LPCWSTR pwszPath, LPWSTR pwszBuf, UINT cchBuf);
  BOOL             PathUnExpandSystemEnvStringsW(       LPCWSTR pwszPath, LPWSTR pwszBuf, UINT cchBuf);
  HRESULT          QuerySourceCreateFromKey(            HKEY hKey, LPCWSTR pwszSubKey, BOOL shouldCreate, REFIID riid, LPVOID* ppInterface);
  HRESULT          QuerySourceCreateFromKeyEx(          HKEY hKey, LPCWSTR pwszSubKey, BOOL shouldCreate, ACCESS_MASK amDesired, REFIID riid, LPVOID* ppInterface);
  HRESULT          SHAnsiToUnicodeCPAlloc(              UINT codePage, LPCSTR pszString, LPWSTR* ppwszConverted);
  BOOL             SHAreIconsEqual(                     HICON hIcon1, HICON hIcon2);
  BOOL             SHBoolSystemParametersInfo(          SystemParametersInfoEnum uiAction, PVOID pData);
  HRESULT          SHCreatePropertyBagOnMemory(         PVOID pUnused, REFIID riid, PVOID* ppv);
  HRESULT          SHCreatePropertyStoreOnXML(          IXMLDOMNode* pXmlDomNode, STGM_FLAGS grfMode, IPropertyBag* pPropBagInit, REFIID riid, PVOID* ppv);
  HRESULT          SHCreateStreamOnDllResourceW(        LPCWSTR pwszModule, LPCWSTR pwszName, LPCWSTR pwszType, IStream** ppStream);
  HRESULT          SHCreateStreamOnModuleResourceW(     HMODULE hModule, LPCWSTR pwszName, LPCWSTR pwszType, IStream** ppStream);
  HRESULT          SHExpandEnvironmentStringsAlloc(     LPCWSTR pwszExpandableString, LPWSTR* ppwszExpanded);
  HRESULT          SHForwardContextMenuMsg(             IUnknown* pUnk, UINT uMsg, WPARAM wParam, LPARAM lParam, LRESULT* pResult, BOOL useIContextMenu2);
  DWORD            SHGetSizeShared(                     PVOID pData);
  HRESULT          SHInvokeCommandOnContextMenu(        HWND hwnd, IObjectWithSite* pSite, IContextMenu* pCtxMenu, CMIC_Mask fMask, LPCSTR pszVerb, LPCWSTR pwszDirectory);
  HRESULT          SHInvokeCommandOnContextMenuEx(      HWND hwnd, IObjectWithSite* pSite, IContextMenu* pCtxMenu, CMIC_Mask fMask, UINT queryFlags, LPCSTR pszVerb, LPCWSTR pwszDirectory);
  HRESULT          SHInvokeCommandWithFlagsAndSite(     HWND hwnd, IObjectWithSite* pSite, IShellFolder* pShellFolder, LPITEMIDLIST pidl, CMIC_Mask fMask, LPCSTR pszVerb);
  HRESULT          SHInvokeCommandsOnContextMenuEx(     HWND hwnd, IObjectWithSite* pSite, IContextMenu* pCtxMenu, CMIC_Mask fMask, UINT queryFlags, LPCSTR* ppszVerbs, UINT numVerbs, LPCWSTR pwszDirectory);
  LSTATUS          SHRegSetValue(                       HKEY hKey, LPCWSTR pwszSubKey, LPCWSTR pwszValue, SRRF srrfFlags, DWORD dwType, LPCVOID pvData, DWORD cbData);
  HRESULT          SHUnicodeToAnsiCPAlloc(              UINT codePage, LPCWSTR pwszString, LPSTR* ppszConverted);
]]
ffi.load( 'shlwapi.dll' )
