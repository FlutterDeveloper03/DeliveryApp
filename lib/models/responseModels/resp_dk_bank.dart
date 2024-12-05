// ignore_for_file: non_constant_identifier_names

class RespDkBank{
  final int BankId;
  final int MainContId;
  final int MainLocId;
  final String BankName;
  final String BankDesc;
  final String BankCorAcc;
  final String BankAccBik;
  final String AddInf1;
  final String AddInf2;
  final String AddInf3;
  final String AddInf4;
  final String AddInf5;
  final String AddInf6;
  final DateTime? CreatedDate;
  final DateTime? ModifiedDate;
  final int CreatedUId;
  final int ModifiedUId;
  final DateTime? SyncDateTime;

  RespDkBank({
      required this.BankId,
      required this.MainContId,
      required this.MainLocId,
      required this.BankName,
      required this.BankDesc,
      required this.BankCorAcc,
      required this.BankAccBik,
      required this.AddInf1,
      required this.AddInf2,
      required this.AddInf3,
      required this.AddInf4,
      required this.AddInf5,
      required this.AddInf6,
      required this.CreatedDate,
      required this.ModifiedDate,
      required this.CreatedUId,
      required this.ModifiedUId,
      required this.SyncDateTime});

  RespDkBank.fromJson(Map<String, dynamic> json)
    : BankId = json['BankId'] ?? 0,
      MainContId = json['MainContId'] ?? 0,
      MainLocId = json['MainLocId'] ?? 0,
      BankName = json['BankName'] ?? "",
      BankDesc = json['BankDesc'] ?? "",
      BankCorAcc = json['BankCorAcc'] ?? "",
      BankAccBik = json['BankAccBik'] ?? "",
      AddInf1 = json['AddInf1'] ?? "",
      AddInf2 = json['AddInf2'] ?? "",
      AddInf3 = json['AddInf3'] ?? "",
      AddInf4 = json['AddInf4'] ?? "",
      AddInf5 = json['AddInf5'] ?? "",
      AddInf6 = json['AddInf6'] ?? "",
      CreatedDate = (json['CreatedDate']==null) ? null : DateTime.parse(json['CreatedDate']),
      ModifiedDate = (json['ModifiedDate']==null) ? null : DateTime.parse(json['ModifiedDate']),
      CreatedUId = json['CreatedUId'] ?? 0,
      ModifiedUId = json['ModifiedUId'] ?? 0,
      SyncDateTime = (json['SyncDateTime']==null) ? null : DateTime.parse(json['SyncDateTime']);


  Map<String,dynamic> toJson()=>{
    'BankId':BankId,
    'MainContId':MainContId,
    'MainLocId':MainLocId,
    'BankName':BankName,
    'BankDesc':BankDesc,
    'BankCorAcc':BankCorAcc,
    'BankAccBik':BankAccBik,
    'AddInf1':AddInf1,
    'AddInf2':AddInf2,
    'AddInf3':AddInf3,
    'AddInf4':AddInf4,
    'AddInf5':AddInf5,
    'AddInf6':AddInf6,
    'CreatedDate':CreatedDate?.toIso8601String(),
    'ModifiedDate':ModifiedDate?.toIso8601String(),
    'CreatedUId':CreatedUId,
    'ModifiedUId':ModifiedUId,
    'SyncDateTime':SyncDateTime?.toIso8601String()
  };

}