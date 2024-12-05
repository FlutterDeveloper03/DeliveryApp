// ignore_for_file: non_constant_identifier_names

class RespDkRpAcc {
  final int RpAccId;
  final String RpAccGuid;
  final String RpAccRegNo;
  final String RpAccName;
  final String RpAccAddress;
  final String RpAccMobilePhoneNumber;
  final String RpAccHomePhoneNumber;
  final String RpAccWorkPhoneNumber;
  final String RpAccWorkFaxNumber;
  final String RpAccEmail;

  RespDkRpAcc({
    required this.RpAccId,
    required this.RpAccGuid,
    required this.RpAccRegNo,
    required this.RpAccName,
    required this.RpAccAddress,
    required this.RpAccMobilePhoneNumber,
    required this.RpAccHomePhoneNumber,
    required this.RpAccWorkPhoneNumber,
    required this.RpAccWorkFaxNumber,
    required this.RpAccEmail});

  RespDkRpAcc.fromJson(Map<String, dynamic> json)
      : RpAccId = json['RpAccId'] ?? 0,
        RpAccGuid = json['RpAccGuid'] ?? '',
        RpAccRegNo = json['RpAccRegNo'] ?? '',
        RpAccName = json['RpAccName'] ?? '',
        RpAccAddress = json['RpAccAddress'] ?? '',
        RpAccMobilePhoneNumber = json['RpAccMobilePhoneNumber'] ?? '',
        RpAccHomePhoneNumber = json['RpAccHomePhoneNumber'] ?? '',
        RpAccWorkPhoneNumber = json['RpAccWorkPhoneNumber'] ?? '',
        RpAccWorkFaxNumber = json['RpAccWorkFaxNumber'] ?? '',
        RpAccEmail = json['RpAccEmail'] ?? '';

  Map<String, dynamic> toJson() => {
    "RpAccId": RpAccId,
    "RpAccGuid": RpAccGuid,
    "RpAccRegNo": RpAccRegNo,
    "RpAccName": RpAccName,
    "RpAccAddress": RpAccAddress,
    "RpAccMobilePhoneNumber": RpAccMobilePhoneNumber,
    "RpAccHomePhoneNumber": RpAccHomePhoneNumber,
    "RpAccWorkPhoneNumber": RpAccWorkPhoneNumber,
    "RpAccWorkFaxNumber": RpAccWorkFaxNumber,
    "RpAccEmail":RpAccEmail,
  };
}