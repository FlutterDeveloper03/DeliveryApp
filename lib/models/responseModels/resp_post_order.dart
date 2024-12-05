

// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:delivery_app/models/responseModels/resp_dk_order_inv.dart';

class Resp_post_order{
  final String BaseOs;
  final String Release;
  final String Brand;
  final String Device;
  final String Display;
  final String Id;
  final String Manufacturer;
  final String Model;
  final bool IsPhysicalDevice;
  final String AndroidId;
  final Resp_dk_order_inv orderInv;

  Resp_post_order({
    required this.BaseOs,
    required this.Release,
    required this.Brand,
    required this.Device,
    required this.Display,
    required this.Id,
    required this.Manufacturer,
    required this.Model,
    required this.IsPhysicalDevice,
    required this.AndroidId,
    required this.orderInv
  });

  Resp_post_order.fromJson(Map<String,dynamic> json)
      :BaseOs=json['BaseOs'] ?? "",
        Release=json['Release'] ?? "",
        Brand=json['Brand'] ?? "",
        Device=json['Device'] ?? "",
        Display=json['Display'] ?? "",
        Id=json['Id'] ?? "",
        Manufacturer=json['Manufacturer'] ?? "",
        Model=json['Model'] ?? "",
        IsPhysicalDevice=json['IsPhysicalDevice'] ?? false,
        AndroidId=json['AndroidId'] ?? "",
        orderInv=Resp_dk_order_inv.fromJson(json['orderInv']);

  Map<String,dynamic> toJson()=>{
    'BaseOs':BaseOs,
    'Release':Release,
    'Brand':Brand,
    'Device':Device,
    'Display':Display,
    'Id':Id,
    'Manufacturer':Manufacturer,
    'Model':Model,
    'IsPhysicalDevice':IsPhysicalDevice,
    'AndroidId':AndroidId,
    'orderInv':orderInv.toJson(),
  };
}