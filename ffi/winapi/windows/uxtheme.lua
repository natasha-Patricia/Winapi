require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/shell' )
require( 'ffi/winapi/headers/gdi' )
local ffi = require( 'ffi' )
ffi.cdef [[
  HANIMATIONBUFFER BeginBufferedAnimation(                HWND hwnd, HDC hdcTarget, WINAPI_RECT* rcTarget, BP_BUFFERFORMAT dwFormat, BP_PAINTPARAMS* pPaintParams, BP_ANIMATIONPARAMS* pAnimationParams, HDC* phdcFrom, HDC* phdcTo);
  HPAINTBUFFER     BeginBufferedPaint(                    HDC hdcTarget, WINAPI_RECT* prcTarget, BP_BUFFERFORMAT dwFormat, BP_PAINTPARAMS* pPaintParams, HDC* phdc);
  HRESULT          BufferedPaintClear(                    HPAINTBUFFER hBufferedPaint, WINAPI_RECT* prc);
  HRESULT          BufferedPaintInit(                     );
  BOOL             BufferedPaintRenderAnimation(          HWND hwnd, HDC hdcTarget);
  HRESULT          BufferedPaintSetAlpha(                 HPAINTBUFFER hBufferedPaint, WINAPI_RECT* prc, BYTE alpha);
  HRESULT          BufferedPaintStopAllAnimations(        HWND hwnd);
  HRESULT          BufferedPaintUnInit(                   );
  HRESULT          CloseThemeData(                        HTHEME hTheme);
  HRESULT          DrawThemeBackground(                   HTHEME hTheme, HDC hdc, int iPartId, int iStateId, WINAPI_RECT* pRect, WINAPI_RECT* pClipRect);
  HRESULT          DrawThemeBackgroundEx(                 HTHEME hTheme, HDC hdc, int iPartId, int iStateId, WINAPI_RECT* pRect, WINAPI_DTBGOPTS* pOptions);
  HRESULT          DrawThemeEdge(                         HTHEME hTheme, HDC hdc, int iPartId, int iStateId, LPCRECT pDestRect, WINAPI_BorderEdge uEdge, WINAPI_BorderFlag uFlags, LPRECT pContentRect);
  HRESULT          DrawThemeIcon(                         HTHEME hTheme, HDC hdc, int iPartId, int iStateId, LPCRECT pRect, HIMAGELIST himl, int iImageIndex);
  HRESULT          DrawThemeParentBackground(             HWND hwnd, HDC hdc, WINAPI_RECT* prc);
  HRESULT          DrawThemeParentBackgroundEx(           HWND hwnd, HDC hdc, WINAPI_DrawThemeParentBackgroundFlags dwFlags, WINAPI_RECT* prc);
  HRESULT          DrawThemeText(                         HTHEME hTheme, HDC hdc, int iPartId, int iStateId, LPCWSTR pszText, int iCharCount, WINAPI_DrawTextFlags dwTextFlags, DWORD dwTextFlags2, LPCRECT pRect);
  HRESULT          DrawThemeTextEx(                       HTHEME hTheme, HDC hdc, int iPartId, int iStateId, LPCWSTR pszText, int iCharCount, WINAPI_DrawTextFlags dwFlags, LPRECT pRect, WINAPI_DTTOPTS* pOptions);
  HRESULT          EnableThemeDialogTexture(              HWND hwnd, WINAPI_EnableThemeDialogTextureFlags dwFlags);
  HRESULT          EnableTheming(                         BOOL fEnable);
  HRESULT          EndBufferedAnimation(                  HANIMATIONBUFFER hbpAnimation, BOOL fUpdateTarget);
  HRESULT          EndBufferedPaint(                      HPAINTBUFFER hBufferedPaint, BOOL fUpdateTarget);
  HRESULT          GetBufferedPaintBits(                  HPAINTBUFFER hBufferedPaint, RGBQUAD** ppbBuffer, int* pcxRow);
  HDC              GetBufferedPaintDC(                    HPAINTBUFFER hBufferedPaint);
  HDC              GetBufferedPaintTargetDC(              HPAINTBUFFER hBufferedPaint);
  HRESULT          GetBufferedPaintTargetRect(            HPAINTBUFFER hBufferedPaint, RECT* prc);
  HRESULT          GetCurrentThemeName(                   LPWSTR pszThemeFileName, int dwMaxNameChars, LPWSTR pszColorBuff, int cchMaxColorChars, LPWSTR pszSizeBuff, int cchMaxSizeChars);
  DWORD            GetThemeAppProperties(                 );
  HRESULT          GetThemeBackgroundContentRect(         HTHEME hTheme, HDC hdc, int iPartId, int iStateId, LPCRECT pBoundingRect, LPRECT pContentRect);
  HRESULT          GetThemeBackgroundExtent(              HTHEME hTheme, HDC hdc, int iPartId, int iStateId, LPCRECT pContentRect, LPRECT pExtentRect);
  HRESULT          GetThemeBackgroundRegion(              HTHEME hTheme, HDC hdc, int iPartId, int iStateId, LPCRECT pRect, HRGN* pRegion);
  HRESULT          GetThemeBitmap(                        HTHEME hTheme, int iPartId, int iStateId, int iPropId, ULONG dwFlags, HBITMAP* phBitmap);
  HRESULT          GetThemeBool(                          HTHEME hTheme, int iPartId, int iStateId, int iPropId, BOOL* pfVal);
  HRESULT          GetThemeColor(                         HTHEME hTheme, int iPartId, int iStateId, int iPropId, COLORREF* pColor);
  HRESULT          GetThemeDocumentationProperty(         LPCWSTR pszThemeName, LPCWSTR pszPropertyName, LPWSTR pszValueBuff, int cchMaxValChars);
  HRESULT          GetThemeEnumValue(                     HTHEME hTheme, int iPartId, int iStateId, int iPropId, int* piVal);
  HRESULT          GetThemeFilename(                      HTHEME hTheme, int iPartId, int iStateId, int iPropId, LPWSTR pszThemeFilename, int cchMaxBuffChars);
  HRESULT          GetThemeFont(                          HTHEME hTheme, HDC hdc, int iPartId, int iStateId, int iPropId, LOGFONTW* pFont);
  HRESULT          GetThemeInt(                           HTHEME hTheme, int iPartId, int iStateId, int iPropId, int* piVal);
  HRESULT          GetThemeIntList(                       HTHEME hTheme, int iPartId, int iStateId, int iPropId, INTLIST* pIntList);
  HRESULT          GetThemeMargins(                       HTHEME hTheme, HDC hdc, int iPartId, int iStateId, int iPropId, LPRECT prc, MARGINS* pMargins);
  HRESULT          GetThemeMetric(                        HTHEME hTheme, HDC hdc, int iPartId, int iStateId, int iPropId, int* piVal);
  HRESULT          GetThemePartSize(                      HTHEME hTheme, HDC hdc, int iPartId, int iStateId, LPCRECT prc, THEMESIZE eSize, SIZE* psz);
  HRESULT          GetThemePosition(                      HTHEME hTheme, int iPartId, int iStateId, int iPropId, POINT* pPoint);
  HRESULT          GetThemePropertyOrigin(                HTHEME hTheme, int iPartId, int iStateId, int iPropId, PROPERTYORIGIN* pOrigin);
  HRESULT          GetThemeRect(                          HTHEME hTheme, int iPartId, int iStateId, int iPropId, LPRECT pRect);
  HRESULT          GetThemeStream(                        HTHEME hTheme, int iPartId, int iStateId, int iPropId, VOID** ppvStream, DWORD* pcbStream, HINSTANCE hInst);
  HRESULT          GetThemeString(                        HTHEME hTheme, int iPartId, int iStateId, int iPropId, LPWSTR pszBuff, int cchMaxBuffChars);
  BOOL             GetThemeSysBool(                       HTHEME hTheme, int iBoolID);
  COLORREF         GetThemeSysColor(                      HTHEME hTheme, WINAPI_SysColorIndex iColorID);
  HBRUSH           GetThemeSysColorBrush(                 HTHEME hTheme, int iColorID);
  HRESULT          GetThemeSysFont(                       HTHEME hTheme, int iFontID, LOGFONTW* plf);
  HRESULT          GetThemeSysInt(                        HTHEME hTheme, int iIntID, int* piValue);
  int              GetThemeSysSize(                       HTHEME hTheme, int iSizeID);
  HRESULT          GetThemeSysString(                     HTHEME hTheme, int iStringID, LPWSTR pszStringBuff, int cchMaxStringChars);
  HRESULT          GetThemeTextExtent(                    HTHEME hTheme, HDC hdc, int iPartId, int iStateId, LPCWSTR pszText, int iCharCount, WINAPI_DrawTextFlags dwTextFlags, LPCRECT pBoundingRect, LPRECT pExtentRect);
  HRESULT          GetThemeTextMetrics(                   HTHEME hTheme, HDC hdc, int iPartId, int iStateId, TEXTMETRIC* ptm);
  HRESULT          GetThemeTransitionDuration(            HTHEME hTheme, int iPartId, int iStateIdFrom, int iStateIdTo, int iPropId, DWORD* pdwDuration);
  HTHEME           GetWindowTheme(                        HWND hWnd);
  HRESULT          HitTestThemeBackground(                HTHEME hTheme, HDC hdc, int iPartId, int iStateId, WINAPI_HitTestThemeBackgroundOptions dwOptions, LPCRECT pRect, HRGN hrgn, POINT ptTest, WINAPI_HitTestReturnCode* pwHitTestCode);
  BOOL             IsAppThemed(                           );
  BOOL             IsCompositionActive(                   );
  BOOL             IsThemeActive(                         );
  BOOL             IsThemeBackgroundPartiallyTransparent( HTHEME hTheme, int iPartId, int iStateId);
  BOOL             IsThemeDialogTextureEnabled(           HWND hwnd);
  BOOL             IsThemePartDefined(                    HTHEME hTheme, int iPartId, int iStateId);
  HTHEME           OpenThemeData(                         HWND hwnd, LPCWSTR pszClassList);
  HTHEME           OpenThemeDataEx(                       HWND hwnd, LPCWSTR pszClassIdList, DWORD dwFlags);
  void             SetThemeAppProperties(                 DWORD dwFlags);
  HRESULT          SetWindowTheme(                        HWND hwnd, LPCWSTR pszSubAppName, LPCWSTR pszSubIdList);
  HRESULT          SetWindowThemeAttribute(               HWND hwnd, WINDOWTHEMEATTRIBUTETYPE eAttribute, PVOID pvAttribute, DWORD cbAttribute);
  BOOL             BeginPanningFeedback(                  HWND hwnd);
  BOOL             EndPanningFeedback(                    HWND hwnd, BOOL fAnimateBack);
  BOOL             UpdatePanningFeedback(                 HWND hwnd, LONG lTotalOverpanOffsetX, LONG lTotalOverpanOffsetY, BOOL fInInertia);
]]
return ffi.load( 'UxTheme.dll' )
