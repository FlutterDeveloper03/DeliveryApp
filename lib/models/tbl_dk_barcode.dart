// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'model.dart';

class TblDkBarcode extends Model{
  final int BarcodeId;
  final String BarcodeGuid;
  final String BarcodeVal;
  final int CId;
  final int DivId;
  final int ResId;
  final int UnitId;
  final ModifiedDate;
  final ModifiedUId;
  final CreatedDate;
  final CreatedUId;
  final SyncDateTime;

  TblDkBarcode({
    required this.BarcodeId,
    required this.BarcodeGuid,
    required this.BarcodeVal,
    required this.CId,
    required this.DivId,
    required this.ResId,
    required this.UnitId,
    required this.ModifiedDate,
    required this.ModifiedUId,
    required this.CreatedDate,
    required this.CreatedUId,
    required this.SyncDateTime
  });

  Map<String,dynamic> toJson()=>{
    "BarcodeId":BarcodeId,
    "BarcodeGuid":BarcodeGuid,
    "BarcodeVal":BarcodeVal,
    "CId":CId,
    "DivId":DivId,
    "ResId":ResId,
    "UnitId":UnitId,
    "ModifiedDate":(ModifiedDate!=null) ? ModifiedDate?.toIso8601String() : "",
    "ModifiedUId":ModifiedUId,
    "CreatedDate":(CreatedDate!=null) ? CreatedDate?.toIso8601String() : "",
    "CreatedUId":CreatedUId,
    "SyncDateTime":(SyncDateTime!=null) ? SyncDateTime?.toIso8601String() : "",
  };

  @override
  Map<String,dynamic> toMap(){
    return {
      'BarcodeId':BarcodeId,
      'BarcodeGuid':BarcodeGuid,
      'BarcodeVal':BarcodeVal.toString(),
      'ResId':ResId,
      'UnitId':UnitId,
      'SyncDateTime':SyncDateTime.toString()
    };
  }

  TblDkBarcode.fromJson(Map<String,dynamic> json)
  : BarcodeId = json['BarcodeId'] ?? 0,
    BarcodeGuid = json['BarcodeGuid'].toString(),
    BarcodeVal = json['BarcodeVal'].toString(),
    CId = json['CId'] ?? 0,
    DivId = json['DivId'] ?? 0,
    ResId = json['ResId'] ?? 0,
    UnitId = json['UnitId'] ?? 0,
    ModifiedDate = (json['ModifiedDate']!=null) ? DateTime.parse(json['ModifiedDate']) : null,
    ModifiedUId = json['ModifiedUId'] ?? 0,
    CreatedDate = (json['CreatedDate']!=null) ? DateTime.parse(json['CreatedDate']) : null,
    CreatedUId = json['CreatedUId'] ?? 0,
    SyncDateTime = (json['SyncDateTime']!=null) ? DateTime.parse(json['SyncDateTime']) : null;

  static TblDkBarcode fromMap(Map<String,dynamic> map){
    return TblDkBarcode(
        BarcodeId: map['BarcodeId'] ?? 0,
        BarcodeGuid: map['BarcodeGuid'].toString(),
        BarcodeVal: map['BarcodeVal'].toString(),
        CId: map['CId'] ?? 0,
        DivId: map['DivId'] ?? 0,
        ResId: map['ResId'] ?? 0,
        UnitId: map['UnitId'] ?? 0,
        ModifiedDate: DateTime.parse(map['ModifiedDate'] ?? '1900-01-01'),
        ModifiedUId: map['ModifiedUId'] ?? 0,
        CreatedDate: DateTime.parse(map['CreatedDate'] ?? '1900-01-01'),
        CreatedUId: map['CreatedUId'] ?? 0,
        SyncDateTime: DateTime.parse(map['SyncDateTime'] ?? '1900-01-01'),
    );
  }

}