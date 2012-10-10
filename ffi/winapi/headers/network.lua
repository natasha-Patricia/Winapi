require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef UNICODE_STRING LSA_UNICODE_STRING; //Alias
  typedef LSA_UNICODE_STRING *PLSA_UNICODE_STRING; //Pointer
  typedef struct LSA_FOREST_TRUST_DOMAIN_INFO {
    PSID Sid;
    LSA_UNICODE_STRING DnsName;
    LSA_UNICODE_STRING NetbiosName;
  } LSA_FOREST_TRUST_DOMAIN_INFO;
  typedef struct LSA_FOREST_TRUST_BINARY_DATA {
    ULONG Length;
    PUCHAR Buffer;
  } LSA_FOREST_TRUST_BINARY_DATA;
  typedef union LSA_FOREST_TRUST_RECORD_u {
    LSA_UNICODE_STRING TopLevelName;
    LSA_FOREST_TRUST_DOMAIN_INFO DomainInfo;
    LSA_FOREST_TRUST_BINARY_DATA Data;
  } LSA_FOREST_TRUST_RECORD_u;
  typedef UINT LSA_FOREST_TRUST_RECORD_TYPE; //Alias
  static const LSA_FOREST_TRUST_RECORD_TYPE ForestTrustTopLevelName = 0;
  static const LSA_FOREST_TRUST_RECORD_TYPE ForestTrustTopLevelNameEx = 1;
  static const LSA_FOREST_TRUST_RECORD_TYPE ForestTrustDomainInfo = 2;
  typedef struct LSA_FOREST_TRUST_RECORD {
    ULONG Flags;
    LSA_FOREST_TRUST_RECORD_TYPE ForestTrustType;
    LARGE_INTEGER Time;
    LSA_FOREST_TRUST_RECORD_u ForestTrustData;
  } LSA_FOREST_TRUST_RECORD;
  typedef LSA_FOREST_TRUST_RECORD *PLSA_FOREST_TRUST_RECORD; //Pointer
  typedef struct LSA_FOREST_TRUST_INFORMATION {
    ULONG RecordCount;
    PLSA_FOREST_TRUST_RECORD* Entries;
  } LSA_FOREST_TRUST_INFORMATION;
  typedef LSA_FOREST_TRUST_INFORMATION *PLSA_FOREST_TRUST_INFORMATION; //Pointer
  typedef UINT LSA_FOREST_TRUST_COLLISION_RECORD_TYPE; //Alias
  static const LSA_FOREST_TRUST_COLLISION_RECORD_TYPE CollisionTdo = 0;
  static const LSA_FOREST_TRUST_COLLISION_RECORD_TYPE CollisionXref = 1;
  static const LSA_FOREST_TRUST_COLLISION_RECORD_TYPE CollisionOther = 2;
  typedef struct LSA_FOREST_TRUST_COLLISION_RECORD {
    ULONG Index;
    LSA_FOREST_TRUST_COLLISION_RECORD_TYPE Type;
    ULONG Flags;
    LSA_UNICODE_STRING Name;
  } LSA_FOREST_TRUST_COLLISION_RECORD;
  typedef LSA_FOREST_TRUST_COLLISION_RECORD *PLSA_FOREST_TRUST_COLLISION_RECORD; //Pointer
  typedef struct LSA_TRUST_INFORMATION {
    LSA_UNICODE_STRING Name;
    PSID Sid;
  } LSA_TRUST_INFORMATION;
  typedef LSA_TRUST_INFORMATION *PLSA_TRUST_INFORMATION; //Pointer
  typedef struct LSA_REFERENCED_DOMAIN_LIST {
    ULONG Entries;
    PLSA_TRUST_INFORMATION Domains;
  } LSA_REFERENCED_DOMAIN_LIST;
  typedef LSA_REFERENCED_DOMAIN_LIST *PLSA_REFERENCED_DOMAIN_LIST; //Pointer
  typedef struct LSA_FOREST_TRUST_COLLISION_INFORMATION {
    ULONG RecordCount;
    PLSA_FOREST_TRUST_COLLISION_RECORD* Entries;
  } LSA_FOREST_TRUST_COLLISION_INFORMATION;
  typedef LSA_FOREST_TRUST_COLLISION_INFORMATION *PLSA_FOREST_TRUST_COLLISION_INFORMATION; //Pointer
]]
