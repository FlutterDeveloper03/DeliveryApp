// ignore_for_file: non_constant_identifier_names

class RespDkWarehouse{
  final String AddInf1;
  final String AddInf2;
  final String AddInf3;
  final String AddInf4;
  final String AddInf5;
  final String AddInf6;
  final int CId;
  final DateTime? CreatedDate;
  final int CreatedUId;
  final String DivGuid;
  final int DivId;
  final int? GCRecord;
  final DateTime? ModifiedDate;
  final int ModifiedUId;
  final DateTime? SyncDateTime;
  final int UsageStatusId;
  final String WhDesc;
  final String WhGuid;
  final int WhId;
  final String WhName;

  RespDkWarehouse({
    required this.AddInf1,
    required this.AddInf2,
    required this.AddInf3,
    required this.AddInf4,
    required this.AddInf5,
    required this.AddInf6,
    required this.CId,
    required this.CreatedDate,
    required this.CreatedUId,
    required this.DivGuid,
    required this.DivId,
    required this.GCRecord,
    required this.ModifiedDate,
    required this.ModifiedUId,
    required this.SyncDateTime,
    required this.UsageStatusId,
    required this.WhDesc,
    required this.WhGuid,
    required this.WhId,
    required this.WhName,
  });

  Map<String,dynamic> toJson()=>{
    "AddInf1":AddInf1,
    "AddInf2":AddInf2,
    "AddInf3":AddInf3,
    "AddInf4":AddInf4,
    "AddInf5":AddInf5,
    "AddInf6":AddInf6,
    "CId":CId,
    "CreatedDate":(CreatedDate!=null) ? CreatedDate?.toIso8601String() :"",
    "CreatedUId":CreatedUId,
    "DivGuid":DivGuid,
    "DivId":DivId,
    "GCRecord":GCRecord,
    "ModifiedDate":(ModifiedDate!=null) ? ModifiedDate?.toIso8601String() : "",
    "ModifiedUId":ModifiedUId,
    "SyncDateTime":(SyncDateTime!=null) ? SyncDateTime?.toIso8601String() :"",
    "UsageStatusId":UsageStatusId,
    "WhDesc":WhDesc,
    "WhGuid":WhGuid,
    "WhId":WhId,
    "WhName":WhName,
  };

  RespDkWarehouse.fromJson(Map<String,dynamic> json)
    : AddInf1=json["AddInf1"] ?? "",
      AddInf2=json["AddInf2"] ?? "",
      AddInf3=json["AddInf3"] ?? "",
      AddInf4=json["AddInf4"] ?? "",
      AddInf5=json["AddInf5"] ?? "",
      AddInf6=json["AddInf6"] ?? "",
      CId=json["CId"] ?? 0,
      CreatedDate=(json["CreatedDate"]!=null) ? DateTime.parse(json["CreatedDate"]) : null,
      CreatedUId=json["CreatedUId"] ?? 0,
      DivGuid=json["DivGuid"] ?? "",
      DivId=json["DivId"] ?? 0,
      GCRecord=json["GCRecord"],
      ModifiedDate=(json["ModifiedDate"]!=null) ? DateTime.parse(json["ModifiedDate"]) : null,
      ModifiedUId=json["ModifiedUId"] ?? 0,
      SyncDateTime=(json["SyncDateTime"]!=null) ? DateTime.parse(json["SyncDateTime"]) : null,
      UsageStatusId=json["UsageStatusId"] ?? 0,
      WhDesc=json["WhDesc"] ?? "",
      WhGuid=json["WhGuid"] ?? "",
      WhId=json["WhId"] ?? 0,
      WhName=json["WhName"] ?? "";
}
