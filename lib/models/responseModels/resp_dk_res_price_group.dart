// ignore_for_file: non_constant_identifier_names

class RespDkResPriceGroup{
  final DateTime? CreatedDate;
  final int CreatedUId;
  final int FromResPriceTypeId;
  final int? GCRecord;
  final DateTime? ModifiedDate;
  final int ModifiedUId;
  final bool ResPriceGroupAMEnabled;
  final double ResPriceGroupAMPerc;
  final String ResPriceGroupDesc;
  final int ResPriceGroupId;
  final String ResPriceGroupName;
  final int RoundingType;
  final DateTime? SyncDateTime;
  final int ToResPriceTypeId;
  final int UsageStatusId;

  RespDkResPriceGroup({
    required this.CreatedDate,
    required this.CreatedUId,
    required this.FromResPriceTypeId,
    required this.GCRecord,
    required this.ModifiedDate,
    required this.ModifiedUId,
    required this.ResPriceGroupAMEnabled,
    required this.ResPriceGroupAMPerc,
    required this.ResPriceGroupDesc,
    required this.ResPriceGroupId,
    required this.ResPriceGroupName,
    required this.RoundingType,
    required this.SyncDateTime,
    required this.ToResPriceTypeId,
    required this.UsageStatusId,
  });

  Map<String,dynamic> toJson()=>{
    "CreatedDate":(CreatedDate!=null) ? CreatedDate?.toIso8601String() : "",
    "CreatedUId":CreatedUId,
    "FromResPriceTypeId":FromResPriceTypeId,
    "GCRecord":GCRecord,
    "ModifiedDate":(ModifiedDate!=null) ? ModifiedDate?.toIso8601String() : "",
    "ModifiedUId":ModifiedUId,
    "ResPriceGroupAMEnabled":ResPriceGroupAMEnabled,
    "ResPriceGroupAMPerc":ResPriceGroupAMPerc,
    "ResPriceGroupDesc":ResPriceGroupDesc,
    "ResPriceGroupId":ResPriceGroupId,
    "ResPriceGroupName":ResPriceGroupName,
    "RoundingType":RoundingType,
    "SyncDateTime":(SyncDateTime!=null) ? SyncDateTime?.toIso8601String() : "",
    "ToResPriceTypeId":ToResPriceTypeId,
    "UsageStatusId":UsageStatusId,
  };

  RespDkResPriceGroup.fromJson(Map<String,dynamic> json)
  : CreatedDate=(json["CreatedDate"]!=null) ? DateTime.parse(json["CreatedDate"]) : null,
    CreatedUId=json["CreatedUId"] ?? 0,
    FromResPriceTypeId=json["FromResPriceTypeId"] ?? 0,
    GCRecord=json["GCRecord"],
    ModifiedDate=(json["ModifiedDate"]!=null) ? DateTime.parse(json["ModifiedDate"]) : null,
    ModifiedUId=json["ModifiedUId"] ?? 0,
    ResPriceGroupAMEnabled=json["ResPriceGroupAMEnabled"] ?? false,
    ResPriceGroupAMPerc=json["ResPriceGroupAMPerc"] ?? 0,
    ResPriceGroupDesc=json["ResPriceGroupDesc"] ?? "",
    ResPriceGroupId=json["ResPriceGroupId"] ?? 0,
    ResPriceGroupName=json["ResPriceGroupName"] ?? "",
    RoundingType=json["RoundingType"] ?? 0,
    SyncDateTime=(json["SyncDateTime"]!=null) ? DateTime.parse(json["SyncDateTime"]) : null,
    ToResPriceTypeId=json["ToResPriceTypeId"] ?? 0,
    UsageStatusId=json["UsageStatusId"] ?? 0;
}