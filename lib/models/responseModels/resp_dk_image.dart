// ignore_for_file: non_constant_identifier_names, camel_case_types

class Resp_dk_image {
  final int ImgId;
  final String ImgGuid;
  final int ResId;
  final String ImgName;
  final String ImgDesc;
  final String FilePath;
  final String FileName;
  final String MinDarkFileName;
  final String MinDarkFilePath;
  final String MaxDarkFileName;
  final String MaxDarkFilePath;
  final String MinLightFileName;
  final String MinLightFilePath;
  final String MaxLightFileName;
  final String MaxLightFilePath;

  Resp_dk_image(
      { required this.ImgId,
        required this.ImgGuid,
        required this.ResId,
        required this.ImgName,
        required this.ImgDesc,
        required this.FilePath,
        required this.FileName,
        required this.MinDarkFileName,
        required this.MinDarkFilePath,
        required this.MaxDarkFileName,
        required this.MaxDarkFilePath,
        required this.MinLightFileName,
        required this.MinLightFilePath,
        required this.MaxLightFileName,
        required this.MaxLightFilePath,
      });

  Resp_dk_image.fromJson(Map<String, dynamic> json)
      : ImgId=json["ImgId"],
        ImgGuid = json["ImgGuid"] ?? "",
        ResId = json['ResId'],
        ImgName = json['ImgName'] ?? "",
        ImgDesc = json['ImgDesc'] ?? "",
        FilePath = json['FilePath'] ?? "",
        FileName = json['FileName'] ?? "",
        MinDarkFileName = json['MinDarkFileName'] ?? "",
        MinDarkFilePath = json['MinDarkFilePath'] ?? "",
        MaxDarkFileName = json['MaxDarkFileName'] ?? "",
        MaxDarkFilePath = json['MaxDarkFilePath'] ?? "",
        MinLightFileName = json['MinLightFileName'] ?? "",
        MinLightFilePath = json['MinLightFilePath'] ?? "",
        MaxLightFileName = json['MaxLightFileName'] ?? "",
        MaxLightFilePath = json['MaxLightFilePath'] ?? "";

  Map<String, dynamic> toJson()=>
      {
        "ImgId":ImgId,
        "ImgGuid":ImgGuid,
        "ResId": ResId,
        "ImgName": ImgName,
        "ImgDesc": ImgDesc,
        "FilePath": FilePath,
        "FileName": FileName,
        "MinDarkFileName": MinDarkFileName,
        "MinDarkFilePath": MinDarkFilePath,
        "MaxDarkFileName": MaxDarkFileName,
        "MaxDarkFilePath": MaxDarkFilePath,
        "MinLightFileName": MinLightFileName,
        "MinLightFilePath": MinLightFilePath,
        "MaxLightFileName": MaxLightFileName,
        "MaxLightFilePath": MaxLightFilePath
      };
}
