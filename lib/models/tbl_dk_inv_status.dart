// ignore_for_file: non_constant_identifier_names

class TblDkInvStatus {
  final int InvStatId;
  final String InvStatGuid;
  final String InvStatTmName;
  final String InvStatTmDesc;
  final String InvStatRuName;
  final String InvStatRuDesc;
  final String InvStatEnName;
  final String InvStatEnDesc;
  final DateTime? CreatedDate;
  final DateTime? ModifiedDate;
  final int CreatedUId;
  final int ModifiedUId;
  final DateTime? SyncDateTime;
  final int? GCRecord;

  TblDkInvStatus({
    required this.InvStatId,
    required this.InvStatGuid,
    required this.InvStatTmName,
    required this.InvStatTmDesc,
    required this.InvStatRuName,
    required this.InvStatRuDesc,
    required this.InvStatEnName,
    required this.InvStatEnDesc,
    required this.CreatedDate,
    required this.ModifiedDate,
    required this.CreatedUId,
    required this.ModifiedUId,
    required this.SyncDateTime,
    required this.GCRecord});

  TblDkInvStatus.fromJson(Map<String, dynamic> json)
  : InvStatId = json['InvStatId'] ?? 0,
    InvStatGuid = json['InvStatGuid'] ?? '',
    InvStatTmName = json['InvStatName_tkTM'] ?? '',
    InvStatTmDesc = json['InvStatDesc_tkTM'] ?? '',
    InvStatRuName = json['InvStatName_ruRU'] ?? '',
    InvStatRuDesc = json['InvStatDesc_ruRU'] ?? '',
    InvStatEnName = json['InvStatName_enUS'] ?? '',
    InvStatEnDesc = json['InvStatDesc_enUS'] ?? '',
    CreatedDate = (json["CreatedDate"] != null) ? DateTime.parse(json["CreatedDate"]) : null,
    ModifiedDate = (json["ModifiedDate"] != null) ? DateTime.parse(json["ModifiedDate"]) : null,
    CreatedUId = json["CreatedUId"] ?? 0,
    ModifiedUId = json["ModifiedUId"] ?? 0,
    SyncDateTime = (json["SyncDateTime"] != null) ? DateTime.parse(json["SyncDateTime"]) : null,
    GCRecord = json["GCRecord"] ?? 0;

  Map<String, dynamic> toJson() => {
    "InvStatId": InvStatId,
    "InvStatGuid": InvStatGuid,
    "InvStatName_tkTM": InvStatTmName,
    "InvStatDesc_tkTM": InvStatTmDesc,
    "InvStatName_ruRU": InvStatRuName,
    "InvStatDesc_ruRU": InvStatRuDesc,
    "InvStatName_enUS": InvStatEnName,
    "InvStatDesc_enUS": InvStatEnDesc,
    "CreatedDate": (CreatedDate != null) ? CreatedDate?.toIso8601String() : "",
    "ModifiedDate": (ModifiedDate != null) ? ModifiedDate?.toIso8601String() : "",
    "CreatedUId": CreatedUId,
    "ModifiedUId": ModifiedUId,
    "SyncDateTime": (SyncDateTime != null) ? SyncDateTime?.toIso8601String() : "",
    "GCRecord": GCRecord,
  };
}