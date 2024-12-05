// ignore_for_file: non_constant_identifier_names

class TblDkInvTypes {
  final int InvTypeId;
  final String InvTypeGuid;
  final String InvTypeTmName;
  final String InvTypeTmDesc;
  final String InvTypeRuName;
  final String InvTypeRuDesc;
  final String InvTypeEnName;
  final String InvTypeEnDesc;
  final DateTime? CreatedDate;
  final DateTime? ModifiedDate;
  final int CreatedUId;
  final int ModifiedUId;
  final DateTime? SyncDateTime;
  final int? GCRecord;

  TblDkInvTypes({
    required this.InvTypeId,
    required this.InvTypeGuid,
    required this.InvTypeTmName,
    required this.InvTypeTmDesc,
    required this.InvTypeRuName,
    required this.InvTypeRuDesc,
    required this.InvTypeEnName,
    required this.InvTypeEnDesc,
    required this.CreatedDate,
    required this.ModifiedDate,
    required this.CreatedUId,
    required this.ModifiedUId,
    required this.SyncDateTime,
    required this.GCRecord});

  TblDkInvTypes.fromJson(Map<String, dynamic> json)
      : InvTypeId = json['InvTypeId'] ?? 0,
        InvTypeGuid = json['InvTypeGuid'] ?? '',
        InvTypeTmName = json['InvTypeName_tkTM'] ?? '',
        InvTypeTmDesc = json['InvTypeDesc_tkTM'] ?? '',
        InvTypeRuName = json['InvTypeName_ruRU'] ?? '',
        InvTypeRuDesc = json['InvTypeDesc_ruRU'] ?? '',
        InvTypeEnName = json['InvTypeName_enUS'] ?? '',
        InvTypeEnDesc = json['InvTypeDesc_enUS'] ?? '',
        CreatedDate = (json["CreatedDate"] != null) ? DateTime.parse(json["CreatedDate"]) : null,
        ModifiedDate = (json["ModifiedDate"] != null) ? DateTime.parse(json["ModifiedDate"]) : null,
        CreatedUId = json["CreatedUId"] ?? 0,
        ModifiedUId = json["ModifiedUId"] ?? 0,
        SyncDateTime = (json["SyncDateTime"] != null) ? DateTime.parse(json["SyncDateTime"]) : null,
        GCRecord = json["GCRecord"] ?? 0;

  Map<String, dynamic> toJson() => {
    "InvTypeId": InvTypeId,
    "InvTypeGuid": InvTypeGuid,
    "InvTypeName_tkTM": InvTypeTmName,
    "InvTypeDesc_tkTM": InvTypeTmDesc,
    "InvTypeName_ruRU": InvTypeRuName,
    "InvTypeDesc_ruRU": InvTypeRuDesc,
    "InvTypeName_enUS": InvTypeEnName,
    "InvTypeDesc_enUS": InvTypeEnDesc,
    "CreatedDate": (CreatedDate != null) ? CreatedDate?.toIso8601String() : "",
    "ModifiedDate": (ModifiedDate != null) ? ModifiedDate?.toIso8601String() : "",
    "CreatedUId": CreatedUId,
    "ModifiedUId": ModifiedUId,
    "SyncDateTime": (SyncDateTime != null) ? SyncDateTime?.toIso8601String() : "",
    "GCRecord": GCRecord,
  };
}