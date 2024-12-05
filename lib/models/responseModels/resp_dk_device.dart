// ignore_for_file: non_constant_identifier_names

class RespDkDevice {
  final String DevUniqueId;
  final String DevName;
  final String DevDesc;
  final String AddInf1;
  final String AddInf2;
  final String AddInf3;
  final String AddInf4;
  final String AddInf5;
  final String AddInf6;

  RespDkDevice({
    required this.DevUniqueId,
    required this.DevName,
    required this.DevDesc,
    required this.AddInf1,
    required this.AddInf2,
    required this.AddInf3,
    required this.AddInf4,
    required this.AddInf5,
    required this.AddInf6
  });

  RespDkDevice.fromJson(Map<String, dynamic> json)
      : DevUniqueId = json['DevUniqueId'] ?? 0,
        DevName = json['DevName'] ?? "",
        DevDesc = json['DevDesc'] ?? "",
        AddInf1 = json['AddInf1'] ?? "",
        AddInf2 = json['AddInf2'] ?? "",
        AddInf3 = json['AddInf3'] ?? "",
        AddInf4 = json['AddInf4'] ?? "",
        AddInf5 = json['AddInf5'] ?? "",
        AddInf6 = json['AddInf6'] ?? "";

  Map<String, dynamic> toJson() => {
        "DevUniqueId": DevUniqueId,
        "DevName": DevName,
        "DevDesc": DevDesc,
        "AddInf1": AddInf1,
        "AddInf2": AddInf2,
        "AddInf3": AddInf3,
        "AddInf4": AddInf4,
        "AddInf5": AddInf5,
        "AddInf6": AddInf6,
      };
}

//
//class RespDkDevice {
//  final int DevId;
//  final int DevUId;
//  final String DevUniqueId;
//  final int RpAccId;
//  final String DevName;
//  final String DevDesc;
//  final bool IsAllowed;
//  final DateTime DevVerifyDate;
//  final String DevVerifyKey;
//  final String AddInf1;
//  final String AddInf2;
//  final String AddInf3;
//  final String AddInf4;
//  final String AddInf5;
//  final String AddInf6;
//  final DateTime CreatedDate;
//  final DateTime ModifiedDate;
//  final int CreatedUId;
//  final int ModifiedUId;
//
//  RespDkDevice({this.DevId, this.DevUId, this.DevUniqueId, this.RpAccId, this.DevName, this.DevDesc, this.IsAllowed, this.DevVerifyDate,
//    this.DevVerifyKey, this.AddInf1, this.AddInf2, this.AddInf3, this.AddInf4, this.AddInf5, this.AddInf6, this.CreatedDate,
//    this.ModifiedDate,this.CreatedUId,this.ModifiedUId});
//
//  RespDkDevice.fromJson(Map<String, dynamic> json)
//      : DevId=json['DevId'],
//        DevUId=json['DevUId'],
//        DevUniqueId=json['DevUniqueId'],
//        RpAccId=json['RpAccId'],
//        DevName=json['DevName'],
//        DevDesc=json['DevDesc'],
//        IsAllowed=json['IsAllowed'],
//        DevVerifyDate=json['DevVerifyDate'],
//        DevVerifyKey=json['DevVerifyKey'],
//        AddInf1=json['AddInf1'],
//        AddInf2=json['AddInf2'],
//        AddInf3=json['AddInf3'],
//        AddInf4=json['AddInf4'],
//        AddInf5=json['AddInf5'],
//        AddInf6=json['AddInf6'],
//        CreatedDate=json['CreatedDate'],
//        ModifiedDate=json['ModifiedDate'],
//        CreatedUId=json['CreatedUId'],
//        ModifiedUId=json['ModifiedUId'];
//
//  Map<String, dynamic> toJson()=>
//      {
//        "DevId":DevId,
//        "DevUId":DevUId,
//        "DevUniqueId":DevUniqueId,
//        "RpAccId":RpAccId,
//        "DevName":DevName,
//        "DevDesc":DevDesc,
//        "IsAllowed":IsAllowed,
//        "DevVerifyDate":DevVerifyDate,
//        "DevVerifyKey":DevVerifyKey,
//        "AddInf1":AddInf1,
//        "AddInf2":AddInf2,
//        "AddInf3":AddInf3,
//        "AddInf4":AddInf4,
//        "AddInf5":AddInf5,
//        "AddInf6":AddInf6,
//        "CreatedDate":CreatedDate,
//        "ModifiedDate":ModifiedDate,
//        "CreatedUId":CreatedUId,
//        "ModifiedUId":ModifiedUId,
//      };
//}
