// ignore_for_file: file_names, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:delivery_app/models/responseModels/RespImgFileNameAndGuid.dart';
import 'package:delivery_app/models/responseModels/getResponseDataAsJson.dart';
import 'package:delivery_app/models/responseModels/postOrderResponse.dart';
import 'package:delivery_app/models/responseModels/resp_dk_brand.dart';
import 'package:delivery_app/models/responseModels/resp_dk_company_info.dart';
import 'package:delivery_app/models/responseModels/resp_dk_device.dart';
import 'package:delivery_app/models/responseModels/resp_dk_image.dart';
import 'package:delivery_app/models/responseModels/resp_dk_res_category.dart';
import 'package:delivery_app/models/responseModels/resp_dk_res_price.dart';
import 'package:delivery_app/models/responseModels/resp_dk_res_price_group.dart';
import 'package:delivery_app/models/responseModels/resp_dk_res_totals.dart';
import 'package:delivery_app/models/responseModels/resp_dk_resource.dart';
import 'package:delivery_app/models/responseModels/resp_dk_warehouse.dart';
import 'package:delivery_app/models/responseModels/resp_post_order.dart';
import 'package:delivery_app/models/tbl_dk_barcode.dart';
import 'package:delivery_app/models/tbl_dk_rp_acc.dart';
import 'package:delivery_app/models/tbl_dk_user.dart';
import 'package:sql_conn/sql_conn.dart';

class DbService {
  final String host;
  final int port;
  final String dbUName;
  final String dbUPass;
  final String dbName;

  DbService(this.host, this.port, this.dbName, this.dbUName, this.dbUPass);

  Future<int> connect() async {
    try {
      if (host.isNotEmpty && port > 0 && dbUName.isNotEmpty && dbUPass.isNotEmpty && dbName.isNotEmpty) {
        await SqlConn.connect(ip: host, port: port.toString(), databaseName: dbName, username: dbUName, password: dbUPass);
        if (SqlConn.isConnected) {
          debugPrint("Connected!");
          return 1;
        } else {
          debugPrint("Print: Can't connect to db.");
          return 0;
        }
      } else {
        debugPrint("Print: Can't connect to db. Some required fields are empty");
        return 0;
      }
    } catch (e) {
      debugPrint("PrintError on DbService.connect(): $e");
      return 0;
    }
  }

  Future<Resp_dk_company_info?> getCompanyInfo() async {
    if (host.isNotEmpty && port > 0 && dbUName.isNotEmpty && dbUPass.isNotEmpty && dbName.isNotEmpty) {
      try {
        int connectionStatus = 1;
        if (!SqlConn.isConnected) {
          connectionStatus = await connect();
        }
        if (connectionStatus == 1) {
          var result = await SqlConn.readData("SELECT firm_id as CId, firm_id_guid as CGuid, firm_name as CName, firm_fullname as CFullName, "
              "firm_phone as Phone1, firm_fax as Phone2, firm_adres1 as WebAddress, firm_adres2 as Wish FROM tbl_mg_firm");
          if (result != null) {
            List decodedList = jsonDecode(result);
            return Resp_dk_company_info.fromJson(decodedList.first);
          }
        }
      } catch (e) {
        debugPrint("PrintError on DbService.getCompanyInfo(): ${e.toString()}");
      }
    }
    return null;
  }

  Future<TblDkUser?> getDeviceUser() async {
    if (host.isNotEmpty && port > 0 && dbUName.isNotEmpty && dbUPass.isNotEmpty && dbName.isNotEmpty) {
      try {
        int connectionStatus = 1;
        if (!SqlConn.isConnected) {
          connectionStatus = await connect();
        }
        if (connectionStatus == 1) {
          var result = await SqlConn.readData("select salesman_id UId, salesman_id_guid UGuid, salesman_name UFullName,salesman_name UName,"
              "spe_code AddInf1, group_code AddInf2, security_code AddInf3 from tbl_mg_salesman");
          if (result != null) {
            List decodedList = jsonDecode(result);
            return TblDkUser.fromJson(decodedList.first);
          }
        }
      } catch (e) {
        debugPrint("PrintError on DbService.getDeviceUser(): ${e.toString()}");
      }
    }
    return null;
  }

  Future<GetResponseDataAsJson?> postRegisterRequest(RespDkDevice postRegisterRequest) async {
    if (host.isNotEmpty && port > 0 && dbUName.isNotEmpty && dbUPass.isNotEmpty && dbName.isNotEmpty) {
      try {
        int connectionStatus = 1;
        if (!SqlConn.isConnected) {
          connectionStatus = await connect();
        }
        if (connectionStatus == 1) {
          String query = '''
             INSERT INTO [tbl_dk_device]
                   ([DevGuid],[DevUniqueId],[UId],[RpAccId],[DevName],[DevDesc],[IsAllowed],[DevVerifyDate],[DevVerifyKey],[AddInf1],[AddInf2]
                   ,[AddInf3],[AddInf4],[AddInf5],[AddInf6],[AddInf7],[AddInf8],[AddInf9],[AddInf10],[AllowedDate],[DisallowedDate],[CreatedDate]
                   ,[ModifiedDate],[CreatedUId],[ModifiedUId],[SyncDateTime])
             VALUES
                   (NEWID() --DevGuid
                   ,'${postRegisterRequest.DevUniqueId}' --DevUniqueId
                   ,null --UId
                   ,null --RpAccId
                   ,'${postRegisterRequest.DevName}' --DevName
                   ,'${postRegisterRequest.DevDesc}' --DevDesc
                   ,0 --IsAllowed
                   ,null --DevVerifyDate
                   ,null --DevVerifyKey
                   ,'' --AddInf1
                   ,'' --AddInf2
                   ,'' --AddInf3
                   ,'' --AddInf4
                   ,'' --AddInf5
                   ,'${postRegisterRequest.AddInf6}' --AddInf6
                   ,'' --AddInf7
                   ,'' --AddInf8
                   ,'' --AddInf9
                   ,'' --AddInf10
                   ,null --AllowedDate
                   ,null --DisallowedDate
                   ,GETDATE() --CreatedDate
                   ,null --ModifiedDate
                   ,null --CreatedUId
                   ,null --ModifiedUId
                   ,null --SyncDateTime
                   )
        ''';
          var result = await SqlConn.writeData(query);
          if (result != null) {
            return GetResponseDataAsJson(message: 'success', status: 1, total: 1);
          }
        }
      } catch (e) {
        debugPrint("PrintError on QueryFromApi createDeviceTable.: ${e.toString()}");
        rethrow;
      }
    }
    return null;
  }

  Future<bool> createDeviceTable() async {
    if (host.isNotEmpty && port > 0 && dbUName.isNotEmpty && dbUPass.isNotEmpty && dbName.isNotEmpty) {
      try {
        int connectionStatus = 1;
        if (!SqlConn.isConnected) {
          connectionStatus = await connect();
        }
        if (connectionStatus == 1) {
          var result = await SqlConn.writeData("""
            CREATE TABLE tbl_dk_device (
              DevId INTEGER IDENTITY(1,1) NOT NULL PRIMARY KEY,
              DevGuid NVARCHAR(100) DEFAULT NEWID(),
              DevUniqueId NVARCHAR(100),
              UId INTEGER,
              RpAccId INTEGER,
              DevName NVARCHAR(200) NOT NULL,
              DevDesc NVARCHAR(500),
              IsAllowed BIT DEFAULT 0,
              DevVerifyDate DATETIME DEFAULT convert(datetime, GETDATE(), 104),
              DevVerifyKey NVARCHAR(MAX),
              AddInf1 NVARCHAR(500) DEFAULT '',
              AddInf2 NVARCHAR(500) DEFAULT '',
              AddInf3 NVARCHAR(500) DEFAULT '',
              AddInf4 NVARCHAR(500) DEFAULT '',
              AddInf5 NVARCHAR(500) DEFAULT '',
              AddInf6 NVARCHAR(500) DEFAULT '',
              AddInf7 NVARCHAR(500) DEFAULT '',
              AddInf8 NVARCHAR(500) DEFAULT '',
              AddInf9 NVARCHAR(500) DEFAULT '',
              AddInf10 NVARCHAR(500) DEFAULT '',
              AllowedDate DATETIME,
              ResPriceGroupId INTEGER DEFAULT 0,
              DisallowedDate DATETIME,
              CreatedDate DATETIME DEFAULT convert(datetime, GETDATE(), 104),
              ModifiedDate DATETIME DEFAULT convert(datetime, GETDATE(), 104),
              CreatedUId INTEGER DEFAULT 0,
              ModifiedUId INTEGER DEFAULT 0,
              SyncDateTime DATETIME,
              OptimisticLockField INTEGER,
              GCRecord INTEGER,
            );
            """);
          if (result != null) {
            return true;
          }
        }
      } catch (e) {
        debugPrint("PrintError on QueryFromApi createDeviceTable.: ${e.toString()}");
        rethrow;
      }
    }
    return false;
  }

  Future<List<RespDkBrand>> getBrands() async {
    String query = '''
                      SELECT DISTINCT spe_code BrandName FROM TBL_MG_MATERIALS
                      WHERE LEN(spe_code)>0
                   ''';

    if (host.isNotEmpty && port > 0 && dbUName.isNotEmpty && dbUPass.isNotEmpty && dbName.isNotEmpty) {
      try {
        int connectionStatus = 1;
        if (!SqlConn.isConnected) {
          connectionStatus = await connect();
        }
        if (connectionStatus == 1) {
          int connectionStatus = 1;
          if (!SqlConn.isConnected) {
            connectionStatus = await connect();
          }
          if (connectionStatus == 1) {
            var result = await SqlConn.readData(query);
            if (result != null) {
              List decoded = jsonDecode(result);
              return decoded.map((e) => RespDkBrand.fromJson(e)).toList();
            }
          }
        }
      } catch (e) {
        debugPrint("PrintError from getBrands(): ${e.toString()}");
      }
    }
    return [];
  }

  Future<List<Resp_dk_res_category>> getCategories() async {
    String query = '''
                      SELECT DISTINCT group_code ResCatName FROM TBL_MG_MATERIALS
                      WHERE LEN(group_code)>0
                   ''';

    if (host.isNotEmpty && port > 0 && dbUName.isNotEmpty && dbUPass.isNotEmpty && dbName.isNotEmpty) {
      try {
        int connectionStatus = 1;
        if (!SqlConn.isConnected) {
          connectionStatus = await connect();
        }
        if (connectionStatus == 1) {
          int connectionStatus = 1;
          if (!SqlConn.isConnected) {
            connectionStatus = await connect();
          }
          if (connectionStatus == 1) {
            var result = await SqlConn.readData(query);
            if (result != null) {
              List decoded = jsonDecode(result);
              return decoded.map((e) => Resp_dk_res_category.fromJson(e)).toList();
            }
          }
        }
      } catch (e) {
        debugPrint("PrintError from getCategories(): ${e.toString()}");
      }
    }
    return [];
  }

  Future<List<TblDkBarcode>> getBarcodes() async {
    String query = '''
                      SELECT bar_id BarcodeId,
                        bar_id_guid BarcodeGuid,
                        bar_barcode BarcodeVal,
                        firm_id CId,
                        0 DivId,
                        material_id ResId,
                        unit_det_id UnitId,
                        bar_date ModifiedDate,
                        sync_datetime SyncDateTime
                      FROM dbo.tbl_mg_barcode
                   ''';

    if (host.isNotEmpty && port > 0 && dbUName.isNotEmpty && dbUPass.isNotEmpty && dbName.isNotEmpty) {
      try {
        int connectionStatus = 1;
        if (!SqlConn.isConnected) {
          connectionStatus = await connect();
        }
        if (connectionStatus == 1) {
          int connectionStatus = 1;
          if (!SqlConn.isConnected) {
            connectionStatus = await connect();
          }
          if (connectionStatus == 1) {
            var result = await SqlConn.readData(query);
            if (result != null) {
              List decoded = jsonDecode(result);
              return decoded.map((e) => TblDkBarcode.fromJson(e)).toList();
            }
          }
        }
      } catch (e) {
        debugPrint("PrintError from getBarcodes(): ${e.toString()}");
      }
    }
    return [];
  }

  Future<List<Resp_dk_resource>> getResources() async {
    String query = '''
                      SELECT 
                        spe_code AddInf1,
                        group_code AddInf2,
                        security_code AddInf3,
                        spe_code4 AddInf4,
                        spe_code5 AddInf5,
                        spe_code6 AddInf6,
                        bar_barcode BarcodeVal,
                        0 BrandId,
                        spe_code BrandName,
                        firm_id CId,
                        modify_date ModifiedDate,
                        group_code ResCatName,
                        material_id ResId,
                        material_id_guid ResGuid,
                        mat_last_purch_arap_id ResLastVendorId,
                        material_name ResName,
                        sale_price ResPriceValue,
                        mat_auto_production ResProductionOnSale,
                        material_code ResRegNo,
                        mat_whousetotal_amount ResTotBalance,
                        unit_det_id ResUnitId,
                        unit_det_name UnitName,
                        a_status_id UsageStatusId,
                        a_status_name UsageStatusName
                      FROM dbo.v_mg_materials_bar m
                      where wh_id=-1
                   ''';

    if (host.isNotEmpty && port > 0 && dbUName.isNotEmpty && dbUPass.isNotEmpty && dbName.isNotEmpty) {
      try {
        int connectionStatus = 1;
        if (!SqlConn.isConnected) {
          connectionStatus = await connect();
        }
        if (connectionStatus == 1) {
          int connectionStatus = 1;
          if (!SqlConn.isConnected) {
            connectionStatus = await connect();
          }
          if (connectionStatus == 1) {
            String result = await SqlConn.readData(query);
            if (result.isNotEmpty) {
              List decoded = jsonDecode(result);
              return decoded.map((e) => Resp_dk_resource.fromJson(e)).toList();
            }
          }
        }
      } catch (e) {
        debugPrint("PrintError from getResources(): ${e.toString()}");
      }
    }
    return [];
  }

  Future<List<RespDkWarehouse>> getWarehouses() async {
    String query = '''
                      select 
                        firm_id CId,
                        div_id DivId,
                        isenabled UsageStatusId,
                        wh_id_guid WhGuid,
                        wh_id WhId,
                        wh_name WhName
                      from tbl_mg_whouse
                   ''';

    if (host.isNotEmpty && port > 0 && dbUName.isNotEmpty && dbUPass.isNotEmpty && dbName.isNotEmpty) {
      try {
        int connectionStatus = 1;
        if (!SqlConn.isConnected) {
          connectionStatus = await connect();
        }
        if (connectionStatus == 1) {
          int connectionStatus = 1;
          if (!SqlConn.isConnected) {
            connectionStatus = await connect();
          }
          if (connectionStatus == 1) {
            var result = await SqlConn.readData(query);
            if (result != null) {
              List decoded = jsonDecode(result);
              return decoded.map((e) => RespDkWarehouse.fromJson(e)).toList();
            }
          }
        }
      } catch (e) {
        debugPrint("PrintError from getWarehouses(): ${e.toString()}");
      }
    }
    return [];
  }

  Future<List<RespDkResTotals>> getResTotals() async {
    String query = '''
                      select 
                        mat_last_trans_date ModifiedDate,
                        material_id ResId,
                        mat_whousetotal_amount ResTotBalance,
                        mat_whousetotal_amount ResPendingTotalAmount,
                        mat_whousetotal_id ResTotId,
                        mat_wh_trans_amount_in ResTotInAmount,
                        mat_last_trans_date ResTotLastTrDate,
                        mat_wh_trans_amount_out ResTotOutAmount,
                        mat_tot_purch_avg_price ResTotPurchAvgPrice,
                        sync_datetime SyncDateTime,
                        wh_id WhId,
                        p_id WpId
                      from tbl_mg_material_total
                   ''';

    if (host.isNotEmpty && port > 0 && dbUName.isNotEmpty && dbUPass.isNotEmpty && dbName.isNotEmpty) {
      try {
        int connectionStatus = 1;
        if (!SqlConn.isConnected) {
          connectionStatus = await connect();
        }
        if (connectionStatus == 1) {
          int connectionStatus = 1;
          if (!SqlConn.isConnected) {
            connectionStatus = await connect();
          }
          if (connectionStatus == 1) {
            var result = await SqlConn.readData(query);
            if (result != null) {
              List decoded = jsonDecode(result);
              return decoded.map((e) => RespDkResTotals.fromJson(e)).toList();
            }
          }
        }
      } catch (e) {
        debugPrint("PrintError from getResTotals(): ${e.toString()}");
      }
    }
    return [];
  }

  Future<List<RespDkResPriceGroup>> getResPriceGroups() async {
    String query = '''
                      select 
                        price_cat_id ResPriceGroupId,
                        price_cat_name ResPriceGroupName
                      from tbl_mg_price_category
                   ''';

    if (host.isNotEmpty && port > 0 && dbUName.isNotEmpty && dbUPass.isNotEmpty && dbName.isNotEmpty) {
      try {
        int connectionStatus = 1;
        if (!SqlConn.isConnected) {
          connectionStatus = await connect();
        }
        if (connectionStatus == 1) {
          int connectionStatus = 1;
          if (!SqlConn.isConnected) {
            connectionStatus = await connect();
          }
          if (connectionStatus == 1) {
            var result = await SqlConn.readData(query);
            if (result != null) {
              List decoded = jsonDecode(result);
              return decoded.map((e) => RespDkResPriceGroup.fromJson(e)).toList();
            }
          }
        }
      } catch (e) {
        debugPrint("PrintError from getResPriceGroups(): ${e.toString()}");
      }
    }
    return [];
  }

  Future<List<RespDkResPrice>> getResPrices(String token) async {
    String query = '''
                      select 
                        currency_id CurrencyId,
                        modify_date ModifiedDate,
                        price_start_date PriceStartDate,
                        price_end_date PriceEndDate,
                        material_id ResId,
                        price_cat_id ResPriceGroupId,
                        price_id ResPriceId,
                        price_code ResPriceRegNo,
                        price_type_id ResPriceTypeId,
                        price_value ResPriceValue,
                        sync_datetime SyncDateTime,
                        unit_det_id ResUnitId
                      from tbl_mg_mat_price
                      where price_type_id=2
                   ''';

    if (host.isNotEmpty && port > 0 && dbUName.isNotEmpty && dbUPass.isNotEmpty && dbName.isNotEmpty) {
      try {
        int connectionStatus = 1;
        if (!SqlConn.isConnected) {
          connectionStatus = await connect();
        }
        if (connectionStatus == 1) {
          int connectionStatus = 1;
          if (!SqlConn.isConnected) {
            connectionStatus = await connect();
          }
          if (connectionStatus == 1) {
            var result = await SqlConn.readData(query);
            if (result != null) {
              List decoded = jsonDecode(result);
              return decoded.map((e) => RespDkResPrice.fromJson(e)).toList();
            }
          }
        }
      } catch (e) {
        debugPrint("PrintError from getResPrices(): ${e.toString()}");
      }
    }
    return [];
  }

  Future<List<Resp_dk_image>?> getImagesByPost(List<RespImgFileNameAndGuid> existsImg, int offset, int rowCnt) async {
    String whereClause = '';
    for (var element in existsImg) {
      whereClause = (whereClause.isNotEmpty) ? whereClause + ',' + "'${element.ImgGuid.toString()}'" : "'${element.ImgGuid.toString()}'";
    }
    String query = '''
                      select 
                        firm_id CId,
                        image_id_guid ImgGuid,
                        image_id ImgId,
                        modify_date ModifiedDate,
                        material_id ResId,
                        arap_id RpAccId,
                        sync_datetime SyncDateTime
                      from tbl_mg_images
                      ${whereClause.isNotEmpty ? '''where image_id_guid not in (
                            $whereClause
                          )''' : ''}
                      ORDER BY image_id
                      OFFSET $offset ROWS FETCH NEXT $rowCnt ROWS ONLY
                   ''';

    if (host.isNotEmpty && port > 0 && dbUName.isNotEmpty && dbUPass.isNotEmpty && dbName.isNotEmpty) {
      try {
        int connectionStatus = 1;
        if (!SqlConn.isConnected) {
          connectionStatus = await connect();
        }
        if (connectionStatus == 1) {
          int connectionStatus = 1;
          if (!SqlConn.isConnected) {
            connectionStatus = await connect();
          }
          if (connectionStatus == 1) {
            var result = await SqlConn.readData(query);
            if (result != null) {
              List decoded = jsonDecode(result);
              return decoded.map((e) => Resp_dk_image.fromJson(e)).toList();
            }
          }
        }
      } catch (e) {
        debugPrint("PrintError from getImagesByPost(): ${e.toString()}");
      }
    }
    return [];
  }

  Future<Uint8List?> getImageBytes(String guid) async {
    String query = '''
                      select Top(1) Image_pict from tbl_mg_images
                      where image_id_guid like '$guid'
                   ''';

    if (host.isNotEmpty && port > 0 && dbUName.isNotEmpty && dbUPass.isNotEmpty && dbName.isNotEmpty) {
      try {
        int connectionStatus = 1;
        if (!SqlConn.isConnected) {
          connectionStatus = await connect();
        }
        if (connectionStatus == 1) {
          int connectionStatus = 1;
          if (!SqlConn.isConnected) {
            connectionStatus = await connect();
          }
          if (connectionStatus == 1) {
            var result = await SqlConn.readData(query);
            if (result != null) {
              List decoded = jsonDecode(result);
              return base64Decode(decoded.first['Image_pict']);
            } else {
              return null;
            }
          } else {
            return null;
          }
        }
      } catch (e) {
        debugPrint("PrintError from getImagesByPost(): ${e.toString()}");
      }
    }
    return null;
  }

  Future<PostOrderResponse?> postOrderInv(Resp_post_order postOrder) async {
    if (host.isNotEmpty && port > 0 && dbUName.isNotEmpty && dbUPass.isNotEmpty && dbName.isNotEmpty) {
      try {
        int connectionStatus = 1;
        if (!SqlConn.isConnected) {
          connectionStatus = await connect();
        }
        if (connectionStatus == 1) {
          // Resp_dk_order_inv orderInv = postOrder.orderInv;
          // List<Resp_dk_order_inv_line>? oInvLines = orderInv.OrderLines;
          // String lineValues = oInvLines.map((e) {
          //       return '''
          //    (${e.OInvLineAmount} --fich_line_amount
          //    ,${e.OInvLinePrice} --fich_line_price
          //    ,${e.OInvLineTotal} --fich_line_total
          //    ,@invId --inv_id
          //    ,@invId --fich_id
          //    ,(select Top(1) material_id from tbl_mg_materials where material_id_guid like '${e.ResGuid}') --material_id
          //    ,'${e.OInvLineDesc}' --fich_line_desc
          //    ,${e.UnitId} --unit_det_id
          //    ,0 --fich_line_disc_prc
          //    ,0 --fich_line_disc_amount
          //    ,${e.OInvLineFTotal} --fich_line_nettotal
          //    ,GETDATE() --fich_line_date
          //    ,0 --service_id
          //    ,'1900-01-01 00:00:00' --fich_line_expiredate
          //    ,'' --fich_line_serialno
          //    ,0 --mat_inv_line_id
          //    ,0 --rep_rate
          //    ,0 --rep_total
          //    ,0 --fich_line_type_id
          //    ,'${e.AddInf1}' --spe_code
          //    ,'${e.AddInf2}' --group_code
          //    ,'${e.AddInf3}' --security_code
          //    ,NEWID() --fich_line_id_guid
          //    ,@fichIdGuid --fich_id_guid
          //    ,0 --line_status_id
          //    ,'' --spe_code1
          //    ,'' --spe_code2
          //    ,'' --spe_code3
          //    ,'' --spe_code4
          //    ,'' --spe_code5
          //    ,'' --spe_code6
          //    ,'' --spe_code7
          //    ,'' --spe_code8
          //    ,'' --spe_code9
          //    ,'' --user_name
          //    ,${postOrder.orderInv.UId} --salesman_id
          //    ,0 --fich_line_tax
          //    ,0 --fich_line_service_amount
          //    )
          // ''';
          //     }).join(',') ??
        //       '';
        //   String query = '''
        //      DECLARE @invId int
        //      DECLARE @fichIdGuid NVARCHAR(50)
        //      SET @fichIdGuid=NEWID()
        //      DECLARE @arap_id int
        //
        //      select Top(1) @arap_id=arap_id from tbl_mg_arap
        //      where arap_id_guid like ''
        //
        //      INSERT INTO [dbo].[tbl_mg_order_fich]
        //            ([fich_code],[fich_date],[fich_total],[fich_create_date],[fich_type_id],[arap_id],[div_id],[dept_id],[plant_id],[wh_id],[p_id]
        //            ,[inv_id],[fich_desc],[fich_discount],[fich_nettotal],[salesman_id],[T_ID],[spe_code],[group_code],[security_code],[payplan_id]
        //            ,[ord_status_id],[rep_rate],[rep_total],[fich_modify_date],[fich_total_unit_amount],[fich_modified],[bank_acc_id_client]
        //            ,[bank_acc_id_local],[delivery_arap_id],[sync_datetime],[order_lat],[order_long],[fich_nettotal_text],[fich_id_guid],[term_id]
        //            ,[doc_state_id],[fic_tax],[cashpayed1],[cashpayed2],[cashpayed3],[creditpayed1],[creditpayed2],[creditpayed3],[spe_code1]
        //            ,[spe_code2],[spe_code3],[spe_code4],[spe_code5])
        //      VALUES
        //            (NEWID()
        //            ,GETDATE()
        //            ,${orderInv.OInvTotal}
        //            ,GETDATE()
        //            ,12
        //            ,@arap_id
        //            ,1 --div_id
        //            ,1 --dept_id
        //            ,1 --plant_id
        //            ,1 --wh_id
        //            ,1 --p_id
        //            ,0 --inv_id
        //            ,'' --fich_desc
        //            ,0 --fich_discount
        //            ,${orderInv.OInvFTotal} --fich_nettotal
        //            ,${postOrder.orderInv.UId} --salesman_id
        //            ,0 --T_ID
        //            ,'${orderInv.AddInf1}' --spe_code
        //            ,'${orderInv.AddInf2}' --group_code
        //            ,'${orderInv.AddInf3}' --security_code
        //            ,0 --payplan_id
        //            ,1 --ord_status_id
        //            ,0 --rep_rate
        //            ,0 --rep_total
        //            ,null --fich_modify_date
        //            ,0 --fich_total_unit_amount
        //            ,0 --fich_modified
        //            ,0 --bank_acc_id_client
        //            ,0 --bank_acc_id_local
        //            ,0 --delivery_arap_id
        //            ,null --sync_datetime
        //            ,0.00000 --order_lat
        //            ,0.00000 --order_long
        //            ,''
        //            ,@fichIdGuid --fich_id_guid
        //            ,0 --term_id
        //            ,0 --doc_state_id
        //            ,0 --fic_tax
        //            ,0 --cashpayed1
        //            ,0 --cashpayed2
        //            ,0 --cashpayed3
        //            ,0 --creditpayed1
        //            ,0 --creditpayed2
        //            ,0 --creditpayed3
        //            ,'BaseOs=${postOrder.BaseOs},AndroidId=${postOrder.AndroidId},Brand=${postOrder.Brand},Model=${postOrder.Model},Manufacturer=${postOrder.Manufacturer}, IsPhysicalDevice=${postOrder.IsPhysicalDevice}' --spe_code1
        //            ,'' --spe_code2
        //            ,'' --spe_code3
        //            ,'' --spe_code4
        //            ,''); --spe_code5
        //
        //      SET @invId = SCOPE_IDENTITY();
        //
        //      INSERT INTO [tbl_mg_order_fich_line]
        //            ([fich_line_amount],[fich_line_price],[fich_line_total],[inv_id],[fich_id],[material_id],[fich_line_desc],[unit_det_id]
        //            ,[fich_line_disc_prc],[fich_line_disc_amount],[fich_line_nettotal],[fich_line_date],[service_id],[fich_line_expiredate]
        //            ,[fich_line_serialno],[mat_inv_line_id],[rep_rate],[rep_total],[fich_line_type_id],[spe_code],[group_code],[security_code]
        //            ,[fich_line_id_guid],[fich_id_guid],[line_status_id],[spe_code1],[spe_code2],[spe_code3],[spe_code4],[spe_code5],[spe_code6]
        //            ,[spe_code7],[spe_code8],[spe_code9],[user_name],[salesman_id],[fich_line_tax],[fich_line_service_amount])
        //      VALUES
        //            $lineValues
        // ''';

          // var result = await SqlConn.writeData(query);
          // if (result != null) {
          //   return PostOrderResponse(
          //       data: postOrder.orderInv, fail_total: 0, fails: [], message: '', status: 1, success_total: 1, successes: [], total: 0);
          // }
        }
      } catch (e) {
        debugPrint("PrintError on QueryFromApi createDeviceTable.: ${e.toString()}");
        rethrow;
      }
    }
    return null;
  }

  Future<GetResponseDataAsJson?> postRpAcc(List<TblDkRpAcc> rpAccs) async {
    if (host.isNotEmpty && port > 0 && dbUName.isNotEmpty && dbUPass.isNotEmpty && dbName.isNotEmpty) {
      try {
        int connectionStatus = 1;
        if (!SqlConn.isConnected) {
          connectionStatus = await connect();
        }
        if (connectionStatus == 1) {
          String values = rpAccs.map((e) {
            return '''
             ('${e.RpAccRegNo}' --arap_code
             ,'${e.RpAccName}' --arap_name
             ,'${e.RpAccAddress}' --arap_address
             ,${e.CId} --firm_id
             ,2 --a_type_id
             ,1 --a_status_id
             ,GETDATE() --arap_create_date
             ,null --arap_modify_date
             ,0 --arap_shop_card_id
             ,0 --acc_card_id
             ,${e.UId} --salesman_id
             ,'${e.AddInf1}' --spe_code
             ,'${e.AddInf2}' --group_code
             ,'${e.AddInf3}' --security_code
             ,'${e.AddInf4}' --work_group_code
             ,'' --spe_code1
             ,'' --spe_code2
             ,'' --arap_lname
             ,'' --arap_fname
             ,'' --arap_mid_name
             ,'' --arap_gender
             ,null --arap_birthdate
             ,'' --arap_birthplace
             ,'' --arap_nation
             ,'' --arap_social_ent
             ,'' --arap_edu_level
             ,0 --edu_l_id
             ,'' --arap_acad_level
             ,'' --arap_acad_name
             ,'' --arap_army_capable
             ,'' --arap_army_level
             ,'' --arap_army_category
             ,'' --arap_army_type
             ,'' --arap_party_member
             ,'' --arap_tel_home
             ,'' --arap_tel_work
             ,'' --arap_tel_mobile1
             ,'' --arap_tel_mobile2
             ,'' --arap_tel_fax
             ,'' --arap_email1
             ,'' --arap_email2
             ,0 --arap_discount_perc
             ,'' --arap_pasportno
             ,'' --arap_city
             ,'' --arap_country
             ,'' --arap_postalcode
             ,'' --arap_region
             ,'' --spe_code3
             ,'' --spe_code4
             ,'${e.AddInf5}' --spe_code5
             ,'${e.AddInf6}' --spe_code6
             ,'' --spe_code7
             ,'' --spe_code8
             ,'' --spe_code9
             ,'' --spe_code10
             ,0 --data_send
             ,0 --arap_long
             ,0 --arap_lat
             ,${e.DivId} --div_id
             ,1 --dept_id
             ,0 --arap_balance_limit
             ,1 --Pr_ID
             ,2 --arap_payrol_type
             ,null --sync_datetime
             ,NEWID() --arap_id_guid
             )
          ''';
          }).join(',');
          String query = '''
             DECLARE @arap_id int
             
             INSERT INTO [tbl_mg_arap]
                   ([arap_code],[arap_name],[arap_address],[firm_id],[a_type_id],[a_status_id],[arap_create_date],[arap_modify_date]
                   ,[arap_shop_card_id],[acc_card_id],[salesman_id],[spe_code],[group_code],[security_code],[work_group_code],[spe_code1]
                   ,[spe_code2],[arap_lname],[arap_fname],[arap_mid_name],[arap_gender],[arap_birthdate],[arap_birthplace],[arap_nation]
                   ,[arap_social_ent],[arap_edu_level],[edu_l_id],[arap_acad_level],[arap_acad_name],[arap_army_capable],[arap_army_level]
                   ,[arap_army_category],[arap_army_type],[arap_party_member],[arap_tel_home],[arap_tel_work],[arap_tel_mobile1],[arap_tel_mobile2]
                   ,[arap_tel_fax],[arap_email1],[arap_email2],[arap_discount_perc],[arap_pasportno],[arap_city],[arap_country],[arap_postalcode]
                   ,[arap_region],[spe_code3],[spe_code4],[spe_code5],[spe_code6],[spe_code7],[spe_code8],[spe_code9],[spe_code10],[data_send]
                   ,[arap_long],[arap_lat],[div_id],[dept_id],[arap_balance_limit],[Pr_ID],[arap_payrol_type],[sync_datetime],[arap_id_guid]
             VALUES
                   $values;
             
             @arap_id = SCOPEIDENTITY();
             
             SELECT [arap_id],[arap_code],[arap_name],[arap_address],[firm_id],[a_type_id],[a_status_id],[arap_create_date],[arap_modify_date]
                    ,[arap_shop_card_id],[acc_card_id],[salesman_id],[spe_code],[group_code],[security_code],[work_group_code],[spe_code1]
                    ,[spe_code2],[arap_lname],[arap_fname],[arap_mid_name],[arap_gender],[arap_birthdate],[arap_birthplace],[arap_nation]
                    ,[arap_social_ent],[arap_edu_level],[edu_l_id],[arap_acad_level],[arap_acad_name],[arap_army_capable],[arap_army_level]
                    ,[arap_army_category],[arap_army_type],[arap_party_member],[arap_tel_home],[arap_tel_work],[arap_tel_mobile1],[arap_tel_mobile2]
                    ,[arap_tel_fax],[arap_email1],[arap_email2],[arap_discount_perc],[arap_pasportno],[arap_city],[arap_country],[arap_postalcode]
                    ,[arap_region],[spe_code3],[spe_code4],[spe_code5],[spe_code6],[spe_code7],[spe_code8],[spe_code9],[spe_code10],[data_send]
                    ,[arap_long],[arap_lat],[div_id],[dept_id],[arap_balance_limit],[Pr_ID],[arap_payrol_type],[sync_datetime],[arap_id_guid]
             FROM [tbl_mg_arap]
             where arap_id=@arap_id
        ''';

          var result = await SqlConn.readData(query);
          if (result != null) {
            return GetResponseDataAsJson(data: result, message: '', status: 1, total: 0);
          }
        }
      } catch (e) {
        debugPrint("PrintError on QueryFromApi createDeviceTable.: ${e.toString()}");
        rethrow;
      }
    }
    return null;
  }
}
