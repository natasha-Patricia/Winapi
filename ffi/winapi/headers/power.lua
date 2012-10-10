require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef UINT POWER_INFORMATION_LEVEL; //Alias
  static const POWER_INFORMATION_LEVEL SystemPowerPolicyAc = 0;
  static const POWER_INFORMATION_LEVEL SystemPowerPolicyDc = 1;
  static const POWER_INFORMATION_LEVEL VerifySystemPolicyAc = 2;
  static const POWER_INFORMATION_LEVEL VerifySystemPolicyDc = 3;
  static const POWER_INFORMATION_LEVEL SystemPowerCapabilities = 4;
  static const POWER_INFORMATION_LEVEL SystemBatteryState = 5;
  static const POWER_INFORMATION_LEVEL SystemPowerStateHandler = 6;
  static const POWER_INFORMATION_LEVEL ProcessorStateHandler = 7;
  static const POWER_INFORMATION_LEVEL SystemPowerPolicyCurrent = 8;
  static const POWER_INFORMATION_LEVEL AdministratorPowerPolicy = 9;
  static const POWER_INFORMATION_LEVEL SystemReserveHiberFile = 10;
  static const POWER_INFORMATION_LEVEL ProcessorInformation = 11;
  static const POWER_INFORMATION_LEVEL SystemPowerInformation = 12;
  static const POWER_INFORMATION_LEVEL ProcessorStateHandler2 = 13;
  static const POWER_INFORMATION_LEVEL LastWakeTime = 14;
  static const POWER_INFORMATION_LEVEL LastSleepTime = 15;
  static const POWER_INFORMATION_LEVEL SystemExecutionState = 16;
  static const POWER_INFORMATION_LEVEL SystemPowerStateNotifyHandler = 17;
  static const POWER_INFORMATION_LEVEL ProcessorPowerPolicyAc = 18;
  static const POWER_INFORMATION_LEVEL ProcessorPowerPolicyDc = 19;
  static const POWER_INFORMATION_LEVEL VerifyProcessorPowerPolicyAc = 20;
  static const POWER_INFORMATION_LEVEL VerifyProcessorPowerPolicyDc = 21;
  static const POWER_INFORMATION_LEVEL ProcessorPowerPolicyCurrent = 22;
  static const POWER_INFORMATION_LEVEL SystemPowerStateLogging = 23;
  static const POWER_INFORMATION_LEVEL SystemPowerLoggingEntry = 24;
  static const POWER_INFORMATION_LEVEL SetPowerSettingValue = 25;
  static const POWER_INFORMATION_LEVEL NotifyUserPowerSetting = 26;
  static const POWER_INFORMATION_LEVEL GetPowerTransitionVetoes = 27;
  static const POWER_INFORMATION_LEVEL SetPowerTransitionVeto = 28;
  static const POWER_INFORMATION_LEVEL SystemVideoState = 29;
  static const POWER_INFORMATION_LEVEL TraceApplicationPowerMessage = 30;
  static const POWER_INFORMATION_LEVEL TraceApplicationPowerMessageEnd = 31;
  static const POWER_INFORMATION_LEVEL ProcessorPerfStates = 32;
  static const POWER_INFORMATION_LEVEL ProcessorIdleStates = 33;
  static const POWER_INFORMATION_LEVEL ProcessorThrottleStates = 34;
  static const POWER_INFORMATION_LEVEL SystemWakeSource = 35;
  static const POWER_INFORMATION_LEVEL SystemHiberFileInformation = 36;
  static const POWER_INFORMATION_LEVEL TraceServicePowerMessage = 37;
  static const POWER_INFORMATION_LEVEL ProcessorLoad = 38;
  static const POWER_INFORMATION_LEVEL PowerShutdownNotification = 39;
  typedef UINT POWER_DATA_ACCESSOR; //Alias
  static const POWER_DATA_ACCESSOR ACCESS_AC_POWER_SETTING_INDEX = 0;
  static const POWER_DATA_ACCESSOR ACCESS_DC_POWER_SETTING_INDEX = 1;
  static const POWER_DATA_ACCESSOR ACCESS_FRIENDLY_NAME = 2;
  static const POWER_DATA_ACCESSOR ACCESS_DESCRIPTION = 3;
  static const POWER_DATA_ACCESSOR ACCESS_POSSIBLE_POWER_SETTING = 4;
  static const POWER_DATA_ACCESSOR ACCESS_POSSIBLE_POWER_SETTING_FRIENDLY_NAME = 5;
  static const POWER_DATA_ACCESSOR ACCESS_POSSIBLE_POWER_SETTING_DESCRIPTION = 6;
  static const POWER_DATA_ACCESSOR ACCESS_DEFAULT_AC_POWER_SETTING = 7;
  static const POWER_DATA_ACCESSOR ACCESS_DEFAULT_DC_POWER_SETTING = 8;
  static const POWER_DATA_ACCESSOR ACCESS_POSSIBLE_VALUE_MIN = 9;
  static const POWER_DATA_ACCESSOR ACCESS_POSSIBLE_VALUE_MAX = 10;
  static const POWER_DATA_ACCESSOR ACCESS_POSSIBLE_VALUE_INCREMENT = 11;
  static const POWER_DATA_ACCESSOR ACCESS_POSSIBLE_VALUE_UNITS = 12;
  static const POWER_DATA_ACCESSOR ACCESS_ICON_RESOURCE = 13;
  static const POWER_DATA_ACCESSOR ACCESS_DEFAULT_SECURITY_DESCRIPTOR = 14;
  static const POWER_DATA_ACCESSOR ACCESS_ATTRIBUTES = 15;
  static const POWER_DATA_ACCESSOR ACCESS_SCHEME = 16;
  static const POWER_DATA_ACCESSOR ACCESS_SUBGROUP = 17;
  static const POWER_DATA_ACCESSOR ACCESS_INDIVIDUAL_SETTING = 18;
  static const POWER_DATA_ACCESSOR ACCESS_ACTIVE_SCHEME = 19;
  static const POWER_DATA_ACCESSOR ACCESS_CREATE_SCHEME = 20;
  typedef UINT POWER_ACTION; //Alias
  static const POWER_ACTION PowerActionNone = 0;
  static const POWER_ACTION PowerActionReserved = 1;
  static const POWER_ACTION PowerActionSleep = 2;
  static const POWER_ACTION PowerActionHibernate = 3;
  static const POWER_ACTION PowerActionShutdown = 4;
  static const POWER_ACTION PowerActionShutdownReset = 5;
  static const POWER_ACTION PowerActionShutdownOff = 6;
  static const POWER_ACTION PowerActionWarmEject = 7;
  typedef UINT SYSTEM_POWER_STATE; //Alias
  static const SYSTEM_POWER_STATE PowerSystemUnspecified = 0;
  static const SYSTEM_POWER_STATE PowerSystemWorking = 1;
  static const SYSTEM_POWER_STATE PowerSystemSleeping1 = 2;
  static const SYSTEM_POWER_STATE PowerSystemSleeping2 = 3;
  static const SYSTEM_POWER_STATE PowerSystemSleeping3 = 4;
  static const SYSTEM_POWER_STATE PowerSystemHibernate = 5;
  static const SYSTEM_POWER_STATE PowerSystemShutdown = 6;
]]
