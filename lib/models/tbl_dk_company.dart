// ignore_for_file: non_constant_identifier_names

import 'model.dart';

class TblDkCompany extends Model {
  final int CId;
  final String CGuid;
  final String Wish;
  final String CName;
  final String CDesc;
  final String CFullName;
  final String CAddress;
  final String CAddressLegal;
  final double CLatitude;
  final double CLongitude;
  final String Phone1;
  final String Phone2;
  final String Phone3;
  final String Phone4;
  final String CPostalCode;
  final String WebAddress;
  final String CEmail;
  final String AddInf1;
  final String AddInf2;
  final String AddInf3;
  final String AddInf4;
  final String AddInf5;
  final String AddInf6;
  final String BankName;
  final String BankCorAcc;
  final String BankAccBik;
  final String AccInfName;
  final String AccInfDesc;
  final String AccInfNo;
  final String TaxAccInfName;
  final String TaxAccInfDesc;
  final String TaxAccInfNo;
  final DateTime? CreatedDate;
  final DateTime? ModifiedDate;
  final DateTime? SyncDateTime;

  TblDkCompany(
      {required this.CId,
      required this.CGuid,
      required this.Wish,
      required this.CName,
      required this.CDesc,
      required this.CFullName,
      required this.CAddress,
      required this.CAddressLegal,
      required this.CLatitude,
      required this.CLongitude,
      required this.Phone1,
      required this.Phone2,
      required this.Phone3,
      required this.Phone4,
      required this.CPostalCode,
      required this.WebAddress,
      required this.CEmail,
      required this.AddInf1,
      required this.AddInf2,
      required this.AddInf3,
      required this.AddInf4,
      required this.AddInf5,
      required this.AddInf6,
      required this.BankName,
      required this.BankCorAcc,
      required this.BankAccBik,
      required this.AccInfName,
      required this.AccInfDesc,
      required this.AccInfNo,
      required this.TaxAccInfName,
      required this.TaxAccInfDesc,
      required this.TaxAccInfNo,
      required this.CreatedDate,
      required this.ModifiedDate,
      required this.SyncDateTime});

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'CId': CId,
      'CGuid': CGuid,
      'Wish':Wish,
      'CName': CName,
      'CDesc': CDesc,
      'CFullName': CFullName,
      'CAddress': CAddress,
      'CAddressLegal': CAddressLegal,
      'CLatitude': CLatitude,
      'CLongitude': CLongitude,
      'Phone1': Phone1,
      'Phone2': Phone2,
      'Phone3': Phone3,
      'Phone4': Phone4,
      'CPostalCode': CPostalCode,
      'WebAddress': WebAddress,
      'CEmail': CEmail,
      'AddInf1': AddInf1,
      'AddInf2': AddInf2,
      'AddInf3': AddInf3,
      'AddInf4': AddInf4,
      'AddInf5': AddInf5,
      'AddInf6': AddInf6,
      'BankName': BankName,
      'BankCorAcc': BankCorAcc,
      'BankAccBik': BankAccBik,
      'AccInfName': AccInfName,
      'AccInfDesc': AccInfDesc,
      'AccInfNo': AccInfNo,
      'TaxAccInfName': TaxAccInfName,
      'TaxAccInfDesc': TaxAccInfDesc,
      'TaxAccInfNo': TaxAccInfNo,
      'CreatedDate': (CreatedDate != null) ? CreatedDate.toString() : "",
      'ModifiedDate': (ModifiedDate != null) ? ModifiedDate.toString() : "",
      'SyncDateTime': (SyncDateTime != null) ? SyncDateTime.toString() : ""
    };
    return map;
  }

  static TblDkCompany fromMap(Map<String, dynamic> map) {
    return TblDkCompany(
        CId: map['CId'] ?? 0,
        CGuid: map['CGuid'] ?? "",
        Wish:map['Wish'] ?? "",
        CName: map['CName']?.toString() ?? "",
        CDesc: map['CDesc']?.toString() ?? "",
        CFullName: map['CFullName']?.toString() ?? "",
        CAddress: map['CAddress']?.toString() ?? "",
        CAddressLegal: map['CAddressLegal']?.toString() ?? "",
        CLatitude: map['CLatitude'] ?? 0,
        CLongitude: map['CLongitude'] ?? 0,
        Phone1: map['Phone1']?.toString() ?? "",
        Phone2: map['Phone2']?.toString() ?? "",
        Phone3: map['Phone3']?.toString() ?? "",
        Phone4: map['Phone4']?.toString() ?? "",
        CPostalCode: map['CPostalCode']?.toString() ?? "",
        WebAddress: map['WebAddress']?.toString() ?? "",
        CEmail: map['CEmail']?.toString() ?? "",
        AddInf1: map['AddInf1']?.toString() ?? "",
        AddInf2: map['AddInf2']?.toString() ?? "",
        AddInf3: map['AddInf3']?.toString() ?? "",
        AddInf4: map['AddInf4']?.toString() ?? "",
        AddInf5: map['AddInf5']?.toString() ?? "",
        AddInf6: map['AddInf6']?.toString() ?? "",
        BankName: map['BankName']?.toString() ?? "",
        BankCorAcc: map['BankCorAcc']?.toString() ?? "",
        BankAccBik: map['BankAccBik']?.toString() ?? "",
        AccInfName: map['AccInfName']?.toString() ?? "",
        AccInfDesc: map['AccInfDesc']?.toString() ?? "",
        AccInfNo: map['AccInfNo']?.toString() ?? "",
        TaxAccInfName: map['TaxAccInfName']?.toString() ?? "",
        TaxAccInfDesc: map['TaxAccInfDesc']?.toString() ?? "",
        TaxAccInfNo: map['TaxAccInfNo']?.toString() ?? "",
        CreatedDate: (map['CreatedDate'] != null && map['CreatedDate'].toString().isNotEmpty) ? DateTime.parse(map['CreatedDate']) : null,
        ModifiedDate: (map['ModifiedDate'] != null && map["ModifiedDate"].toString().isNotEmpty) ? DateTime.parse(map['ModifiedDate']) : null,
        SyncDateTime: (map['SyncDateTime'] != null && map['SyncDateTime'].toString().isNotEmpty) ? DateTime.parse(map['SyncDateTime']) : null);
  }
}
