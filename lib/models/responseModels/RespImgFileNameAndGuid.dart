// ignore_for_file: non_constant_identifier_names

class RespImgFileNameAndGuid{
  final String ImgGuid;
  final String FileName;

  RespImgFileNameAndGuid(this.ImgGuid,this.FileName);

  Map<String,dynamic> toJson()=>{
    "ImgGuid":ImgGuid,
    "FileName":FileName
  };

  RespImgFileNameAndGuid.fromJson(Map<String,dynamic> json)
    : ImgGuid=json["ImgGuid"],
      FileName = json["FileName"];
}