// ignore_for_file: non_constant_identifier_names

class RespDkResPrice{
  final DateTime? CreatedDate;
  final int CreatedUId;
  final int CurrencyId;
  final int? GCRecord;
  final DateTime? ModifiedDate;
  final int ModifiedUId;
  final DateTime? PriceEndDate;
  final DateTime? PriceStartDate;
  final String ResGuid;
  final int ResId;
  final int ResPriceGroupId;
  final int ResPriceId;
  final String ResPriceRegNo;
  final int ResPriceTypeId;
  final double ResPriceValue;
  final String ResRegNo;
  final DateTime? SyncDateTime;
  final int ResUnitId;

  RespDkResPrice({
    required this.CreatedDate,
    required this.CreatedUId,
    required this.CurrencyId,
    required this.GCRecord,
    required this.ModifiedDate,
    required this.ModifiedUId,
    required this.PriceEndDate,
    required this.PriceStartDate,
    required this.ResGuid,
    required this.ResId,
    required this.ResPriceGroupId,
    required this.ResPriceId,
    required this.ResPriceRegNo,
    required this.ResPriceTypeId,
    required this.ResPriceValue,
    required this.ResRegNo,
    required this.SyncDateTime,
    required this.ResUnitId,
  });

  Map<String,dynamic> toJson()=>
  {
    "CreatedDate":(CreatedDate!=null) ? CreatedDate?.toIso8601String() : "",
    "CreatedUId":CreatedUId,
    "CurrencyId":CurrencyId,
    "GCRecord":GCRecord,
    "ModifiedDate":(ModifiedDate!=null) ? ModifiedDate?.toIso8601String() : "",
    "ModifiedUId":ModifiedUId,
    "PriceEndDate":(PriceEndDate!=null) ? PriceEndDate?.toIso8601String() : "",
    "PriceStartDate":(PriceStartDate!=null) ? PriceStartDate?.toIso8601String() : "",
    "ResGuid":ResGuid,
    "ResId":ResId,
    "ResPriceGroupId":ResPriceGroupId,
    "ResPriceId":ResPriceId,
    "ResPriceRegNo":ResPriceRegNo,
    "ResPriceTypeId":ResPriceTypeId,
    "ResPriceValue":ResPriceValue,
    "ResRegNo":ResRegNo,
    "SyncDateTime":(SyncDateTime!=null) ? SyncDateTime?.toIso8601String() : "",
    "UnitId":ResUnitId,
  };

  RespDkResPrice.fromJson(Map<String,dynamic> json)
  : CreatedDate=(json["CreatedDate"]!=null) ? DateTime.parse(json["CreatedDate"]) : null,
    CreatedUId=json["CreatedUId"] ?? 0,
    CurrencyId=json["CurrencyId"] ?? 0,
    GCRecord=json["GCRecord"],
    ModifiedDate=(json["ModifiedDate"]!=null) ? DateTime.parse(json["ModifiedDate"]) : null,
    ModifiedUId=json["ModifiedUId"] ?? 0,
    PriceEndDate=(json["PriceEndDate"]!=null) ? DateTime.parse(json["PriceEndDate"]) : null,
    PriceStartDate=(json["PriceStartDate"]!=null) ? DateTime.parse(json["PriceStartDate"]) : null,
    ResGuid=json["ResGuid"] ?? "",
    ResId=json["ResId"] ?? 0,
    ResPriceGroupId=json["ResPriceGroupId"] ?? 0,
    ResPriceId=json["ResPriceId"] ?? 0,
    ResPriceRegNo=json["ResPriceRegNo"] ?? "",
    ResPriceTypeId=json["ResPriceTypeId"] ?? 0,
    ResPriceValue=json["ResPriceValue"] ?? 0,
    ResRegNo=json["ResRegNo"] ?? "",
    SyncDateTime=(json["SyncDateTime"]!=null) ? DateTime.parse(json["SyncDateTime"]) : null,
    ResUnitId=json["UnitId"] ?? 0;
}