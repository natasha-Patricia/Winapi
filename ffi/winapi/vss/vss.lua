require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IVssAdmin; //Interface
  typedef void* IVssAdminEx; //Interface
  typedef void* IVssAsync; //Interface
  typedef void* IVssBackupComponents; //Interface
  typedef void* IVssBackupComponentsEx; //Interface
  typedef void* IVssBackupComponentsEx2; //Interface
  typedef void* IVssBackupComponentsEx3; //Interface
  typedef void* IVssComponent; //Interface
  typedef void* IVssComponentEx; //Interface
  typedef void* IVssComponentEx2; //Interface
  typedef void* IVssCreateExpressWriterMetadata; //Interface
  typedef void* IVssCreateWriterMetadataEx; //Interface
  typedef void* IVssDifferentialSoftwareSnapshotMgmt; //Interface
  typedef void* IVssDifferentialSoftwareSnapshotMgmt2; //Interface
  typedef void* IVssDifferentialSoftwareSnapshotMgmt3; //Interface
  typedef void* IVssEnumMgmtObject; //Interface
  typedef void* IVssEnumObject; //Interface
  typedef void* IVssExamineWriterMetadata; //Interface
  typedef void* IVssExamineWriterMetadataEx; //Interface
  typedef void* IVssExamineWriterMetadataEx2; //Interface
  typedef void* IVssExpressWriter; //Interface
  typedef void* IVssHardwareSnapshotProvider; //Interface
  typedef void* IVssHardwareSnapshotProviderEx; //Interface
  typedef void* IVssProviderCreateSnapshotSet; //Interface
  typedef void* IVssProviderNotifications; //Interface
  typedef void* IVssSnapshotMgmt; //Interface
  typedef void* IVssSnapshotMgmt2; //Interface
  typedef void* IVssSoftwareSnapshotProvider; //Interface
  typedef void* IVssWMComponent; //Interface
  typedef void* IVssWMFiledesc; //Interface
  typedef void* IVssWriterComponentsExt; //Interface
  typedef void* IVssWriterImpl; //Interface
  typedef GUID VSS_ID; //Alias
  typedef WCHAR* VSS_PWSZ; //Alias
  typedef LONGLONG VSS_TIMESTAMP; //Alias
  typedef HRESULT WINAPI_VSS_HRESULT; //Alias
  static const HRESULT VSS_E_BAD_STATE = 0x80042301;
  static const HRESULT VSS_E_UNEXPECTED = 0x80042302;
  static const HRESULT VSS_E_PROVIDER_ALREADY_REGISTERED = 0x80042303;
  static const HRESULT VSS_E_PROVIDER_NOT_REGISTERED = 0x80042304;
  static const HRESULT VSS_E_PROVIDER_VETO = 0x80042306;
  static const HRESULT VSS_E_PROVIDER_IN_USE = 0x80042307;
  static const HRESULT VSS_E_OBJECT_NOT_FOUND = 0x80042308;
  static const HRESULT VSS_S_ASYNC_PENDING = 0x00042309;
  static const HRESULT VSS_S_ASYNC_FINISHED = 0x0004230A;
  static const HRESULT VSS_S_ASYNC_CANCELLED = 0x0004230B;
  static const HRESULT VSS_E_VOLUME_NOT_SUPPORTED = 0x8004230C;
  static const HRESULT VSS_E_VOLUME_NOT_SUPPORTED_BY_PROVIDER = 0x8004230E;
  static const HRESULT VSS_E_OBJECT_ALREADY_EXISTS = 0x8004230D;
  static const HRESULT VSS_E_UNEXPECTED_PROVIDER_ERROR = 0x8004230F;
  static const HRESULT VSS_E_CORRUPT_XML_DOCUMENT = 0x80042310;
  static const HRESULT VSS_E_INVALID_XML_DOCUMENT = 0x80042311;
  static const HRESULT VSS_E_MAXIMUM_NUMBER_OF_VOLUMES_REACHED = 0x80042312;
  static const HRESULT VSS_E_FLUSH_WRITES_TIMEOUT = 0x80042313;
  static const HRESULT VSS_E_HOLD_WRITES_TIMEOUT = 0x80042314;
  static const HRESULT VSS_E_UNEXPECTED_WRITER_ERROR = 0x80042315;
  static const HRESULT VSS_E_SNAPSHOT_SET_IN_PROGRESS = 0x80042316;
  static const HRESULT VSS_E_MAXIMUM_NUMBER_OF_SNAPSHOTS_REACHED = 0x80042317;
  static const HRESULT VSS_E_WRITER_INFRASTRUCTURE = 0x80042318;
  static const HRESULT VSS_E_WRITER_NOT_RESPONDING = 0x80042319;
  static const HRESULT VSS_E_WRITER_ALREADY_SUBSCRIBED = 0x8004231A;
  static const HRESULT VSS_E_UNSUPPORTED_CONTEXT = 0x8004231B;
  static const HRESULT VSS_E_VOLUME_IN_USE = 0x8004231D;
  static const HRESULT VSS_E_MAXIMUM_DIFFAREA_ASSOCIATIONS_REACHED = 0x8004231E;
  static const HRESULT VSS_E_INSUFFICIENT_STORAGE = 0x8004231F;
  static const HRESULT VSS_E_NO_SNAPSHOTS_IMPORTED = 0x80042320;
  static const HRESULT VSS_S_SOME_SNAPSHOTS_NOT_IMPORTED = 0x00042321;
  static const HRESULT VSS_E_SOME_SNAPSHOTS_NOT_IMPORTED = 0x80042321;
  static const HRESULT VSS_E_MAXIMUM_NUMBER_OF_REMOTE_MACHINES_REACHED = 0x80042322;
  static const HRESULT VSS_E_REMOTE_SERVER_UNAVAILABLE = 0x80042323;
  static const HRESULT VSS_E_REMOTE_SERVER_UNSUPPORTED = 0x80042324;
  static const HRESULT VSS_E_REVERT_IN_PROGRESS = 0x80042325;
  static const HRESULT VSS_E_REVERT_VOLUME_LOST = 0x80042326;
  static const HRESULT VSS_E_REBOOT_REQUIRED = 0x80042327;
  static const HRESULT VSS_E_TRANSACTION_FREEZE_TIMEOUT = 0x80042328;
  static const HRESULT VSS_E_TRANSACTION_THAW_TIMEOUT = 0x80042329;
  static const HRESULT VSS_E_VOLUME_NOT_LOCAL = 0x8004232D;
  static const HRESULT VSS_E_CLUSTER_TIMEOUT = 0x8004232E;
  static const HRESULT VSS_E_WRITERERROR_INCONSISTENTSNAPSHOT = 0x800423F0;
  static const HRESULT VSS_E_WRITERERROR_OUTOFRESOURCES = 0x800423F1;
  static const HRESULT VSS_E_WRITERERROR_TIMEOUT = 0x800423F2;
  static const HRESULT VSS_E_WRITERERROR_RETRYABLE = 0x800423F3;
  static const HRESULT VSS_E_WRITERERROR_NONRETRYABLE = 0x800423F4;
  static const HRESULT VSS_E_WRITERERROR_RECOVERY_FAILED = 0x800423F5;
  static const HRESULT VSS_E_BREAK_REVERT_ID_FAILED = 0x800423F6;
  static const HRESULT VSS_E_LEGACY_PROVIDER = 0x800423F7;
  static const HRESULT VSS_E_MISSING_DISK = 0x800423F8;
  static const HRESULT VSS_E_MISSING_HIDDEN_VOLUME = 0x800423F9;
  static const HRESULT VSS_E_MISSING_VOLUME = 0x800423FA;
  static const HRESULT VSS_E_AUTORECOVERY_FAILED = 0x800423FB;
  static const HRESULT VSS_E_DYNAMIC_DISK_ERROR = 0x800423FC;
  static const HRESULT VSS_E_NONTRANSPORTABLE_BCD = 0x800423FD;
  static const HRESULT VSS_E_CANNOT_REVERT_DISKID = 0x800423FE;
  static const HRESULT VSS_E_RESYNC_IN_PROGRESS = 0x800423FF;
  static const HRESULT VSS_E_CLUSTER_ERROR = 0x80042400;
  static const HRESULT VSS_E_UNSELECTED_VOLUME = 0x8004232A;
  static const HRESULT VSS_E_SNAPSHOT_NOT_IN_SET = 0x8004232B;
  static const HRESULT VSS_E_NESTED_VOLUME_LIMIT = 0x8004232C;
  static const HRESULT VSS_E_NOT_SUPPORTED = 0x8004232F;
  static const HRESULT VSS_E_WRITERERROR_PARTIAL_FAILURE = 0x80042336;
  static const HRESULT VSS_E_ASRERROR_DISK_ASSIGNMENT_FAILED = 0x80042401;
  static const HRESULT VSS_E_ASRERROR_DISK_RECREATION_FAILED = 0x80042402;
  static const HRESULT VSS_E_ASRERROR_NO_ARCPATH = 0x80042403;
  static const HRESULT VSS_E_ASRERROR_MISSING_DYNDISK = 0x80042404;
  static const HRESULT VSS_E_ASRERROR_SHARED_CRIDISK = 0x80042405;
  static const HRESULT VSS_E_ASRERROR_DATADISK_RDISK0 = 0x80042406;
  static const HRESULT VSS_E_ASRERROR_RDISK0_TOOSMALL = 0x80042407;
  static const HRESULT VSS_E_ASRERROR_CRITICAL_DISKS_TOO_SMALL = 0x80042408;
  static const HRESULT VSS_E_WRITER_STATUS_NOT_AVAILABLE = 0x80042409;
  static const HRESULT VSS_E_ASRERROR_DYNAMIC_VHD_NOT_SUPPORTED = 0x8004240A;
  static const HRESULT VSS_E_CRITICAL_VOLUME_ON_INVALID_DISK = 0x80042411;
  static const HRESULT VSS_E_ASRERROR_RDISK_FOR_SYSTEM_DISK_NOT_FOUND = 0x80042412;
  static const HRESULT VSS_E_ASRERROR_NO_PHYSICAL_DISK_AVAILABLE = 0x80042413;
  static const HRESULT VSS_E_ASRERROR_FIXED_PHYSICAL_DISK_AVAILABLE_AFTER_DISK_EXCLUSION = 0x80042414;
  static const HRESULT VSS_E_ASRERROR_CRITICAL_DISK_CANNOT_BE_EXCLUDED = 0x80042415;
  static const HRESULT VSS_E_ASRERROR_SYSTEM_PARTITION_HIDDEN = 0x80042416;
  typedef UINT VSS_PROVIDER_TYPE; //Alias
  static const UINT VSS_PROV_UNKNOWN = 0;
  static const UINT VSS_PROV_SYSTEM = 1;
  static const UINT VSS_PROV_SOFTWARE = 2;
  static const UINT VSS_PROV_HARDWARE = 3;
  typedef UINT VSS_BACKUP_TYPE; //Alias
  static const UINT VSS_BT_UNDEFINED = 0;
  static const UINT VSS_BT_FULL = 1;
  static const UINT VSS_BT_INCREMENTAL = 2;
  static const UINT VSS_BT_DIFFERENTIAL = 3;
  static const UINT VSS_BT_LOG = 4;
  static const UINT VSS_BT_COPY = 5;
  static const UINT VSS_BT_OTHER = 6;
  typedef UINT VSS_RESTORE_TYPE; //Alias
  static const UINT VSS_RTYPE_UNDEFINED = 0;
  static const UINT VSS_RTYPE_BY_COPY = 1;
  static const UINT VSS_RTYPE_IMPORT = 2;
  static const UINT VSS_RTYPE_OTHER = 3;
  typedef UINT VSS_COMPONENT_TYPE; //Alias
  static const UINT VSS_CT_UNDEFINED = 0;
  static const UINT VSS_CT_DATABASE = 1;
  static const UINT VSS_CT_FILEGROUP = 2;
  typedef UINT VSS_OBJECT_TYPE; //Alias
  static const UINT VSS_OBJECT_UNKNOWN = 0;
  static const UINT VSS_OBJECT_NONE = 1;
  static const UINT VSS_OBJECT_SNAPSHOT_SET = 2;
  static const UINT VSS_OBJECT_SNAPSHOT = 3;
  static const UINT VSS_OBJECT_PROVIDER = 4;
  typedef UINT VSS_WRITER_STATE; //Alias
  static const UINT VSS_WS_UNKNOWN = 0;
  static const UINT VSS_WS_STABLE = 1;
  static const UINT VSS_WS_WAITING_FOR_FREEZE = 2;
  static const UINT VSS_WS_WAITING_FOR_THAW = 3;
  static const UINT VSS_WS_WAITING_FOR_POST_SNAPSHOT = 4;
  static const UINT VSS_WS_WAITING_FOR_BACKUP_COMPLETE = 5;
  static const UINT VSS_WS_FAILED_AT_IDENTIFY = 6;
  static const UINT VSS_WS_FAILED_AT_PREPARE_BACKUP = 7;
  static const UINT VSS_WS_FAILED_AT_PREPARE_SNAPSHOT = 8;
  static const UINT VSS_WS_FAILED_AT_FREEZE = 9;
  static const UINT VSS_WS_FAILED_AT_THAW = 10;
  static const UINT VSS_WS_FAILED_AT_POST_SNAPSHOT = 11;
  static const UINT VSS_WS_FAILED_AT_BACKUP_COMPLETE = 12;
  static const UINT VSS_WS_FAILED_AT_PRE_RESTORE = 13;
  static const UINT VSS_WS_FAILED_AT_POST_RESTORE = 14;
  static const UINT VSS_WS_FAILED_AT_BACKUPSHUTDOWN = 15;
  typedef UINT VSS_RESTORE_TARGET; //Alias
  static const UINT VSS_RT_UNDEFINED = 0;
  static const UINT VSS_RT_ORIGINAL = 1;
  static const UINT VSS_RT_ALTERNATE = 2;
  static const UINT VSS_RT_DIRECTED = 3;
  static const UINT VSS_RT_ORIGINAL_LOCATION = 4;
  typedef UINT VSS_FILE_RESTORE_STATUS; //Alias
  static const UINT VSS_RS_UNDEFINED = 0;
  static const UINT VSS_RS_NONE = 1;
  static const UINT VSS_RS_ALL = 2;
  static const UINT VSS_RS_FAILED = 3;
  typedef UINT VSS_ROLLFORWARD_TYPE; //Alias
  static const UINT VSS_RF_UNDEFINED = 0;
  static const UINT VSS_RF_NONE = 1;
  static const UINT VSS_RF_ALL = 2;
  static const UINT VSS_RF_PARTIAL = 3;
  typedef UINT VSS_RESTOREMETHOD_ENUM; //Alias
  static const UINT VSS_RME_UNDEFINED = 0;
  static const UINT VSS_RME_RESTORE_IF_NOT_THERE = 1;
  static const UINT VSS_RME_RESTORE_IF_CAN_REPLACE = 2;
  static const UINT VSS_RME_STOP_RESTORE_START = 3;
  static const UINT VSS_RME_RESTORE_TO_ALTERNATE_LOCATION = 4;
  static const UINT VSS_RME_RESTORE_AT_REBOOT = 5;
  static const UINT VSS_RME_RESTORE_AT_REBOOT_IF_CANNOT_REPLACE = 6;
  static const UINT VSS_RME_CUSTOM = 7;
  static const UINT VSS_RME_RESTORE_STOP_START = 8;
  typedef UINT VSS_USAGE_TYPE; //Alias
  static const UINT VSS_UT_UNDEFINED = 0;
  static const UINT VSS_UT_BOOTABLESYSTEMSTATE = 1;
  static const UINT VSS_UT_SYSTEMSERVICE = 2;
  static const UINT VSS_UT_USERDATA = 3;
  static const UINT VSS_UT_OTHER = 4;
  typedef UINT VSS_SNAPSHOT_PROPERTY_ID; //Alias
  static const UINT VSS_SPROPID_UNKNOWN = 0;
  static const UINT VSS_SPROPID_SNAPSHOT_ID = 0x1;
  static const UINT VSS_SPROPID_SNAPSHOT_SET_ID = 0x2;
  static const UINT VSS_SPROPID_SNAPSHOTS_COUNT = 0x3;
  static const UINT VSS_SPROPID_SNAPSHOT_DEVICE = 0x4;
  static const UINT VSS_SPROPID_ORIGINAL_VOLUME = 0x5;
  static const UINT VSS_SPROPID_ORIGINATING_MACHINE = 0x6;
  static const UINT VSS_SPROPID_SERVICE_MACHINE = 0x7;
  static const UINT VSS_SPROPID_EXPOSED_NAME = 0x8;
  static const UINT VSS_SPROPID_EXPOSED_PATH = 0x9;
  static const UINT VSS_SPROPID_PROVIDER_ID = 0xa;
  static const UINT VSS_SPROPID_SNAPSHOT_ATTRIBUTES = 0xb;
  static const UINT VSS_SPROPID_CREATION_TIMESTAMP = 0xc;
  static const UINT VSS_SPROPID_STATUS = 0xd;
  typedef UINT VSS_WRITERRESTORE_ENUM; //Alias
  static const UINT VSS_WRE_UNDEFINED = 0;
  static const UINT VSS_WRE_NEVER = 1;
  static const UINT VSS_WRE_IF_REPLACE_FAILS = 2;
  static const UINT VSS_WRE_ALWAYS = 3;
  typedef UINT VSS_PROTECTION_LEVEL; //Alias
  static const UINT VSS_PROTECTION_LEVEL_ORIGINAL_VOLUME = 0;
  static const UINT VSS_PROTECTION_LEVEL_SNAPSHOT = 1;
  typedef UINT VSS_SOURCE_TYPE; //Alias
  static const UINT VSS_ST_UNDEFINED = 0;
  static const UINT VSS_ST_TRANSACTEDDB = 1;
  static const UINT VSS_ST_NONTRANSACTEDDB = 2;
  static const UINT VSS_ST_OTHER = 3;
  typedef UINT VSS_SNAPSHOT_STATE; //Alias
  static const UINT VSS_SS_UNKNOWN = 0;
  static const UINT VSS_SS_PREPARING = 1;
  static const UINT VSS_SS_PROCESSING_PREPARE = 2;
  static const UINT VSS_SS_PREPARED = 3;
  static const UINT VSS_SS_PROCESSING_PRECOMMIT = 4;
  static const UINT VSS_SS_PRECOMMITTED = 5;
  static const UINT VSS_SS_PROCESSING_COMMIT = 6;
  static const UINT VSS_SS_COMMITTED = 7;
  static const UINT VSS_SS_PROCESSING_POSTCOMMIT = 8;
  static const UINT VSS_SS_PROCESSING_PREFINALCOMMIT = 9;
  static const UINT VSS_SS_PREFINALCOMMITTED = 10;
  static const UINT VSS_SS_PROCESSING_POSTFINALCOMMIT = 11;
  static const UINT VSS_SS_CREATED = 12;
  static const UINT VSS_SS_ABORTED = 13;
  static const UINT VSS_SS_DELETED = 14;
  static const UINT VSS_SS_POSTCOMMITTED = 15;
  typedef UINT VSS_PROTECTION_FAULT; //Alias
  static const UINT VSS_PROTECTION_FAULT_NONE = 0;
  static const UINT VSS_PROTECTION_FAULT_DIFF_AREA_MISSING = 1;
  static const UINT VSS_PROTECTION_FAULT_IO_FAILURE_DURING_ONLINE = 2;
  static const UINT VSS_PROTECTION_FAULT_META_DATA_CORRUPTION = 3;
  static const UINT VSS_PROTECTION_FAULT_MEMORY_ALLOCATION_FAILURE = 4;
  static const UINT VSS_PROTECTION_FAULT_MAPPED_MEMORY_FAILURE = 5;
  static const UINT VSS_PROTECTION_FAULT_COW_READ_FAILURE = 6;
  static const UINT VSS_PROTECTION_FAULT_COW_WRITE_FAILURE = 7;
  static const UINT VSS_PROTECTION_FAULT_DIFF_AREA_FULL = 8;
  static const UINT VSS_PROTECTION_FAULT_GROW_TOO_SLOW = 9;
  static const UINT VSS_PROTECTION_FAULT_GROW_FAILED = 10;
  static const UINT VSS_PROTECTION_FAULT_DESTROY_ALL_SNAPSHOTS = 11;
  static const UINT VSS_PROTECTION_FAULT_FILE_SYSTEM_FAILURE = 12;
  static const UINT VSS_PROTECTION_FAULT_IO_FAILURE = 13;
  static const UINT VSS_PROTECTION_FAULT_DIFF_AREA_REMOVED = 14;
  static const UINT VSS_PROTECTION_FAULT_EXTERNAL_WRITER_TO_DIFF_AREA = 15;
  typedef UINT VSS_MGMT_OBJECT_TYPE; //Alias
  static const UINT VSS_MGMT_OBJECT_UNKNOWN = 0;
  static const UINT VSS_MGMT_OBJECT_VOLUME = 1;
  static const UINT VSS_MGMT_OBJECT_DIFF_VOLUME = 2;
  static const UINT VSS_MGMT_OBJECT_DIFF_AREA = 3;
  typedef UINT VDS_STORAGE_BUS_TYPE; //Alias
  static const UINT VDSBusTypeUnknown = 0;
  static const UINT VDSBusTypeScsi = 0x1;
  static const UINT VDSBusTypeAtapi = 0x2;
  static const UINT VDSBusTypeAta = 0x3;
  static const UINT VDSBusType1394 = 0x4;
  static const UINT VDSBusTypeSsa = 0x5;
  static const UINT VDSBusTypeFibre = 0x6;
  static const UINT VDSBusTypeUsb = 0x7;
  static const UINT VDSBusTypeRAID = 0x8;
  static const UINT VDSBusTypeiScsi = 0x9;
  static const UINT VDSBusTypeSas = 0xa;
  static const UINT VDSBusTypeSata = 0xb;
  static const UINT VDSBusTypeSd = 0xc;
  static const UINT VDSBusTypeMmc = 0xd;
  static const UINT VDSBusTypeMax = 0xe;
  static const UINT VDSBusTypeFileBackedVirtual = 0xf;
  typedef UINT VDS_INTERCONNECT_ADDRESS_TYPE; //Alias
  static const UINT VDS_IA_UNKNOWN = 0;
  static const UINT VDS_IA_FCFS = 1;
  static const UINT VDS_IA_FCPH = 2;
  static const UINT VDS_IA_FCPH3 = 3;
  static const UINT VDS_IA_MAC = 4;
  static const UINT VDS_IA_SCSI = 5;
  typedef UINT VDS_STORAGE_IDENTIFIER_CODE_SET; //Alias
  static const UINT VDSStorageIdCodeSetReserved = 0;
  static const UINT VDSStorageIdCodeSetBinary = 1;
  static const UINT VDSStorageIdCodeSetAscii = 2;
  static const UINT VDSStorageIdCodeSetUtf8 = 3;
  typedef UINT VDS_STORAGE_IDENTIFIER_TYPE; //Alias
  static const UINT VDSStorageIdTypeVendorSpecific = 0;
  static const UINT VDSStorageIdTypeVendorId = 1;
  static const UINT VDSStorageIdTypeEUI64 = 2;
  static const UINT VDSStorageIdTypeFCPHName = 3;
  static const UINT VDSStorageIdTypePortRelative = 4;
  static const UINT VDSStorageIdTypeTargetPortGroup = 5;
  static const UINT VDSStorageIdTypeLogicalUnitGroup = 6;
  static const UINT VDSStorageIdTypeMD5LogicalUnitIdentifier = 7;
  static const UINT VDSStorageIdTypeScsiNameString = 8;
  typedef DWORD VSS_HARDWARE_OPTIONS; //Alias
  typedef DWORD VSS_COMPONENT_FLAGS; //Alias
  typedef DWORD VSS_RECOVERY_OPTIONS; //Alias
  typedef struct VSS_SNAPSHOT_PROP {
    VSS_ID m_SnapshotId;
    VSS_ID m_SnapshotSetId;
    LONG m_lSnapshotsCount;
    VSS_PWSZ m_pwszSnapshotDeviceObject;
    VSS_PWSZ m_pwszOriginalVolumeName;
    VSS_PWSZ m_pwszOriginatingMachine;
    VSS_PWSZ m_pwszServiceMachine;
    VSS_PWSZ m_pwszExposedName;
    VSS_PWSZ m_pwszExposedPath;
    VSS_ID m_ProviderId;
    LONG m_lSnapshotAttributes;
    VSS_TIMESTAMP m_tsCreationTimestamp;
    VSS_SNAPSHOT_STATE m_eStatus;
  } VSS_SNAPSHOT_PROP;
  typedef struct VSS_VOLUME_PROTECTION_INFO {
    VSS_PROTECTION_LEVEL m_protectionLevel;
    BOOL m_volumeIsOfflineForProtection;
    VSS_PROTECTION_FAULT m_protectionFault;
    LONG m_failureStatus;
    BOOL m_volumeHasUnusedDiffArea;
    DWORD m_reserved;
  } VSS_VOLUME_PROTECTION_INFO;
  typedef struct VSS_VOLUME_PROP {
    VSS_PWSZ m_pwszVolumeName;
    VSS_PWSZ m_pwszVolumeDisplayName;
  } VSS_VOLUME_PROP;
  typedef struct VSS_DIFF_VOLUME_PROP {
    VSS_PWSZ m_pwszVolumeName;
    VSS_PWSZ m_pwszVolumeDisplayName;
    LONGLONG m_llVolumeFreeSpace;
    LONGLONG m_llVolumeTotalSpace;
  } VSS_DIFF_VOLUME_PROP;
  typedef struct VSS_DIFF_AREA_PROP {
    VSS_PWSZ m_pwszVolumeName;
    VSS_PWSZ m_pwszDiffAreaVolumeName;
    LONGLONG m_llMaximumDiffSpace;
    LONGLONG m_llAllocatedDiffSpace;
    LONGLONG m_llUsedDiffSpace;
  } VSS_DIFF_AREA_PROP;
  typedef union VSS_MGMT_OBJECT_UNION {
    VSS_VOLUME_PROP Vol;
    VSS_DIFF_VOLUME_PROP DiffVol;
    VSS_DIFF_AREA_PROP DiffArea;
  } VSS_MGMT_OBJECT_UNION;
  typedef struct VSS_MGMT_OBJECT_PROP {
    VSS_MGMT_OBJECT_TYPE Type;
    VSS_MGMT_OBJECT_UNION Obj;
  } VSS_MGMT_OBJECT_PROP;
  typedef struct VSS_PROVIDER_PROP {
    VSS_ID m_ProviderId;
    VSS_PWSZ m_pwszProviderName;
    VSS_PROVIDER_TYPE m_eProviderType;
    VSS_PWSZ m_pwszProviderVersion;
    VSS_ID m_ProviderVersionId;
    CLSID m_ClassId;
  } VSS_PROVIDER_PROP;
  typedef union VSS_OBJECT_UNION {
    VSS_SNAPSHOT_PROP Snap;
    VSS_PROVIDER_PROP Prov;
  } VSS_OBJECT_UNION;
  typedef struct VSS_OBJECT_PROP {
    VSS_OBJECT_TYPE Type;
    VSS_OBJECT_UNION Obj;
  } VSS_OBJECT_PROP;
  typedef struct VDS_STORAGE_IDENTIFIER {
    VDS_STORAGE_IDENTIFIER_CODE_SET m_CodeSet;
    VDS_STORAGE_IDENTIFIER_TYPE m_Type;
    ULONG m_cbIdentifier;
    BYTE* m_rgbIdentifier;
  } VDS_STORAGE_IDENTIFIER;
  typedef struct VDS_STORAGE_DEVICE_ID_DESCRIPTOR {
    ULONG m_version;
    ULONG m_cIdentifiers;
    VDS_STORAGE_IDENTIFIER* m_rgIdentifiers;
  } VDS_STORAGE_DEVICE_ID_DESCRIPTOR;
  typedef struct VDS_INTERCONNECT {
    VDS_INTERCONNECT_ADDRESS_TYPE m_addressType;
    ULONG m_cbPort;
    BYTE* m_pbPort;
    ULONG m_cbAddress;
    BYTE* m_pbAddress;
  } VDS_INTERCONNECT;
  typedef struct VDS_LUN_INFORMATION {
    ULONG m_version;
    BYTE m_DeviceType;
    BYTE m_DeviceTypeModifier;
    BOOL m_bCommandQueueing;
    VDS_STORAGE_BUS_TYPE m_BusType;
    char* m_szVendorId;
    char* m_szProductId;
    char* m_szProductRevision;
    char* m_szSerialNumber;
    GUID m_diskSignature;
    VDS_STORAGE_DEVICE_ID_DESCRIPTOR m_deviceIdDescriptor;
    ULONG m_cInterconnects;
    VDS_INTERCONNECT* m_rgInterconnects;
  } VDS_LUN_INFORMATION;
  typedef UINT VSS_VOLUME_SNAPSHOT_ATTRIBUTES; //Alias
]]
