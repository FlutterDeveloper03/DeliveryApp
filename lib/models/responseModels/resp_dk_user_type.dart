// ignore_for_file: non_constant_identifier_names

class RespDkUserType {
  final int UTypeId;
  final String UTypeGuid;
  final String UTypeTmName;
  final String UTypeTmDesc;
  final String UTypeRuName;
  final String UTypeRuDesc;
  final String UTypeEnName;
  final String UTypeEnDesc;
  final DateTime? CreatedDate;
  final DateTime? ModifiedDate;
  final int? GCRecord;
  final DateTime? SyncDateTime;

  RespDkUserType({
    required this.UTypeId,
    required this.UTypeGuid,
    required this.UTypeTmName,
    required this.UTypeTmDesc,
    required this.UTypeRuName,
    required this.UTypeRuDesc,
    required this.UTypeEnName,
    required this.UTypeEnDesc,
    required this.CreatedDate,
    required this.ModifiedDate,
    required this.GCRecord,
    required this.SyncDateTime});

  RespDkUserType.fromJson(Map<String, dynamic> json)
      : UTypeId = json['UTypeId'] ?? 0,
        UTypeGuid = json['UTypeGuid'] ?? '',
        UTypeTmName = json['UTypeName_tkTM'] ?? '',
        UTypeTmDesc = json['UTypeDesc_tkTM'] ?? '',
        UTypeRuName = json['UTypeName_ruRU'] ?? '',
        UTypeRuDesc = json['UTypeDesc_ruRU'] ?? '',
        UTypeEnName = json['UTypeName_enUS'] ?? '',
        UTypeEnDesc = json['UTypeDesc_enUS'] ?? '',
        CreatedDate=(json['CreatedDate']!=null) ? DateTime.parse(json['CreatedDate']) : null,
        ModifiedDate=(json['ModifiedDate']!=null) ? DateTime.parse(json['ModifiedDate']) : null,
        GCRecord = json['GcRecord'] ?? 0,
        SyncDateTime=(json['SyncDateTime']!=null) ? DateTime.parse(json['SyncDateTime']) : null;

  Map<String, dynamic> toJson() => {
    "UTypeId": UTypeId,
    "UTypeGuid": UTypeGuid,
    "UTypeName_tkTM": UTypeTmName,
    "UTypeDesc_tkTM": UTypeTmDesc,
    "UTypeName_ruRU": UTypeRuName,
    "UTypeDesc_ruRU": UTypeRuDesc,
    "UTypeName_enUS": UTypeEnName,
    "UTypeDesc_enUS": UTypeEnDesc,
    "CreatedDate":(CreatedDate!=null) ? CreatedDate?.toIso8601String() : "",
    "GCRecord":GCRecord,
    "ModifiedDate":(ModifiedDate!=null) ? ModifiedDate?.toIso8601String() : "",
    "SyncDateTime":(SyncDateTime!=null) ? SyncDateTime?.toIso8601String() : "",
  };
}