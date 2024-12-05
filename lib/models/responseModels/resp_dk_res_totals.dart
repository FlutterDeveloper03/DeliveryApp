// ignore_for_file: non_constant_identifier_names

class RespDkResTotals {
  final int CId;
  final DateTime? CreatedDate;
  final int CreatedUId;
  final int CurrencyId;
  final String DivGuid;
  final int DivId;
  final int? GCRecord;
  final DateTime? ModifiedDate;
  final int ModifiedUId;
  final String ResGuid;
  final int ResId;
  final double ResPendingTotalAmount;
  final double ResTotBalance;
  final int ResTotId;
  final double ResTotInAmount;
  final DateTime? ResTotLastTrDate;
  final double ResTotOutAmount;
  final double ResTotPurchAvgPrice;
  final DateTime? SyncDateTime;
  final String WhGuid;
  final int WhId;
  final int WpId;

  RespDkResTotals({
    required this.CId,
    required this.CreatedDate,
    required this.CreatedUId,
    required this.CurrencyId,
    required this.DivGuid,
    required this.DivId,
    required this.GCRecord,
    required this.ModifiedDate,
    required this.ModifiedUId,
    required this.ResGuid,
    required this.ResId,
    required this.ResPendingTotalAmount,
    required this.ResTotBalance,
    required this.ResTotId,
    required this.ResTotInAmount,
    required this.ResTotLastTrDate,
    required this.ResTotOutAmount,
    required this.ResTotPurchAvgPrice,
    required this.SyncDateTime,
    required this.WhGuid,
    required this.WhId,
    required this.WpId,
  });

  Map<String,dynamic> toJson()=>{
    "CId":CId,
    "CreatedDate":(CreatedDate!=null) ? CreatedDate?.toIso8601String() : "",
    "CreatedUId":CreatedUId,
    "CurrencyId":CurrencyId,
    "DivGuid":DivGuid,
    "DivId":DivId,
    "GCRecord":GCRecord,
    "ModifiedDate": (ModifiedDate!=null) ? ModifiedDate?.toIso8601String() : "",
    "ModifiedUId":ModifiedUId,
    "ResGuid":ResGuid,
    "ResId":ResId,
    "ResPendingTotalAmount":ResPendingTotalAmount,
    "ResTotBalance":ResTotBalance,
    "ResTotId":ResTotId,
    "ResTotInAmount":ResTotInAmount,
    "ResTotLastTrDate":(ResTotLastTrDate!=null) ? ResTotLastTrDate?.toIso8601String() : "",
    "ResTotOutAmount":ResTotOutAmount,
    "ResTotPurchAvgPrice":ResTotPurchAvgPrice,
    "SyncDateTime":(SyncDateTime!=null) ? SyncDateTime?.toIso8601String() : "",
    "WhGuid":WhGuid,
    "WhId":WhId,
    "WpId":WpId,
  };

  RespDkResTotals.fromJson(Map<String,dynamic> json)
    : CId=json["CId"] ?? 0,
      CreatedDate=(json["CreatedDate"]!=null) ? DateTime.parse(json["CreatedDate"]) : null,
      CreatedUId=json["CreatedUId"] ?? 0,
      CurrencyId=json["CurrencyId"] ?? 0,
      DivGuid=json["DivGuid"] ?? "",
      DivId=json["DivId"] ?? 0,
      GCRecord=json["GCRecord"],
      ModifiedDate=(json["ModifiedDate"]!=null) ? DateTime.parse(json["ModifiedDate"]) : null,
      ModifiedUId=json["ModifiedUId"] ?? 0,
      ResGuid=json["ResGuid"] ?? "",
      ResId=json["ResId"] ?? 0,
      ResPendingTotalAmount=json["ResPendingTotalAmount"] ?? 0,
      ResTotBalance=json["ResTotBalance"] ?? 0,
      ResTotId=json["ResTotId"] ?? 0,
      ResTotInAmount=json["ResTotInAmount"] ?? 0,
      ResTotLastTrDate=(json["ResTotLastTrDate"] != null) ? DateTime.parse(json["ResTotLastTrDate"]) : null,
      ResTotOutAmount=json["ResTotOutAmount"] ?? 0,
      ResTotPurchAvgPrice=json["ResTotPurchAvgPrice"] ?? 0,
      SyncDateTime=(json["SyncDateTime"]!=null) ? DateTime.parse(json["SyncDateTime"]) : null,
      WhGuid=json["WhGuid"] ?? "",
      WhId=json["WhId"] ?? 0,
      WpId=json["WpId"] ?? 0;
}