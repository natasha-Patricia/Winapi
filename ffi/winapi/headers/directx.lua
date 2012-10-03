require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/gdi' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef DWORD D3DCOLOR; //Alias
  typedef LPVOID PDXVAHDSW_Plugin; //Alias
  typedef struct D3DCOLORVALUE {
    float r;
    float g;
    float b;
    float a;
  } D3DCOLORVALUE;
  typedef DWORD D3DPOOL; //Alias
  static const DWORD D3DPOOL_DEFAULT = 0;
  static const DWORD D3DPOOL_MANAGED = 1;
  static const DWORD D3DPOOL_SYSTEMMEM = 2;
  static const DWORD D3DPOOL_SCRATCH = 3;
  typedef UINT D3DFORMAT; //Alias
  static const UINT D3DFMT_UNKNOWN = 0;
  static const UINT D3DFMT_R8G8B8 = 20;
  static const UINT D3DFMT_A8R8G8B8 = 21;
  static const UINT D3DFMT_X8R8G8B8 = 22;
  static const UINT D3DFMT_R5G6B5 = 23;
  static const UINT D3DFMT_X1R5G5B5 = 24;
  static const UINT D3DFMT_A1R5G5B5 = 25;
  static const UINT D3DFMT_A4R4G4B4 = 26;
  static const UINT D3DFMT_R3G3B2 = 27;
  static const UINT D3DFMT_A8 = 28;
  static const UINT D3DFMT_A8R3G3B2 = 29;
  static const UINT D3DFMT_X4R4G4B4 = 30;
  static const UINT D3DFMT_A2B10G10R10 = 31;
  static const UINT D3DFMT_A8B8G8R8 = 32;
  static const UINT D3DFMT_X8B8G8R8 = 33;
  static const UINT D3DFMT_G16R16 = 34;
  static const UINT D3DFMT_A2R10G10B10 = 35;
  static const UINT D3DFMT_A16B16G16R16 = 36;
  static const UINT D3DFMT_A8P8 = 40;
  static const UINT D3DFMT_P8 = 41;
  static const UINT D3DFMT_L8 = 50;
  static const UINT D3DFMT_A8L8 = 51;
  static const UINT D3DFMT_A4L4 = 52;
  static const UINT D3DFMT_V8U8 = 60;
  static const UINT D3DFMT_L6V5U5 = 61;
  static const UINT D3DFMT_X8L8V8U8 = 62;
  static const UINT D3DFMT_Q8W8V8U8 = 63;
  static const UINT D3DFMT_V16U16 = 64;
  static const UINT D3DFMT_A2W10V10U10 = 67;
  static const UINT D3DFMT_UYVY = 0x59565955;
  static const UINT D3DFMT_R8G8_B8G8 = 0x47424752;
  static const UINT D3DFMT_YUY2 = 0x32595559;
  static const UINT D3DFMT_G8R8_G8B8 = 0x42475247;
  static const UINT D3DFMT_DXT1 = 0x31545844;
  static const UINT D3DFMT_DXT2 = 0x32545844;
  static const UINT D3DFMT_DXT3 = 0x33545844;
  static const UINT D3DFMT_DXT4 = 0x34545844;
  static const UINT D3DFMT_DXT5 = 0x35545844;
  static const UINT D3DFMT_D16_LOCKABLE = 70;
  static const UINT D3DFMT_D32 = 71;
  static const UINT D3DFMT_D15S1 = 73;
  static const UINT D3DFMT_D24S8 = 75;
  static const UINT D3DFMT_D24X8 = 77;
  static const UINT D3DFMT_D24X4S4 = 79;
  static const UINT D3DFMT_D16 = 80;
  static const UINT D3DFMT_D32F_LOCKABLE = 82;
  static const UINT D3DFMT_D24FS8 = 83;
  static const UINT D3DFMT_D32_LOCKABLE = 84;
  static const UINT D3DFMT_S8_LOCKABLE = 85;
  static const UINT D3DFMT_L16 = 81;
  static const UINT D3DFMT_VERTEXDATA = 100;
  static const UINT D3DFMT_INDEX16 = 101;
  static const UINT D3DFMT_INDEX32 = 102;
  static const UINT D3DFMT_Q16W16V16U16 = 110;
  static const UINT D3DFMT_MULTI2_ARGB8 = 0x3154454D;
  static const UINT D3DFMT_R16F = 111;
  static const UINT D3DFMT_G16R16F = 112;
  static const UINT D3DFMT_A16B16G16R16F = 113;
  static const UINT D3DFMT_R32F = 114;
  static const UINT D3DFMT_G32R32F = 115;
  static const UINT D3DFMT_A32B32G32R32F = 116;
  static const UINT D3DFMT_CxV8U8 = 117;
  static const UINT D3DFMT_A1 = 118;
  static const UINT D3DFMT_A2B10G10R10_XR_BIAS = 119;
  static const UINT D3DFMT_BINARYBUFFER = 199;
  typedef struct D3DVECTOR {
    float x;
    float y;
    float z;
  } D3DVECTOR;
  typedef UINT DXGI_FORMAT; //Alias
  static const UINT DXGI_FORMAT_UNKNOWN = 0;
  static const UINT DXGI_FORMAT_R32G32B32A32_TYPELESS = 1;
  static const UINT DXGI_FORMAT_R32G32B32A32_FLOAT = 2;
  static const UINT DXGI_FORMAT_R32G32B32A32_UINT = 3;
  static const UINT DXGI_FORMAT_R32G32B32A32_SINT = 4;
  static const UINT DXGI_FORMAT_R32G32B32_TYPELESS = 5;
  static const UINT DXGI_FORMAT_R32G32B32_FLOAT = 6;
  static const UINT DXGI_FORMAT_R32G32B32_UINT = 7;
  static const UINT DXGI_FORMAT_R32G32B32_SINT = 8;
  static const UINT DXGI_FORMAT_R16G16B16A16_TYPELESS = 9;
  static const UINT DXGI_FORMAT_R16G16B16A16_FLOAT = 10;
  static const UINT DXGI_FORMAT_R16G16B16A16_UNORM = 11;
  static const UINT DXGI_FORMAT_R16G16B16A16_UINT = 12;
  static const UINT DXGI_FORMAT_R16G16B16A16_SNORM = 13;
  static const UINT DXGI_FORMAT_R16G16B16A16_SINT = 14;
  static const UINT DXGI_FORMAT_R32G32_TYPELESS = 15;
  static const UINT DXGI_FORMAT_R32G32_FLOAT = 16;
  static const UINT DXGI_FORMAT_R32G32_UINT = 17;
  static const UINT DXGI_FORMAT_R32G32_SINT = 18;
  static const UINT DXGI_FORMAT_R32G8X24_TYPELESS = 19;
  static const UINT DXGI_FORMAT_D32_FLOAT_S8X24_UINT = 20;
  static const UINT DXGI_FORMAT_R32_FLOAT_X8X24_TYPELESS = 21;
  static const UINT DXGI_FORMAT_X32_TYPELESS_G8X24_UINT = 22;
  static const UINT DXGI_FORMAT_R10G10B10A2_TYPELESS = 23;
  static const UINT DXGI_FORMAT_R10G10B10A2_UNORM = 24;
  static const UINT DXGI_FORMAT_R10G10B10A2_UINT = 25;
  static const UINT DXGI_FORMAT_R11G11B10_FLOAT = 26;
  static const UINT DXGI_FORMAT_R8G8B8A8_TYPELESS = 27;
  static const UINT DXGI_FORMAT_R8G8B8A8_UNORM = 28;
  static const UINT DXGI_FORMAT_R8G8B8A8_UNORM_SRGB = 29;
  static const UINT DXGI_FORMAT_R8G8B8A8_UINT = 30;
  static const UINT DXGI_FORMAT_R8G8B8A8_SNORM = 31;
  static const UINT DXGI_FORMAT_R8G8B8A8_SINT = 32;
  static const UINT DXGI_FORMAT_R16G16_TYPELESS = 33;
  static const UINT DXGI_FORMAT_R16G16_FLOAT = 34;
  static const UINT DXGI_FORMAT_R16G16_UNORM = 35;
  static const UINT DXGI_FORMAT_R16G16_UINT = 36;
  static const UINT DXGI_FORMAT_R16G16_SNORM = 37;
  static const UINT DXGI_FORMAT_R16G16_SINT = 38;
  static const UINT DXGI_FORMAT_R32_TYPELESS = 39;
  static const UINT DXGI_FORMAT_D32_FLOAT = 40;
  static const UINT DXGI_FORMAT_R32_FLOAT = 41;
  static const UINT DXGI_FORMAT_R32_UINT = 42;
  static const UINT DXGI_FORMAT_R32_SINT = 43;
  static const UINT DXGI_FORMAT_R24G8_TYPELESS = 44;
  static const UINT DXGI_FORMAT_D24_UNORM_S8_UINT = 45;
  static const UINT DXGI_FORMAT_R24_UNORM_X8_TYPELESS = 46;
  static const UINT DXGI_FORMAT_X24_TYPELESS_G8_UINT = 47;
  static const UINT DXGI_FORMAT_R8G8_TYPELESS = 48;
  static const UINT DXGI_FORMAT_R8G8_UNORM = 49;
  static const UINT DXGI_FORMAT_R8G8_UINT = 50;
  static const UINT DXGI_FORMAT_R8G8_SNORM = 51;
  static const UINT DXGI_FORMAT_R8G8_SINT = 52;
  static const UINT DXGI_FORMAT_R16_TYPELESS = 53;
  static const UINT DXGI_FORMAT_R16_FLOAT = 54;
  static const UINT DXGI_FORMAT_D16_UNORM = 55;
  static const UINT DXGI_FORMAT_R16_UNORM = 56;
  static const UINT DXGI_FORMAT_R16_UINT = 57;
  static const UINT DXGI_FORMAT_R16_SNORM = 58;
  static const UINT DXGI_FORMAT_R16_SINT = 59;
  static const UINT DXGI_FORMAT_R8_TYPELESS = 60;
  static const UINT DXGI_FORMAT_R8_UNORM = 61;
  static const UINT DXGI_FORMAT_R8_UINT = 62;
  static const UINT DXGI_FORMAT_R8_SNORM = 63;
  static const UINT DXGI_FORMAT_R8_SINT = 64;
  static const UINT DXGI_FORMAT_A8_UNORM = 65;
  static const UINT DXGI_FORMAT_R1_UNORM = 66;
  static const UINT DXGI_FORMAT_R9G9B9E5_SHAREDEXP = 67;
  static const UINT DXGI_FORMAT_R8G8_B8G8_UNORM = 68;
  static const UINT DXGI_FORMAT_G8R8_G8B8_UNORM = 69;
  static const UINT DXGI_FORMAT_BC1_TYPELESS = 70;
  static const UINT DXGI_FORMAT_BC1_UNORM = 71;
  static const UINT DXGI_FORMAT_BC1_UNORM_SRGB = 72;
  static const UINT DXGI_FORMAT_BC2_TYPELESS = 73;
  static const UINT DXGI_FORMAT_BC2_UNORM = 74;
  static const UINT DXGI_FORMAT_BC2_UNORM_SRGB = 75;
  static const UINT DXGI_FORMAT_BC3_TYPELESS = 76;
  static const UINT DXGI_FORMAT_BC3_UNORM = 77;
  static const UINT DXGI_FORMAT_BC3_UNORM_SRGB = 78;
  static const UINT DXGI_FORMAT_BC4_TYPELESS = 79;
  static const UINT DXGI_FORMAT_BC4_UNORM = 80;
  static const UINT DXGI_FORMAT_BC4_SNORM = 81;
  static const UINT DXGI_FORMAT_BC5_TYPELESS = 82;
  static const UINT DXGI_FORMAT_BC5_UNORM = 83;
  static const UINT DXGI_FORMAT_BC5_SNORM = 84;
  static const UINT DXGI_FORMAT_B5G6R5_UNORM = 85;
  static const UINT DXGI_FORMAT_B5G5R5A1_UNORM = 86;
  static const UINT DXGI_FORMAT_B8G8R8A8_UNORM = 87;
  static const UINT DXGI_FORMAT_B8G8R8X8_UNORM = 88;
  static const UINT DXGI_FORMAT_R10G10B10_XR_BIAS_A2_UNORM = 89;
  static const UINT DXGI_FORMAT_B8G8R8A8_TYPELESS = 90;
  static const UINT DXGI_FORMAT_B8G8R8A8_UNORM_SRGB = 91;
  static const UINT DXGI_FORMAT_B8G8R8X8_TYPELESS = 92;
  static const UINT DXGI_FORMAT_B8G8R8X8_UNORM_SRGB = 93;
  static const UINT DXGI_FORMAT_BC6H_TYPELESS = 94;
  static const UINT DXGI_FORMAT_BC6H_UF16 = 95;
  static const UINT DXGI_FORMAT_BC6H_SF16 = 96;
  static const UINT DXGI_FORMAT_BC7_TYPELESS = 97;
  static const UINT DXGI_FORMAT_BC7_UNORM = 98;
  static const UINT DXGI_FORMAT_BC7_UNORM_SRGB = 99;
  typedef UINT DXVAHD_FRAME_FORMAT; //Alias
  static const UINT DXVAHD_FRAME_FORMAT_PROGRESSIVE = 0;
  static const UINT DXVAHD_FRAME_FORMAT_INTERLACED_TOP_FIELD_FIRST = 1;
  static const UINT DXVAHD_FRAME_FORMAT_INTERLACED_BOTTOM_FIELD_FIRST = 2;
  typedef struct DXVAHD_RATIONAL {
    UINT Numerator;
    UINT Denominator;
  } DXVAHD_RATIONAL;
  typedef struct DXVAHD_CONTENT_DESC {
    DXVAHD_FRAME_FORMAT InputFrameFormat;
    DXVAHD_RATIONAL InputFrameRate;
    UINT InputWidth;
    UINT InputHeight;
    DXVAHD_RATIONAL OutputFrameRate;
    UINT OutputWidth;
    UINT OutputHeight;
  } DXVAHD_CONTENT_DESC;
  typedef UINT DXVAHD_DEVICE_USAGE; //Alias
  static const UINT DXVAHD_DEVICE_USAGE_PLAYBACK_NORMAL = 0;
  static const UINT DXVAHD_DEVICE_USAGE_OPTIMAL_SPEED = 1;
  static const UINT DXVAHD_DEVICE_USAGE_OPTIMAL_QUALITY = 2;
  enum { 4][4 = 4 };
  enum { D3D_OMAC_SIZE = 16 };
  enum { MAX_DEVICE_IDENTIFIER_STRING = 512 };
  typedef UINT D3DDEVTYPE; //Alias
  static const UINT D3DDEVTYPE_HAL = 1;
  static const UINT D3DDEVTYPE_REF = 2;
  static const UINT D3DDEVTYPE_SW = 3;
  static const UINT D3DDEVTYPE_NULLREF = 4;
  typedef UINT D3DRESOURCETYPE; //Alias
  static const UINT D3DRTYPE_SURFACE = 1;
  static const UINT D3DRTYPE_VOLUME = 2;
  static const UINT D3DRTYPE_TEXTURE = 3;
  static const UINT D3DRTYPE_VOLUMETEXTURE = 4;
  static const UINT D3DRTYPE_CUBETEXTURE = 5;
  static const UINT D3DRTYPE_VERTEXBUFFER = 6;
  static const UINT D3DRTYPE_INDEXBUFFER = 7;
  typedef UINT D3DMULTISAMPLE_TYPE; //Alias
  static const UINT D3DMULTISAMPLE_NONE = 0;
  static const UINT D3DMULTISAMPLE_NONMASKABLE = 1;
  static const UINT D3DMULTISAMPLE_2_SAMPLES = 2;
  static const UINT D3DMULTISAMPLE_3_SAMPLES = 3;
  static const UINT D3DMULTISAMPLE_4_SAMPLES = 4;
  static const UINT D3DMULTISAMPLE_5_SAMPLES = 5;
  static const UINT D3DMULTISAMPLE_6_SAMPLES = 6;
  static const UINT D3DMULTISAMPLE_7_SAMPLES = 7;
  static const UINT D3DMULTISAMPLE_8_SAMPLES = 8;
  static const UINT D3DMULTISAMPLE_9_SAMPLES = 9;
  static const UINT D3DMULTISAMPLE_10_SAMPLES = 10;
  static const UINT D3DMULTISAMPLE_11_SAMPLES = 11;
  static const UINT D3DMULTISAMPLE_12_SAMPLES = 12;
  static const UINT D3DMULTISAMPLE_13_SAMPLES = 13;
  static const UINT D3DMULTISAMPLE_14_SAMPLES = 14;
  static const UINT D3DMULTISAMPLE_15_SAMPLES = 15;
  static const UINT D3DMULTISAMPLE_16_SAMPLES = 16;
  typedef UINT D3DBACKBUFFER_TYPE; //Alias
  static const UINT D3DBACKBUFFER_TYPE_MONO = 0;
  static const UINT D3DBACKBUFFER_TYPE_LEFT = 1;
  static const UINT D3DBACKBUFFER_TYPE_RIGHT = 2;
  typedef UINT D3DQUERYTYPE; //Alias
  static const UINT D3DQUERYTYPE_VCACHE = 4;
  static const UINT D3DQUERYTYPE_RESOURCEMANAGER = 5;
  static const UINT D3DQUERYTYPE_VERTEXSTATS = 6;
  static const UINT D3DQUERYTYPE_EVENT = 8;
  static const UINT D3DQUERYTYPE_OCCLUSION = 9;
  static const UINT D3DQUERYTYPE_TIMESTAMP = 10;
  static const UINT D3DQUERYTYPE_TIMESTAMPDISJOINT = 11;
  static const UINT D3DQUERYTYPE_TIMESTAMPFREQ = 12;
  static const UINT D3DQUERYTYPE_PIPELINETIMINGS = 13;
  static const UINT D3DQUERYTYPE_INTERFACETIMINGS = 14;
  static const UINT D3DQUERYTYPE_VERTEXTIMINGS = 15;
  static const UINT D3DQUERYTYPE_PIXELTIMINGS = 16;
  static const UINT D3DQUERYTYPE_BANDWIDTHTIMINGS = 17;
  static const UINT D3DQUERYTYPE_CACHEUTILIZATION = 18;
  static const UINT D3DQUERYTYPE_MEMORYPRESSURE = 19;
  typedef UINT D3DDISPLAYROTATION; //Alias
  static const UINT D3DDISPLAYROTATION_IDENTITY = 1;
  static const UINT D3DDISPLAYROTATION_90 = 2;
  static const UINT D3DDISPLAYROTATION_180 = 3;
  static const UINT D3DDISPLAYROTATION_270 = 4;
  typedef UINT D3DTEXTUREFILTERTYPE; //Alias
  static const UINT D3DTEXF_NONE = 0;
  static const UINT D3DTEXF_POINT = 1;
  static const UINT D3DTEXF_LINEAR = 2;
  static const UINT D3DTEXF_ANISOTROPIC = 3;
  static const UINT D3DTEXF_PYRAMIDALQUAD = 6;
  static const UINT D3DTEXF_GAUSSIANQUAD = 7;
  static const UINT D3DTEXF_CONVOLUTIONMONO = 8;
  typedef UINT D3DCUBEMAP_FACES; //Alias
  static const UINT D3DCUBEMAP_FACE_POSITIVE_X = 0;
  static const UINT D3DCUBEMAP_FACE_NEGATIVE_X = 1;
  static const UINT D3DCUBEMAP_FACE_POSITIVE_Y = 2;
  static const UINT D3DCUBEMAP_FACE_NEGATIVE_Y = 3;
  static const UINT D3DCUBEMAP_FACE_POSITIVE_Z = 4;
  static const UINT D3DCUBEMAP_FACE_NEGATIVE_Z = 5;
  typedef UINT D3DCOMPOSERECTSOP; //Alias
  static const UINT D3DCOMPOSERECTS_COPY = 1;
  static const UINT D3DCOMPOSERECTS_OR = 2;
  static const UINT D3DCOMPOSERECTS_AND = 3;
  static const UINT D3DCOMPOSERECTS_NEG = 4;
  typedef UINT D3DAUTHENTICATEDCHANNELTYPE; //Alias
  static const UINT D3DAUTHENTICATEDCHANNEL_D3D9 = 1;
  static const UINT D3DAUTHENTICATEDCHANNEL_DRIVER_SOFTWARE = 2;
  static const UINT D3DAUTHENTICATEDCHANNEL_DRIVER_HARDWARE = 3;
  typedef UINT D3DTRANSFORMSTATETYPE; //Alias
  static const UINT D3DTS_VIEW = 2;
  static const UINT D3DTS_PROJECTION = 3;
  static const UINT D3DTS_TEXTURE0 = 16;
  static const UINT D3DTS_TEXTURE1 = 17;
  static const UINT D3DTS_TEXTURE2 = 18;
  static const UINT D3DTS_TEXTURE3 = 19;
  static const UINT D3DTS_TEXTURE4 = 20;
  static const UINT D3DTS_TEXTURE5 = 21;
  static const UINT D3DTS_TEXTURE6 = 22;
  static const UINT D3DTS_TEXTURE7 = 23;
  typedef UINT D3DRENDERSTATETYPE; //Alias
  static const UINT D3DRS_ZENABLE = 7;
  static const UINT D3DRS_FILLMODE = 8;
  static const UINT D3DRS_SHADEMODE = 9;
  static const UINT D3DRS_ZWRITEENABLE = 14;
  static const UINT D3DRS_ALPHATESTENABLE = 15;
  static const UINT D3DRS_LASTPIXEL = 16;
  static const UINT D3DRS_SRCBLEND = 19;
  static const UINT D3DRS_DESTBLEND = 20;
  static const UINT D3DRS_CULLMODE = 22;
  static const UINT D3DRS_ZFUNC = 23;
  static const UINT D3DRS_ALPHAREF = 24;
  static const UINT D3DRS_ALPHAFUNC = 25;
  static const UINT D3DRS_DITHERENABLE = 26;
  static const UINT D3DRS_ALPHABLENDENABLE = 27;
  static const UINT D3DRS_FOGENABLE = 28;
  static const UINT D3DRS_SPECULARENABLE = 29;
  static const UINT D3DRS_FOGCOLOR = 34;
  static const UINT D3DRS_FOGTABLEMODE = 35;
  static const UINT D3DRS_FOGSTART = 36;
  static const UINT D3DRS_FOGEND = 37;
  static const UINT D3DRS_FOGDENSITY = 38;
  static const UINT D3DRS_RANGEFOGENABLE = 48;
  static const UINT D3DRS_STENCILENABLE = 52;
  static const UINT D3DRS_STENCILFAIL = 53;
  static const UINT D3DRS_STENCILZFAIL = 54;
  static const UINT D3DRS_STENCILPASS = 55;
  static const UINT D3DRS_STENCILFUNC = 56;
  static const UINT D3DRS_STENCILREF = 57;
  static const UINT D3DRS_STENCILMASK = 58;
  static const UINT D3DRS_STENCILWRITEMASK = 59;
  static const UINT D3DRS_TEXTUREFACTOR = 60;
  static const UINT D3DRS_WRAP0 = 128;
  static const UINT D3DRS_WRAP1 = 129;
  static const UINT D3DRS_WRAP2 = 130;
  static const UINT D3DRS_WRAP3 = 131;
  static const UINT D3DRS_WRAP4 = 132;
  static const UINT D3DRS_WRAP5 = 133;
  static const UINT D3DRS_WRAP6 = 134;
  static const UINT D3DRS_WRAP7 = 135;
  static const UINT D3DRS_CLIPPING = 136;
  static const UINT D3DRS_LIGHTING = 137;
  static const UINT D3DRS_AMBIENT = 139;
  static const UINT D3DRS_FOGVERTEXMODE = 140;
  static const UINT D3DRS_COLORVERTEX = 141;
  static const UINT D3DRS_LOCALVIEWER = 142;
  static const UINT D3DRS_NORMALIZENORMALS = 143;
  static const UINT D3DRS_DIFFUSEMATERIALSOURCE = 145;
  static const UINT D3DRS_SPECULARMATERIALSOURCE = 146;
  static const UINT D3DRS_AMBIENTMATERIALSOURCE = 147;
  static const UINT D3DRS_EMISSIVEMATERIALSOURCE = 148;
  static const UINT D3DRS_VERTEXBLEND = 151;
  static const UINT D3DRS_CLIPPLANEENABLE = 152;
  static const UINT D3DRS_POINTSIZE = 154;
  static const UINT D3DRS_POINTSIZE_MIN = 155;
  static const UINT D3DRS_POINTSPRITEENABLE = 156;
  static const UINT D3DRS_POINTSCALEENABLE = 157;
  static const UINT D3DRS_POINTSCALE_A = 158;
  static const UINT D3DRS_POINTSCALE_B = 159;
  static const UINT D3DRS_POINTSCALE_C = 160;
  static const UINT D3DRS_MULTISAMPLEANTIALIAS = 161;
  static const UINT D3DRS_MULTISAMPLEMASK = 162;
  static const UINT D3DRS_PATCHEDGESTYLE = 163;
  static const UINT D3DRS_DEBUGMONITORTOKEN = 165;
  static const UINT D3DRS_POINTSIZE_MAX = 166;
  static const UINT D3DRS_INDEXEDVERTEXBLENDENABLE = 167;
  static const UINT D3DRS_COLORWRITEENABLE = 168;
  static const UINT D3DRS_TWEENFACTOR = 170;
  static const UINT D3DRS_BLENDOP = 171;
  static const UINT D3DRS_POSITIONDEGREE = 172;
  static const UINT D3DRS_NORMALDEGREE = 173;
  static const UINT D3DRS_SCISSORTESTENABLE = 174;
  static const UINT D3DRS_SLOPESCALEDEPTHBIAS = 175;
  static const UINT D3DRS_ANTIALIASEDLINEENABLE = 176;
  static const UINT D3DRS_MINTESSELLATIONLEVEL = 178;
  static const UINT D3DRS_MAXTESSELLATIONLEVEL = 179;
  static const UINT D3DRS_ADAPTIVETESS_X = 180;
  static const UINT D3DRS_ADAPTIVETESS_Y = 181;
  static const UINT D3DRS_ADAPTIVETESS_Z = 182;
  static const UINT D3DRS_ADAPTIVETESS_W = 183;
  static const UINT D3DRS_ENABLEADAPTIVETESSELLATION = 184;
  static const UINT D3DRS_TWOSIDEDSTENCILMODE = 185;
  static const UINT D3DRS_CCW_STENCILFAIL = 186;
  static const UINT D3DRS_CCW_STENCILZFAIL = 187;
  static const UINT D3DRS_CCW_STENCILPASS = 188;
  static const UINT D3DRS_CCW_STENCILFUNC = 189;
  static const UINT D3DRS_COLORWRITEENABLE1 = 190;
  static const UINT D3DRS_COLORWRITEENABLE2 = 191;
  static const UINT D3DRS_COLORWRITEENABLE3 = 192;
  static const UINT D3DRS_BLENDFACTOR = 193;
  static const UINT D3DRS_SRGBWRITEENABLE = 194;
  static const UINT D3DRS_DEPTHBIAS = 195;
  static const UINT D3DRS_WRAP8 = 198;
  static const UINT D3DRS_WRAP9 = 199;
  static const UINT D3DRS_WRAP10 = 200;
  static const UINT D3DRS_WRAP11 = 201;
  static const UINT D3DRS_WRAP12 = 202;
  static const UINT D3DRS_WRAP13 = 203;
  static const UINT D3DRS_WRAP14 = 204;
  static const UINT D3DRS_WRAP15 = 205;
  static const UINT D3DRS_SEPARATEALPHABLENDENABLE = 206;
  static const UINT D3DRS_SRCBLENDALPHA = 207;
  static const UINT D3DRS_DESTBLENDALPHA = 208;
  static const UINT D3DRS_BLENDOPALPHA = 209;
  typedef UINT D3DSTATEBLOCKTYPE; //Alias
  static const UINT D3DSBT_ALL = 1;
  static const UINT D3DSBT_PIXELSTATE = 2;
  static const UINT D3DSBT_VERTEXSTATE = 3;
  typedef UINT D3DTEXTURESTAGESTATETYPE; //Alias
  static const UINT D3DTSS_COLOROP = 1;
  static const UINT D3DTSS_COLORARG1 = 2;
  static const UINT D3DTSS_COLORARG2 = 3;
  static const UINT D3DTSS_ALPHAOP = 4;
  static const UINT D3DTSS_ALPHAARG1 = 5;
  static const UINT D3DTSS_ALPHAARG2 = 6;
  static const UINT D3DTSS_BUMPENVMAT00 = 7;
  static const UINT D3DTSS_BUMPENVMAT01 = 8;
  static const UINT D3DTSS_BUMPENVMAT10 = 9;
  static const UINT D3DTSS_BUMPENVMAT11 = 10;
  static const UINT D3DTSS_TEXCOORDINDEX = 11;
  static const UINT D3DTSS_BUMPENVLSCALE = 22;
  static const UINT D3DTSS_BUMPENVLOFFSET = 23;
  static const UINT D3DTSS_TEXTURETRANSFORMFLAGS = 24;
  static const UINT D3DTSS_COLORARG0 = 26;
  static const UINT D3DTSS_ALPHAARG0 = 27;
  static const UINT D3DTSS_RESULTARG = 28;
  static const UINT D3DTSS_CONSTANT = 32;
  typedef UINT D3DSAMPLERSTATETYPE; //Alias
  static const UINT D3DSAMP_ADDRESSU = 1;
  static const UINT D3DSAMP_ADDRESSV = 2;
  static const UINT D3DSAMP_ADDRESSW = 3;
  static const UINT D3DSAMP_BORDERCOLOR = 4;
  static const UINT D3DSAMP_MAGFILTER = 5;
  static const UINT D3DSAMP_MINFILTER = 6;
  static const UINT D3DSAMP_MIPFILTER = 7;
  static const UINT D3DSAMP_MIPMAPLODBIAS = 8;
  static const UINT D3DSAMP_MAXMIPLEVEL = 9;
  static const UINT D3DSAMP_MAXANISOTROPY = 10;
  static const UINT D3DSAMP_SRGBTEXTURE = 11;
  static const UINT D3DSAMP_ELEMENTINDEX = 12;
  static const UINT D3DSAMP_DMAPOFFSET = 13;
  typedef UINT D3DPRIMITIVETYPE; //Alias
  static const UINT D3DPT_POINTLIST = 1;
  static const UINT D3DPT_LINELIST = 2;
  static const UINT D3DPT_LINESTRIP = 3;
  static const UINT D3DPT_TRIANGLELIST = 4;
  static const UINT D3DPT_TRIANGLESTRIP = 5;
  static const UINT D3DPT_TRIANGLEFAN = 6;
  typedef struct D3DADAPTER_IDENTIFIER9 {
    char Driver[MAX_DEVICE_IDENTIFIER_STRING];
    char Description[MAX_DEVICE_IDENTIFIER_STRING];
    char DeviceName[32];
    LARGE_INTEGER DriverVersion;
    DWORD VendorId;
    DWORD DeviceId;
    DWORD SubSysId;
    DWORD Revision;
    GUID DeviceIdentifier;
    DWORD WHQLLevel;
  } D3DADAPTER_IDENTIFIER9;
  typedef struct D3D_OMAC {
    BYTE Omac[D3D_OMAC_SIZE];
  } D3D_OMAC;
  typedef struct D3DAUTHENTICATEDCHANNEL_CONFIGURE_OUTPUT {
    D3D_OMAC omac;
    GUID ConfigureType;
    HANDLE hChannel;
    UINT SequenceNumber;
    HRESULT ReturnCode;
  } D3DAUTHENTICATEDCHANNEL_CONFIGURE_OUTPUT;
  typedef struct D3DGAMMARAMP {
    WORD red[256];
    WORD green[256];
    WORD blue[256];
  } D3DGAMMARAMP;
  typedef struct D3DMATRIX {
    float m[4][4];
  } D3DMATRIX;
  typedef struct D3DDISPLAYMODE {
    UINT Width;
    UINT Height;
    UINT RefreshRate;
    D3DFORMAT Format;
  } D3DDISPLAYMODE;
  typedef DWORD WINAPI_D3DVS20CAPS; //Alias
  typedef struct D3DVSHADERCAPS2_0 {
    WINAPI_D3DVS20CAPS Caps;
    INT DynamicFlowControlDepth;
    INT NumTemps;
    INT StaticFlowControlDepth;
  } D3DVSHADERCAPS2_0;
  typedef DWORD WINAPI_D3DPS20CAPS; //Alias
  typedef struct D3DPSHADERCAPS2_0 {
    WINAPI_D3DPS20CAPS Caps;
    INT DynamicFlowControlDepth;
    INT NumTemps;
    INT StaticFlowControlDepth;
    INT NumInstructionSlots;
  } D3DPSHADERCAPS2_0;
  typedef DWORD WINAPI_D3DCAPS; //Alias
  typedef DWORD WINAPI_D3DCAPS2; //Alias
  typedef DWORD WINAPI_D3DCAPS3; //Alias
  typedef DWORD WINAPI_D3DPRESENT; //Alias
  typedef DWORD WINAPI_D3DCURSORCAPS; //Alias
  typedef DWORD WINAPI_D3DDEVCAPS; //Alias
  typedef DWORD WINAPI_D3DPMISCCAPS; //Alias
  typedef DWORD WINAPI_D3DLINECAPS; //Alias
  typedef DWORD WINAPI_D3DPRASTERCAPS; //Alias
  typedef DWORD WINAPI_D3DPCMPCAPS; //Alias
  typedef DWORD WINAPI_D3DPBLENDCAPS; //Alias
  typedef DWORD WINAPI_D3DPSHADECAPS; //Alias
  typedef DWORD WINAPI_D3DPTEXTURECAPS; //Alias
  typedef DWORD WINAPI_D3DPTFILTERCAPS; //Alias
  typedef DWORD WINAPI_D3DPTADDRESSCAPS; //Alias
  typedef DWORD WINAPI_D3DSTENCILCAPS; //Alias
  typedef DWORD WINAPI_D3DTEXOPCAPS; //Alias
  typedef DWORD WINAPI_D3DFVFCAPS; //Alias
  typedef DWORD WINAPI_D3DVTXPCAPS; //Alias
  typedef DWORD WINAPI_D3DDEVCAPS2; //Alias
  typedef DWORD WINAPI_D3DDTCAPS; //Alias
  typedef struct D3DCAPS9 {
    D3DDEVTYPE DeviceType;
    UINT AdapterOrdinal;
    WINAPI_D3DCAPS Caps;
    WINAPI_D3DCAPS2 Caps2;
    WINAPI_D3DCAPS3 Caps3;
    WINAPI_D3DPRESENT PresentationIntervals;
    WINAPI_D3DCURSORCAPS CursorCaps;
    WINAPI_D3DDEVCAPS DevCaps;
    WINAPI_D3DPMISCCAPS PrimitiveMiscCaps;
    WINAPI_D3DPRASTERCAPS RasterCaps;
    WINAPI_D3DPCMPCAPS ZCmpCaps;
    WINAPI_D3DPBLENDCAPS SrcBlendCaps;
    WINAPI_D3DPBLENDCAPS DestBlendCaps;
    WINAPI_D3DPCMPCAPS AlphaCmpCaps;
    WINAPI_D3DPSHADECAPS ShadeCaps;
    WINAPI_D3DPTEXTURECAPS TextureCaps;
    WINAPI_D3DPTFILTERCAPS TextureFilterCaps;
    WINAPI_D3DPTFILTERCAPS CubeTextureFilterCaps;
    WINAPI_D3DPTFILTERCAPS VolumeTextureFilterCaps;
    WINAPI_D3DPTADDRESSCAPS TextureAddressCaps;
    WINAPI_D3DPTADDRESSCAPS VolumeTextureAddressCaps;
    WINAPI_D3DLINECAPS LineCaps;
    DWORD MaxTextureWidth;
    DWORD MaxTextureHeight;
    DWORD MaxVolumeExtent;
    DWORD MaxTextureRepeat;
    DWORD MaxTextureAspectRatio;
    DWORD MaxAnisotropy;
    float MaxVertexW;
    float GuardBandLeft;
    float GuardBandTop;
    float GuardBandRight;
    float GuardBandBottom;
    float ExtentsAdjust;
    WINAPI_D3DSTENCILCAPS StencilCaps;
    WINAPI_D3DFVFCAPS FVFCaps;
    WINAPI_D3DTEXOPCAPS TextureOpCaps;
    DWORD MaxTextureBlendStages;
    DWORD MaxSimultaneousTextures;
    WINAPI_D3DVTXPCAPS VertexProcessingCaps;
    DWORD MaxActiveLights;
    DWORD MaxUserClipPlanes;
    DWORD MaxVertexBlendMatrices;
    DWORD MaxVertexBlendMatrixIndex;
    float MaxPointSize;
    DWORD MaxPrimitiveCount;
    DWORD MaxVertexIndex;
    DWORD MaxStreams;
    DWORD MaxStreamStride;
    DWORD VertexShaderVersion;
    DWORD MaxVertexShaderConst;
    DWORD PixelShaderVersion;
    float PixelShader1xMaxValue;
    WINAPI_D3DDEVCAPS2 DevCaps2;
    float MaxNpatchTessellationLevel;
    DWORD Reserved5;
    UINT MasterAdapterOrdinal;
    UINT AdapterOrdinalInGroup;
    UINT NumberOfAdaptersInGroup;
    WINAPI_D3DDTCAPS DeclTypes;
    DWORD NumSimultaneousRTs;
    WINAPI_D3DPTFILTERCAPS StretchRectFilterCaps;
    D3DVSHADERCAPS2_0 VS20Caps;
    D3DPSHADERCAPS2_0 PS20Caps;
    WINAPI_D3DPTFILTERCAPS VertexTextureFilterCaps;
    DWORD MaxVShaderInstructionsExecuted;
    DWORD MaxPShaderInstructionsExecuted;
    DWORD MaxVertexShader30InstructionSlots;
    DWORD MaxPixelShader30InstructionSlots;
  } D3DCAPS9;
  typedef UINT D3DSWAPEFFECT; //Alias
  static const UINT D3DSWAPEFFECT_DISCARD = 1;
  static const UINT D3DSWAPEFFECT_FLIP = 2;
  static const UINT D3DSWAPEFFECT_COPY = 3;
  static const UINT D3DSWAPEFFECT_OVERLAY = 4;
  static const UINT D3DSWAPEFFECT_FLIPEX = 5;
  typedef DWORD WINAPI_D3DPRESENTFLAG; //Alias
  typedef struct D3DPRESENT_PARAMETERS {
    UINT BackBufferWidth;
    UINT BackBufferHeight;
    D3DFORMAT BackBufferFormat;
    UINT BackBufferCount;
    D3DMULTISAMPLE_TYPE MultiSampleType;
    DWORD MultiSampleQuality;
    D3DSWAPEFFECT SwapEffect;
    HWND hDeviceWindow;
    BOOL Windowed;
    BOOL EnableAutoDepthStencil;
    D3DFORMAT AutoDepthStencilFormat;
    WINAPI_D3DPRESENTFLAG Flags;
    UINT FullScreen_RefreshRateInHz;
    UINT PresentationInterval;
  } D3DPRESENT_PARAMETERS;
  typedef DWORD WINAPI_D3DUSAGE; //Alias
  typedef struct D3DSURFACE_DESC {
    D3DFORMAT Format;
    D3DRESOURCETYPE Type;
    WINAPI_D3DUSAGE Usage;
    D3DPOOL Pool;
    D3DMULTISAMPLE_TYPE MultiSampleType;
    DWORD MultiSampleQuality;
    UINT Width;
    UINT Height;
  } D3DSURFACE_DESC;
  typedef struct D3DLOCKED_RECT {
    INT Pitch;
    void* pBits;
  } D3DLOCKED_RECT;
  typedef struct D3DRASTER_STATUS {
    BOOL InVBlank;
    UINT ScanLine;
  } D3DRASTER_STATUS;
  typedef BYTE D3DDECLUSAGE; //Alias
  typedef BYTE D3DDECLTYPE; //Alias
  typedef BYTE D3DDECLMETHOD; //Alias
  typedef struct D3DVERTEXELEMENT9 {
    WORD Stream;
    WORD Offset;
    D3DDECLTYPE Type;
    D3DDECLMETHOD Method;
    D3DDECLUSAGE Usage;
    BYTE UsageIndex;
  } D3DVERTEXELEMENT9;
  typedef UINT D3DSCANLINEORDERING; //Alias
  static const UINT D3DSCANLINEORDERING_UNKNOWN = 0;
  static const UINT D3DSCANLINEORDERING_PROGRESSIVE = 1;
  static const UINT D3DSCANLINEORDERING_INTERLACED = 2;
  typedef struct D3DDISPLAYMODEFILTER {
    UINT Size;
    D3DFORMAT Format;
    D3DSCANLINEORDERING ScanLineOrdering;
  } D3DDISPLAYMODEFILTER;
  typedef struct D3DDISPLAYMODEEX {
    UINT Size;
    UINT Width;
    UINT Height;
    UINT RefreshRate;
    D3DFORMAT Format;
    D3DSCANLINEORDERING ScanLineOrdering;
  } D3DDISPLAYMODEEX;
  typedef UINT WINAPI_D3DOVERLAYCAPS; //Alias
  typedef struct D3DOVERLAYCAPS {
    WINAPI_D3DOVERLAYCAPS Caps;
    UINT MaxOverlayDisplayWidth;
    UINT MaxOverlayDisplayHeight;
  } D3DOVERLAYCAPS;
  typedef struct D3DENCRYPTED_BLOCK_INFO {
    UINT NumEncryptedBytesAtBeginning;
    UINT NumBytesInSkipPattern;
    UINT NumBytesInEncryptPattern;
  } D3DENCRYPTED_BLOCK_INFO;
  typedef struct D3DINDEXBUFFER_DESC {
    D3DFORMAT Format;
    D3DRESOURCETYPE Type;
    WINAPI_D3DUSAGE Usage;
    D3DPOOL Pool;
    UINT Size;
  } D3DINDEXBUFFER_DESC;
  typedef struct D3DPRESENTSTATS {
    UINT PresentCount;
    UINT PresentRefreshCount;
    UINT SyncRefreshCount;
    LARGE_INTEGER SyncQPCTime;
    LARGE_INTEGER SyncGPUTime;
  } D3DPRESENTSTATS;
  typedef struct D3DVERTEXBUFFER_DESC {
    D3DFORMAT Format;
    D3DRESOURCETYPE Type;
    WINAPI_D3DUSAGE Usage;
    D3DPOOL Pool;
    UINT Size;
    DWORD FVF;
  } D3DVERTEXBUFFER_DESC;
  typedef struct D3DVOLUME_DESC {
    D3DFORMAT Format;
    D3DRESOURCETYPE Type;
    DWORD Usage;
    D3DPOOL Pool;
    UINT Width;
    UINT Height;
    UINT Depth;
  } D3DVOLUME_DESC;
  typedef struct D3DLOCKED_BOX {
    INT RowPitch;
    INT SlicePitch;
    void* pBits;
  } D3DLOCKED_BOX;
  typedef struct D3DBOX {
    UINT Left;
    UINT Top;
    UINT Right;
    UINT Bottom;
    UINT Front;
    UINT Back;
  } D3DBOX;
  typedef DWORD WINAPI_D3DCPCAPS; //Alias
  typedef struct D3DCONTENTPROTECTIONCAPS {
    WINAPI_D3DCPCAPS Caps;
    GUID KeyExchangeType;
    UINT BufferAlignmentStart;
    UINT BlockAlignmentSize;
    ULONGLONG ProtectedMemorySize;
  } D3DCONTENTPROTECTIONCAPS;
  typedef DWORD WINAPI_D3DCREATE; //Alias
  typedef struct D3DDEVICE_CREATION_PARAMETERS {
    UINT AdapterOrdinal;
    D3DDEVTYPE DeviceType;
    HWND hFocusWindow;
    WINAPI_D3DCREATE BehaviorFlags;
  } D3DDEVICE_CREATION_PARAMETERS;
  typedef struct D3DRECT {
    LONG x1;
    LONG y1;
    LONG x2;
    LONG y2;
  } D3DRECT;
  typedef struct D3DVIEWPORT9 {
    DWORD X;
    DWORD Y;
    DWORD Width;
    DWORD Height;
    float MinZ;
    float MaxZ;
  } D3DVIEWPORT9;
  typedef struct D3DMATERIAL9 {
    D3DCOLORVALUE Diffuse;
    D3DCOLORVALUE Ambient;
    D3DCOLORVALUE Specular;
    D3DCOLORVALUE Emissive;
    float Power;
  } D3DMATERIAL9;
  typedef UINT D3DLIGHTTYPE; //Alias
  static const UINT D3DLIGHT_POINT = 1;
  static const UINT D3DLIGHT_SPOT = 2;
  static const UINT D3DLIGHT_DIRECTIONAL = 3;
  typedef struct D3DLIGHT9 {
    D3DLIGHTTYPE Type;
    D3DCOLORVALUE Diffuse;
    D3DCOLORVALUE Specular;
    D3DCOLORVALUE Ambient;
    D3DVECTOR Position;
    D3DVECTOR Direction;
    float Range;
    float Falloff;
    float Attenuation0;
    float Attenuation1;
    float Attenuation2;
    float Theta;
    float Phi;
  } D3DLIGHT9;
  typedef DWORD WINAPI_D3DCS; //Alias
  typedef struct D3DCLIPSTATUS9 {
    WINAPI_D3DCS ClipUnion;
    WINAPI_D3DCS ClipIntersection;
  } D3DCLIPSTATUS9;
  typedef UINT D3DBASISTYPE; //Alias
  static const UINT D3DBASIS_BEZIER = 0;
  static const UINT D3DBASIS_BSPLINE = 1;
  static const UINT D3DBASIS_CATMULL_ROM = 2;
  typedef UINT D3DDEGREETYPE; //Alias
  static const UINT D3DDEGREE_LINEAR = 1;
  static const UINT D3DDEGREE_QUADRATIC = 2;
  static const UINT D3DDEGREE_CUBIC = 3;
  static const UINT D3DDEGREE_QUINTIC = 5;
  typedef struct D3DRECTPATCH_INFO {
    UINT StartVertexOffsetWidth;
    UINT StartVertexOffsetHeight;
    UINT Width;
    UINT Height;
    UINT Stride;
    D3DBASISTYPE Basis;
    D3DDEGREETYPE Degree;
  } D3DRECTPATCH_INFO;
  typedef struct D3DTRIPATCH_INFO {
    UINT StartVertexOffset;
    UINT NumVertices;
    D3DBASISTYPE Basis;
    D3DDEGREETYPE Degree;
  } D3DTRIPATCH_INFO;
  typedef DWORD WINAPI_D3DCLEAR_FLAGS; //Alias
]]
