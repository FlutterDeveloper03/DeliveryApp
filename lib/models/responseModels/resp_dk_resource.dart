// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:delivery_app/models/responseModels/resp_dk_image.dart';
class Resp_dk_resource {
  final int ResId;
  final String ResName;
  final List<Resp_dk_image> Images;

  Resp_dk_resource({
    required this.ResId,
    required this.ResName,
    required this.Images,
  });

  Resp_dk_resource.fromJson(Map<String, dynamic> json)
      : ResId = json['ResId'] ?? 0,
        ResName = json['ResName'] ?? '',
        Images=(json["Images"]==null) ? [] : (json["Images"] as List).map((e) => Resp_dk_image.fromJson(e)).toList();

  Map<String, dynamic> toJson() => {
    "ResId":ResId,
    "ResName": ResName,
    "Images":Images.map((e) => e.toJson()).toList()
  };
}
