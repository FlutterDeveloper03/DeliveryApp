// ignore_for_file: non_constant_identifier_names

import 'model.dart';

class TblDkRpAcc extends Model {
  int RpAccId;
  String RpAccGuid;
  int UId;
  int CId;
  int DivId;
  int EmpId;
  int GenderId;
  int RpAccStatusId;
  int WpId;
  int RpAccTypeId;
  int ResPriceGroupId;
  String RpAccRegNo;
  String RpAccName;
  String RpAccAddress;
  String RpAccMobilePhoneNumber;
  String RpAccHomePhoneNumber;
  String RpAccWorkPhoneNumber;
  String RpAccWorkFaxNumber;
  String RpAccZipCode;
  String RpAccEMail;
  double RpAccSaleBalanceLimit;
  double RpAccPurchBalanceLimit;
  double RpAccTrTotBalance;
  String AddInf1;
  String AddInf2;
  String AddInf3;
  String AddInf4;
  String AddInf5;
  String AddInf6;
  String RpAccUName;
  String RpAccUPass;
  DateTime? CreatedDate;
  DateTime? ModifiedDate;
  DateTime? SyncDateTime;

  TblDkRpAcc(
      {required this.RpAccId,
      required this.RpAccGuid,
      required this.UId,
      required this.CId,
      required this.DivId,
      required this.EmpId,
      required this.GenderId,
      required this.RpAccStatusId,
      required this.WpId,
      required this.RpAccTypeId,
      required this.ResPriceGroupId,
      required this.RpAccRegNo,
      required this.RpAccName,
      required this.RpAccAddress,
      required this.RpAccMobilePhoneNumber,
      required this.RpAccHomePhoneNumber,
      required this.RpAccWorkPhoneNumber,
      required this.RpAccWorkFaxNumber,
      required this.RpAccZipCode,
      required this.RpAccEMail,
      required this.RpAccSaleBalanceLimit,
      required this.RpAccPurchBalanceLimit,
      required this.RpAccTrTotBalance,
      required this.AddInf1,
      required this.AddInf2,
      required this.AddInf3,
      required this.AddInf4,
      required this.AddInf5,
      required this.AddInf6,
      required this.RpAccUName,
      required this.RpAccUPass,
      required this.CreatedDate,
      required this.ModifiedDate,
      required this.SyncDateTime});

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'RpAccId': RpAccId,
      'RpAccGuid': RpAccGuid,
      'UId': UId,
      'CId': CId,
      'DivId': DivId,
      'EmpId': EmpId,
      'GenderId': GenderId,
      'RpAccStatusId': RpAccStatusId,
      'WpId': WpId,
      'RpAccTypeId': RpAccTypeId,
      'ResPriceGroupId': ResPriceGroupId,
      'RpAccRegNo': RpAccRegNo,
      'RpAccName': RpAccName,
      'RpAccAddress': RpAccAddress,
      'RpAccMobilePhoneNumber': RpAccMobilePhoneNumber,
      'RpAccHomePhoneNumber': RpAccHomePhoneNumber,
      'RpAccWorkPhoneNumber': RpAccWorkPhoneNumber,
      'RpAccWorkFaxNumber': RpAccWorkFaxNumber,
      'RpAccZipCode': RpAccZipCode,
      'RpAccEMail': RpAccEMail,
      'RpAccSaleBalanceLimit': RpAccSaleBalanceLimit,
      'RpAccPurchBalanceLimit': RpAccPurchBalanceLimit,
      'RpAccTrTotBalance': RpAccTrTotBalance,
      'AddInf1': AddInf1,
      'AddInf2': AddInf2,
      'AddInf3': AddInf3,
      'AddInf4': AddInf4,
      'AddInf5': AddInf5,
      'AddInf6': AddInf6,
      'RpAccUName': RpAccUName,
      'RpAccUPass': RpAccUPass,
      'CreatedDate': (CreatedDate != null) ? CreatedDate?.millisecondsSinceEpoch : null,
      'ModifiedDate': (ModifiedDate != null) ? ModifiedDate?.millisecondsSinceEpoch : null,
      'SyncDateTime': (SyncDateTime != null) ? SyncDateTime?.millisecondsSinceEpoch : null
    };
    return map;
  }

  static TblDkRpAcc fromMap(Map<String, dynamic> map) {
    return TblDkRpAcc(
      RpAccId: map['RpAccId'] ?? 0,
      RpAccGuid: map['RpAccGuid'] ?? "",
      UId: map['UId'] ?? 0,
      CId: map['CId'] ?? 0,
      DivId: map['DivId'] ?? 0,
      EmpId: map['EmpId'] ?? 0,
      GenderId: map['GenderId'] ?? 0,
      RpAccStatusId: map['RpAccStatusId'] ?? 0,
      WpId: map['WpId'] ?? 0,
      RpAccTypeId: map['RpAccTypeId'] ?? 0,
      ResPriceGroupId: map['ResPriceGroupId'] ?? 0,
      RpAccRegNo: map['RpAccRegNo']?.toString() ?? "",
      RpAccName: map['RpAccName']?.toString() ?? "",
      RpAccAddress: map['RpAccAddress']?.toString() ?? "",
      RpAccMobilePhoneNumber: map['RpAccMobilePhoneNumber']?.toString() ?? "",
      RpAccHomePhoneNumber: map['RpAccHomePhoneNumber']?.toString() ?? "",
      RpAccWorkPhoneNumber: map['RpAccWorkPhoneNumber']?.toString() ?? "",
      RpAccWorkFaxNumber: map['RpAccWorkFaxNumber']?.toString() ?? "",
      RpAccZipCode: map['RpAccZipCode']?.toString() ?? "",
      RpAccEMail: map['RpAccEMail']?.toString() ?? "",
      RpAccSaleBalanceLimit: map['RpAccSaleBalanceLimit'] ?? 0,
      RpAccPurchBalanceLimit: map['RpAccPurchBalanceLimit'] ?? 0,
      RpAccTrTotBalance: map['RpAccTrTotBalance'] ?? 0,
      AddInf1: map['AddInf1']?.toString() ?? "",
      AddInf2: map['AddInf2']?.toString() ?? "",
      AddInf3: map['AddInf3']?.toString() ?? "",
      AddInf4: map['AddInf4']?.toString() ?? "",
      AddInf5: map['AddInf5']?.toString() ?? "",
      AddInf6: map['AddInf6']?.toString() ?? "",
      RpAccUName: map['RpAccUName'] ?? "",
      RpAccUPass: map['RpAccUPass'] ?? "",
      CreatedDate: DateTime.fromMillisecondsSinceEpoch(map['CreatedDate'] ?? 1),
      ModifiedDate: DateTime.fromMillisecondsSinceEpoch(map['ModifiedDate'] ?? 1),
      SyncDateTime: (map['SyncDateTime'] != null) ? DateTime.fromMillisecondsSinceEpoch(map['SyncDateTime'] ?? 1) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "RpAccId": RpAccId,
        "RpAccGuid": RpAccGuid,
        "UId": UId,
        "CId": CId,
        "DivId": DivId,
        "EmpId": EmpId,
        "GenderId": GenderId,
        "RpAccStatusId": RpAccStatusId,
        "WpId": WpId,
        "RpAccTypeId": RpAccTypeId,
        "ResPriceGroupId": ResPriceGroupId,
        "RpAccRegNo": RpAccRegNo,
        "RpAccName": RpAccName,
        "RpAccAddress": RpAccAddress,
        "RpAccMobilePhoneNumber": RpAccMobilePhoneNumber,
        "RpAccHomePhoneNumber": RpAccHomePhoneNumber,
        "RpAccWorkPhoneNumber": RpAccWorkPhoneNumber,
        "RpAccWorkFaxNumber": RpAccWorkFaxNumber,
        "RpAccZipCode": RpAccZipCode,
        "RpAccEMail": RpAccEMail,
        "RpAccSaleBalanceLimit": RpAccSaleBalanceLimit,
        "RpAccPurchBalanceLimit": RpAccPurchBalanceLimit,
        "RpAccTrTotBalance": RpAccTrTotBalance,
        "AddInf1": AddInf1,
        "AddInf2": AddInf2,
        "AddInf3": AddInf3,
        "AddInf4": AddInf4,
        "AddInf5": AddInf5,
        "AddInf6": AddInf6,
        "RpAccUName": RpAccUName,
        "RpAccUPass": RpAccUPass,
        "CreatedDate": CreatedDate,
        "ModifiedDate": ModifiedDate,
        "SyncDateTime": SyncDateTime,
      };

  TblDkRpAcc.fromJson(Map<String, dynamic> json)
      : RpAccId = json['RpAccId'],
        RpAccGuid = json['RpAccGuid'],
        UId = json['UId'],
        CId = json['CId'],
        DivId = json['DivId'],
        EmpId = json['EmpId'],
        GenderId = json['GenderId'],
        RpAccStatusId = json['RpAccStatusId'],
        WpId = json['WpId'],
        RpAccTypeId = json['RpAccTypeId'],
        ResPriceGroupId = json['ResPriceGroupId'],
        RpAccRegNo = json['RpAccRegNo'],
        RpAccName = json['RpAccName'],
        RpAccAddress = json['RpAccAddress'],
        RpAccMobilePhoneNumber = json['RpAccMobilePhoneNumber'],
        RpAccHomePhoneNumber = json['RpAccHomePhoneNumber'],
        RpAccWorkPhoneNumber = json['RpAccWorkPhoneNumber'],
        RpAccWorkFaxNumber = json['RpAccWorkFaxNumber'],
        RpAccZipCode = json['RpAccZipCode'],
        RpAccEMail = json['RpAccEMail'],
        RpAccSaleBalanceLimit = json['RpAccSaleBalanceLimit'],
        RpAccPurchBalanceLimit = json['RpAccPurchBalanceLimit'],
        RpAccTrTotBalance = json['RpAccTrTotBalance'],
        AddInf1 = json['AddInf1'],
        AddInf2 = json['AddInf2'],
        AddInf3 = json['AddInf3'],
        AddInf4 = json['AddInf4'],
        AddInf5 = json['AddInf5'],
        AddInf6 = json['AddInf6'],
        RpAccUName = json['RpAccUName'],
        RpAccUPass = json['RpAccUPass'],
        CreatedDate = json['CreatedDate'],
        ModifiedDate = json['ModifiedDate'],
        SyncDateTime = json['SyncDateTime'];
}
