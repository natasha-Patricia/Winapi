require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  JET_ERR JetAddColumn(                     JET_SESID sesid, JET_TABLEID tableid, JET_PCSTR szColumnName, JET_COLUMNDEF* pcolumndef, void* pvDefault, unsigned long cbDefault, JET_COLUMNID* pcolumnid);
  JET_ERR JetAttachDatabase(                JET_SESID sesid, JET_PCTSTR szFilename, WINAPI_JetOpenDatabaseFlags grbit);
  JET_ERR JetAttachDatabase2(               JET_SESID sesid, JET_PCTSTR szFilename, unsigned long cpgDatabaseSizeMax, WINAPI_JetOpenDatabaseFlags grbit);
  JET_ERR JetBackup(                        JET_PCSTR szBackupPath, WINAPI_JetBackupFlags grbit, JET_PFNSTATUS pfnStatus);
  JET_ERR JetBackupInstance(                JET_INSTANCE instance, JET_PCSTR szBackupPath, WINAPI_JetBackupFlags grbit, JET_PFNSTATUS pfnStatus);
  JET_ERR JetBeginExternalBackup(           WINAPI_JetBackupFlags grbit);
  JET_ERR JetBeginExternalBackupInstance(   JET_INSTANCE instance, WINAPI_JetBackupFlags grbit);
  JET_ERR JetBeginSession(                  JET_INSTANCE instance, JET_SESID* psesid, JET_PCSTR szUserName, JET_PCSTR szPassword);
  JET_ERR JetBeginTransaction(              JET_SESID sesid);
  JET_ERR JetBeginTransaction2(             JET_SESID sesid, WINAPI_JetBeginTransaction2Flags grbit);
  JET_ERR JetCloseDatabase(                 JET_SESID sesid, JET_DBID dbid, JET_GRBIT grbit);
  JET_ERR JetCloseFile(                     JET_HANDLE hfFile);
  JET_ERR JetCloseFileInstance(             JET_INSTANCE instance, JET_HANDLE hfFile);
  JET_ERR JetCloseTable(                    JET_SESID sesid, JET_TABLEID tableid);
  JET_ERR JetCommitTransaction(             JET_SESID sesid, WINAPI_JetCommitTransactionFlags grbit);
  JET_ERR JetCompact(                       JET_SESID sesid, JET_PCSTR szDatabaseSrc, JET_PCSTR szDatabaseDest, JET_PFNSTATUS pfnStatus, JET_CONVERT* pconvert, WINAPI_JetCompactFlags grbit);
  JET_ERR JetComputeStats(                  JET_SESID sesid, JET_TABLEID tableid);
  JET_ERR JetCreateDatabase(                JET_SESID sesid, JET_PCSTR szFilename, JET_PCSTR szConnect, JET_DBID* pdbid, WINAPI_JetCreateDatabaseFlags grbit);
  JET_ERR JetCreateDatabase2(               JET_SESID sesid, JET_PCTSTR szFilename, unsigned long cpgDatabaseSizeMax, JET_DBID* pdbid, WINAPI_JetCreateDatabaseFlags grbit);
  JET_ERR JetCreateIndex(                   JET_SESID sesid, JET_TABLEID tableid, JET_PCSTR szIndexName, WINAPI_JetCreateIndexFlags grbit, JET_PCTSTR szKey, unsigned long cbKey, unsigned long lDensity);
  JET_ERR JetCreateIndex2(                  JET_SESID sesid, JET_TABLEID tableid, JET_INDEXCREATE* pindexcreate, unsigned long cIndexCreate);
  JET_ERR JetCreateInstance(                JET_INSTANCE* pinstance, JET_PCTSTR szInstanceName);
  JET_ERR JetCreateInstance2(               JET_INSTANCE* pinstance, JET_PCTSTR szInstanceName, JET_PCTSTR szDisplayName, JET_GRBIT grbit);
  JET_ERR JetCreateTable(                   JET_SESID sesid, JET_DBID dbid, JET_PCTSTR szTableName, unsigned long lPages, unsigned long lDensity, JET_TABLEID* ptableid);
  JET_ERR JetCreateTableColumnIndex(        JET_SESID sesid, JET_DBID dbid, JET_TABLECREATE* ptablecreate);
  JET_ERR JetCreateTableColumnIndex2(       JET_SESID sesid, JET_DBID dbid, JET_TABLECREATE2* ptablecreate);
  JET_ERR JetDefragment(                    JET_SESID sesid, JET_DBID dbid, JET_PCSTR szTableName, unsigned long* pcPasses, unsigned long* pcSeconds, WINAPI_JetDefragmentFlags grbit);
  JET_ERR JetDefragment2(                   JET_SESID sesid, JET_DBID dbid, JET_PCSTR szTableName, unsigned long* pcPasses, unsigned long* pcSeconds, JET_CALLBACK callback, WINAPI_JetDefragmentFlags grbit);
  JET_ERR JetDelete(                        JET_SESID sesid, JET_TABLEID tableid);
  JET_ERR JetDeleteColumn(                  JET_SESID sesid, JET_TABLEID tableid, JET_PCTSTR szColumnName);
  JET_ERR JetDeleteColumn2(                 JET_SESID sesid, JET_TABLEID tableid, JET_PCTSTR szColumnName, JET_GRBIT grbit);
  JET_ERR JetDeleteIndex(                   JET_SESID sesid, JET_TABLEID tableid, JET_PCSTR szIndexName);
  JET_ERR JetDeleteTable(                   JET_SESID sesid, JET_DBID dbid, JET_PCTSTR szTableName);
  JET_ERR JetDetachDatabase(                JET_SESID sesid, JET_PCTSTR szFilename);
  JET_ERR JetDetachDatabase2(               JET_SESID sesid, JET_PCTSTR szFilename, WINAPI_JetDetachDatabase2Flags grbit);
  JET_ERR JetDupCursor(                     JET_SESID sesid, JET_TABLEID tableid, JET_TABLEID* ptableid, JET_GRBIT grbit);
  JET_ERR JetDupSession(                    JET_SESID sesid, JET_SESID* psesid);
  JET_ERR JetEnableMultiInstance(           JET_SETSYSPARAM* psetsysparam, unsigned long csetsysparam, unsigned long* pcsetsucceed);
  JET_ERR JetEndExternalBackup(             );
  JET_ERR JetEndExternalBackupInstance(     JET_INSTANCE instance);
  JET_ERR JetEndExternalBackupInstance2(    JET_INSTANCE instance, WINAPI_JetEndExternalBackupInstance2Flags grbit);
  JET_ERR JetEndSession(                    JET_SESID sesid, JET_GRBIT grbit);
  JET_ERR JetEnumerateColumns(              JET_SESID sesid, JET_TABLEID tableid, unsigned long cEnumColumnId, JET_ENUMCOLUMNID* rgEnumColumnId, unsigned long* pcEnumColumn, JET_ENUMCOLUMN** prgEnumColumn, JET_PFNREALLOC pfnRealloc, void* pvReallocContext, unsigned long cbDataMost, WINAPI_JetEnumerateColumnsFlags grbit);
  JET_ERR JetEscrowUpdate(                  JET_SESID sesid, JET_TABLEID tableid, JET_COLUMNID columnid, void* pv, unsigned long cbMax, void* pvOld, unsigned long cbOldMax, unsigned long* pcbOldActual, WINAPI_JetEscrowUpdateFlags grbit);
  JET_ERR JetExternalRestore(               JET_PSTR szCheckpointFilePath, JET_PSTR szLogPath, JET_RSTMAP* rgrstmap, long crstfilemap, JET_PSTR szBackupLogPath, long genLow, long genHigh, JET_PFNSTATUS pfn);
  JET_ERR JetExternalRestore2(              JET_PSTR szCheckpointFilePath, JET_PSTR szLogPath, JET_RSTMAP* rgrstmap, long crstfilemap, JET_PSTR szBackupLogPath, JET_LOGINFO* pLogInfo, JET_PSTR szTargetInstanceName, JET_PSTR szTargetInstanceLogPath, JET_PSTR szTargetInstanceCheckpointPath, JET_PFNSTATUS pfn);
  JET_ERR JetFreeBuffer(                    char* pbBuf);
  JET_ERR JetGetAttachInfo(                 tchar* szz, unsigned long cbMax, unsigned long* pcbActual);
  JET_ERR JetGetAttachInfoInstance(         JET_INSTANCE instance, tchar* szz, unsigned long cbMax, unsigned long* pcbActual);
  JET_ERR JetGetBookmark(                   JET_SESID sesid, JET_TABLEID tableid, void* pvBookmark, unsigned long cbMax, unsigned long* pcbActual);
  JET_ERR JetGetColumnInfo(                 JET_SESID sesid, JET_DBID dbid, JET_PCTSTR szTableName, JET_PCTSTR szColumnName, void* pvResult, unsigned long cbMax, unsigned long InfoLevel);
  JET_ERR JetGetCurrentIndex(               JET_SESID sesid, JET_TABLEID tableid, JET_PSTR szIndexName, unsigned long cchIndexName);
  JET_ERR JetGetCursorInfo(                 JET_SESID sesid, JET_TABLEID tableid, void* pvResult, unsigned long cbMax, unsigned long InfoLevel);
  JET_ERR JetGetDatabaseFileInfo(           JET_PCTSTR szDatabaseName, void* pvResult, unsigned long cbMax, unsigned long InfoLevel);
  JET_ERR JetGetDatabaseInfo(               JET_SESID sesid, JET_DBID dbid, void* pvResult, unsigned long cbMax, unsigned long InfoLevel);
  JET_ERR JetGetIndexInfo(                  JET_SESID sesid, JET_DBID dbid, JET_PCTSTR szTableName, JET_PCTSTR szIndexName, void* pvResult, unsigned long cbResult, unsigned long InfoLevel);
  JET_ERR JetGetInstanceInfo(               unsigned long* pcInstanceInfo, JET_INSTANCE_INFO** paInstanceInfo);
  JET_ERR JetGetInstanceMiscInfo(           JET_INSTANCE instance, void* pvResult, unsigned long cbMax, unsigned long InfoLevel);
  JET_ERR JetGetLock(                       JET_SESID sesid, JET_TABLEID tableid, WINAPI_JetGetLockFlags grbit);
  JET_ERR JetGetLogInfo(                    tchar* szz, unsigned long cbMax, unsigned long* pcbActual);
  JET_ERR JetGetLogInfoInstance(            JET_INSTANCE instance, tchar* szz, unsigned long cbMax, unsigned long* pcbActual);
  JET_ERR JetGetLogInfoInstance2(           JET_INSTANCE instance, tchar* szz, unsigned long cbMax, unsigned long* pcbActual, JET_LOGINFO* pLogInfo);
  JET_ERR JetGetLS(                         JET_SESID sesid, JET_TABLEID tableid, JET_LS* pls, WINAPI_JetGetLSFlags grbit);
  JET_ERR JetGetObjectInfo(                 JET_SESID sesid, JET_DBID dbid, JET_OBJTYP objtyp, JET_PCTSTR szContainerName, JET_PCTSTR szObjectName, void* pvResult, unsigned long cbMax, unsigned long InfoLevel);
  JET_ERR JetGetRecordPosition(             JET_SESID sesid, JET_TABLEID tableid, JET_RECPOS* precpos, unsigned long cbRecpos);
  JET_ERR JetGetRecordSize(                 JET_SESID sesid, JET_TABLEID tableid, JET_RECSIZE* precsize, JET_GRBIT grbit);
  JET_ERR JetGetSecondaryIndexBookmark(     JET_SESID sesid, JET_TABLEID tableid, void* pvSecondaryKey, unsigned long cbSecondaryKeyMax, unsigned long* pcbSecondaryKeyActual, void* pvPrimaryBookmark, unsigned long cbPrimaryBookmarkMax, unsigned long* pcbPrimaryKeyActual, JET_GRBIT grbit);
  JET_ERR JetGetSystemParameter(            JET_INSTANCE instance, JET_SESID sesid, unsigned long paramid, JET_API_PTR* plParam, JET_PSTR szParam, unsigned long cbMax);
  JET_ERR JetGetTableColumnInfo(            JET_SESID sesid, JET_TABLEID tableid, JET_PCTSTR szColumnName, void* pvResult, unsigned long cbMax, unsigned long InfoLevel);
  JET_ERR JetGetTableIndexInfo(             JET_SESID sesid, JET_TABLEID tableid, JET_PCTSTR szIndexName, void* pvResult, unsigned long cbResult, unsigned long InfoLevel);
  JET_ERR JetGetTableInfo(                  JET_SESID sesid, JET_TABLEID tableid, void* pvResult, unsigned long cbMax, unsigned long InfoLevel);
  JET_ERR JetGetThreadStats(                void* pvResult, unsigned long cbMax);
  JET_ERR JetGetTruncateLogInfoInstance(    JET_INSTANCE instance, tchar* szz, unsigned long cbMax, unsigned long* pcbActual);
  JET_ERR JetGetVersion(                    JET_SESID sesid, unsigned long* pwVersion);
  JET_ERR JetGotoBookmark(                  JET_SESID sesid, JET_TABLEID tableid, void* pvBookmark, unsigned long cbBookmark);
  JET_ERR JetGotoPosition(                  JET_SESID sesid, JET_TABLEID tableid, JET_RECPOS* precpos);
  JET_ERR JetGotoSecondaryIndexBookmark(    JET_SESID sesid, JET_TABLEID tableid, void* pvSecondaryKey, unsigned long cbSecondaryKey, void* pvPrimaryBookmark, unsigned long cbPrimaryBookmark, WINAPI_JetGotoSecondaryIndexBookmarkFlags grbit);
  JET_ERR JetGrowDatabase(                  JET_SESID sesid, JET_DBID dbid, unsigned long cpg, unsigned long* pcpgReal);
  JET_ERR JetIdle(                          JET_SESID sesid, WINAPI_JetIdleFlags grbit);
  JET_ERR JetIndexRecordCount(              JET_SESID sesid, JET_TABLEID tableid, unsigned long* pcrec, unsigned long crecMax);
  JET_ERR JetInit(                          JET_INSTANCE* pinstance);
  JET_ERR JetInit2(                         JET_INSTANCE* pinstance, WINAPI_JetInitFlags grbit);
  JET_ERR JetInit3(                         JET_INSTANCE* pinstance, JET_RSTINFO* prstInfo, WINAPI_JetInitFlags grbit);
  JET_ERR JetIntersectIndexes(              JET_SESID sesid, JET_INDEXRANGE* rgindexrange, unsigned long cindexrange, JET_RECORDLIST* precordlist, JET_GRBIT grbit);
  JET_ERR JetMakeKey(                       JET_SESID sesid, JET_TABLEID tableid, void* pvData, unsigned long cbData, WINAPI_JetMakeKeyFlags grbit);
  JET_ERR JetMove(                          JET_SESID sesid, JET_TABLEID tableid, WINAPI_JetMoveRow cRow, WINAPI_JetMoveFlags grbit);
  JET_ERR JetOpenDatabase(                  JET_SESID sesid, JET_PCTSTR szFilename, JET_PCTSTR szConnect, JET_DBID* pdbid, WINAPI_JetOpenDatabaseFlags grbit);
  JET_ERR JetOpenFile(                      JET_PCTSTR szFileName, JET_HANDLE* phfFile, unsigned long* pulFileSizeLow, unsigned long* pulFileSizeHigh);
  JET_ERR JetOpenFileInstance(              JET_INSTANCE instance, JET_PCSTR szFileName, JET_HANDLE* phfFile, unsigned long* pulFileSizeLow, unsigned long* pulFileSizeHigh);
  JET_ERR JetOpenTable(                     JET_SESID sesid, JET_DBID dbid, JET_PCTSTR szTableName, void* pvParameters, unsigned long cbParameters, WINAPI_JetOpenTableFlags grbit, JET_TABLEID* ptableid);
  JET_ERR JetOpenTemporaryTable(            JET_SESID sesid, JET_OPENTEMPORARYTABLE* popentemporarytable);
  JET_ERR JetOpenTempTable(                 JET_SESID sesid, JET_COLUMNDEF* prgcolumndef, unsigned long ccolumn, WINAPI_JetOpenTempTableFlags grbit, JET_TABLEID* ptableid, JET_COLUMNID* prgcolumnid);
  JET_ERR JetOpenTempTable2(                JET_SESID sesid, JET_COLUMNDEF* prgcolumndef, unsigned long ccolumn, unsigned long lcid, WINAPI_JetOpenTempTableFlags grbit, JET_TABLEID* ptableid, JET_COLUMNID* prgcolumnid);
  JET_ERR JetOpenTempTable3(                JET_SESID sesid, JET_COLUMNDEF* prgcolumndef, unsigned long ccolumn, JET_UNICODEINDEX* pidxunicode, WINAPI_JetOpenTempTableFlags grbit, JET_TABLEID* ptableid, JET_COLUMNID* prgcolumnid);
  JET_ERR JetOSSnapshotAbort(               JET_OSSNAPID snapId, JET_GRBIT grbit);
  JET_ERR JetOSSnapshotEnd(                 JET_OSSNAPID snapId, JET_GRBIT grbit);
  JET_ERR JetOSSnapshotFreeze(              JET_OSSNAPID snapId, unsigned long* pcInstanceInfo, JET_INSTANCE_INFO** paInstanceInfo, JET_GRBIT grbit);
  JET_ERR JetOSSnapshotGetFreezeInfo(       JET_OSSNAPID snapId, unsigned long* pcInstanceInfo, JET_INSTANCE_INFO** paInstanceInfo, JET_GRBIT grbit);
  JET_ERR JetOSSnapshotPrepare(             JET_OSSNAPID* psnapId, JET_GRBIT grbit);
  JET_ERR JetOSSnapshotPrepareInstance(     JET_OSSNAPID snapId, JET_INSTANCE instance, JET_GRBIT grbit);
  JET_ERR JetOSSnapshotThaw(                JET_OSSNAPID snapId, JET_GRBIT grbit);
  JET_ERR JetOSSnapshotTruncateLog(         JET_OSSNAPID snapId, JET_GRBIT grbit);
  JET_ERR JetOSSnapshotTruncateLogInstance( JET_OSSNAPID snapId, JET_INSTANCE instance, JET_GRBIT grbit);
  JET_ERR JetPrepareUpdate(                 JET_SESID sesid, JET_TABLEID tableid, WINAPI_JetPrepareUpdateOption prep);
  JET_ERR JetReadFile(                      JET_HANDLE hfFile, void* pv, unsigned long cb, unsigned long* pcbActual);
  JET_ERR JetReadFileInstance(              JET_INSTANCE instance, JET_HANDLE hfFile, void* pv, unsigned long cb, unsigned long* pcb);
  JET_ERR JetRegisterCallback(              JET_SESID sesid, JET_TABLEID tableid, JET_CBTYP cbtyp, JET_CALLBACK pCallback, void* pvContext, JET_HANDLE* phCallbackId);
  JET_ERR JetRenameColumn(                  JET_SESID sesid, JET_TABLEID tableid, JET_PCSTR szName, JET_PCSTR szNameNew, JET_GRBIT grbit);
  JET_ERR JetRenameTable(                   JET_SESID sesid, JET_DBID dbid, JET_PCTSTR szName, JET_PCTSTR szNameNew);
  JET_ERR JetResetSessionContext(           JET_SESID sesid);
  JET_ERR JetResetTableSequential(          JET_SESID sesid, JET_TABLEID tableid, JET_GRBIT grbit);
  JET_ERR JetRestore(                       JET_PCSTR sz, JET_PFNSTATUS pfn);
  JET_ERR JetRestore2(                      JET_PCSTR sz, JET_PCSTR szDest, JET_PFNSTATUS pfn);
  JET_ERR JetRestoreInstance(               JET_INSTANCE instance, JET_PCSTR sz, JET_PCSTR szDest, JET_PFNSTATUS pfn);
  JET_ERR JetRetrieveColumn(                JET_SESID sesid, JET_TABLEID tableid, JET_COLUMNID columnid, void* pvData, unsigned long cbData, unsigned long* pcbActual, WINAPI_JetRetrieveColumnFlags grbit, JET_RETINFO* pretinfo);
  JET_ERR JetRetrieveColumns(               JET_SESID sesid, JET_TABLEID tableid, JET_RETRIEVECOLUMN* pretrievecolumn, unsigned long cretrievecolumn);
  JET_ERR JetRetrieveKey(                   JET_SESID sesid, JET_TABLEID tableid, void* pvData, unsigned long cbMax, unsigned long* pcbActual, JET_GRBIT grbit);
  JET_ERR JetRollback(                      JET_SESID sesid, WINAPI_JetRollbackFlags grbit);
  JET_ERR JetSeek(                          JET_SESID sesid, JET_TABLEID tableid, WINAPI_JetSeekFlags grbit);
  JET_ERR JetSetColumn(                     JET_SESID sesid, JET_TABLEID tableid, JET_COLUMNID columnid, void* pvData, unsigned long cbData, WINAPI_JetSetColumnFlags grbit, JET_SETINFO* psetinfo);
  JET_ERR JetSetColumnDefaultValue(         JET_SESID sesid, JET_DBID dbid, JET_PCSTR szTableName, JET_PCSTR szColumnName, void* pvData, unsigned long cbData, JET_GRBIT grbit);
  JET_ERR JetSetColumns(                    JET_SESID sesid, JET_TABLEID tableid, JET_SETCOLUMN* psetcolumn, unsigned long csetcolumn);
  JET_ERR JetSetCurrentIndex(               JET_SESID sesid, JET_TABLEID tableid, JET_PCTSTR szIndexName);
  JET_ERR JetSetCurrentIndex2(              JET_SESID sesid, JET_TABLEID tableid, JET_PCSTR szIndexName, WINAPI_JetSetCurrentIndexFlags grbit);
  JET_ERR JetSetCurrentIndex3(              JET_SESID sesid, JET_TABLEID tableid, JET_PCSTR szIndexName, WINAPI_JetSetCurrentIndexFlags grbit, unsigned long itagSequence);
  JET_ERR JetSetCurrentIndex4(              JET_SESID sesid, JET_TABLEID tableid, JET_PCSTR szIndexName, JET_INDEXID* pindexid, WINAPI_JetSetCurrentIndexFlags grbit, unsigned long itagSequence);
  JET_ERR JetSetDatabaseSize(               JET_SESID sesid, JET_PCSTR szDatabaseName, unsigned long cpg, unsigned long* pcpgReal);
  JET_ERR JetSetIndexRange(                 JET_SESID sesid, JET_TABLEID tableidSrc, WINAPI_JetSetIndexRangeFlags grbit);
  JET_ERR JetSetLS(                         JET_SESID sesid, JET_TABLEID tableid, JET_LS ls, JET_GRBIT grbit);
  JET_ERR JetSetSessionContext(             JET_SESID sesid, JET_API_PTR ulContext);
  JET_ERR JetSetSystemParameter(            JET_INSTANCE* pinstance, JET_SESID sesid, unsigned long paramid, JET_API_PTR lParam, JET_PCSTR szParam);
  JET_ERR JetSetTableSequential(            JET_SESID sesid, JET_TABLEID tableid, JET_GRBIT grbit);
  JET_ERR JetStopBackup(                    );
  JET_ERR JetStopBackupInstance(            JET_INSTANCE instance);
  JET_ERR JetStopService(                   );
  JET_ERR JetStopServiceInstance(           JET_INSTANCE instance);
  JET_ERR JetTerm(                          JET_INSTANCE instance);
  JET_ERR JetTerm2(                         JET_INSTANCE instance, WINAPI_JetTerm2Flags grbit);
  JET_ERR JetTruncateLog(                   );
  JET_ERR JetTruncateLogInstance(           JET_INSTANCE instance);
  JET_ERR JetUnregisterCallback(            JET_SESID sesid, JET_TABLEID tableid, JET_CBTYP cbtyp, JET_HANDLE hCallbackId);
  JET_ERR JetUpdate(                        JET_SESID sesid, JET_TABLEID tableid, void* pvBookmark, unsigned long cbBookmark, unsigned long* pcbActual);
  JET_ERR JetUpdate2(                       JET_SESID sesid, JET_TABLEID tableid, void* pvBookmark, unsigned long cbBookmark, unsigned long* pcbActual, WINAPI_JetUpdateFlags grbit);
]]
return ffi.load( "esent.dll" )
