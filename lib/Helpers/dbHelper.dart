// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:delivery_app/models/Views/v_dk_resource.dart';
import 'package:delivery_app/models/model.dart';
import 'package:delivery_app/models/responseModels/resp_dk_res_category.dart';
import 'package:delivery_app/models/responseModels/resp_dk_res_price.dart';
import 'package:delivery_app/models/responseModels/resp_dk_res_totals.dart';
import 'package:delivery_app/models/tbl_dk_cart_item.dart';
import 'package:delivery_app/models/tbl_dk_res_category.dart';
import 'package:delivery_app/models/tbl_dk_res_price.dart';
import 'package:delivery_app/models/tbl_dk_res_total.dart';
import 'package:sqflite/sqflite.dart';

abstract class DbHelper {
  static const _dbName = "dbDeliveryApp.db";

  static get _dbVersion => 1;
  static Database? _db;

  static Future<void> init() async {
    if (_db != null) {
      return;
    }

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    debugPrint('Print Db Path is:$path');
    _db = await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  static Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE tbl_dk_config(
            ConfId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            ServerName String NULL,
            DbName String NULL,
            DbUName int NULL,
            DbUPass String NULL,
            ApiPrefix String NULL,
            AppLanguage String NULL,
            AddInf1 String NULL,
            AddInf2 String NULL,
            AddInf3 String NULL,
            AddInf4 String NULL,
            AddInf5 String NULL,
            AddInf6 String NULL
            )
          ''');
    await db.execute('''
          CREATE TABLE tbl_dk_company(
            CId int,
            CGuid String NULL,
            Wish String NULL,
            CName String NULL,
            CDesc String NULL,
            CFullName String NULL,
            CAddress String NULL,
            CAddressLegal String NULL,
            CLatitude float NULL,
            CLongitude float NULL,
            Phone1 String NULL,
            Phone2 String NULL,
            Phone3 String NULL,
            Phone4 String NULL,
            CPostalCode String NULL,
            WebAddress String NULL,
            CEmail String NULL,
            AddInf1 String NULL,
            AddInf2 String NULL,
            AddInf3 String NULL,
            AddInf4 String NULL,
            AddInf5 String NULL,
            AddInf6 String NULL,
            BankName String NULL,
            BankCorAcc String NULL,
            BankAccBik String NULL,
            AccInfName String NULL,
            AccInfDesc String NULL,
            AccInfNo String NULL,
            TaxAccInfName String NULL,
            TaxAccInfDesc String NULL,
            TaxAccInfNo String NULL,
            CreatedDate datetime NULL,
            ModifiedDate datetime NULL,
            SyncDateTime datetime NULL
          )
    ''');
    await db.execute('''
          CREATE TABLE tbl_dk_rp_acc(
            RpAccId int NOT NULL,
            RpAccGuid String NULL,
            UId int NULL,
            CId int NULL,
            DivId int NULL,
            EmpId int NULL,
            GenderId int NULL,
            RpAccStatusId int NULL,
            WpId int NULL,
            RpAccTypeId int NULL,
            ResPriceGroupId int NULL,
            RpAccRegNo nvarchar(100) NOT NULL,
            RpAccName nvarchar(255) NULL,
            RpAccAddress nvarchar(500) NULL,
            RpAccMobilePhoneNumber nvarchar(100) NULL,
            RpAccHomePhoneNumber nvarchar(100) NULL,
            RpAccWorkPhoneNumber nvarchar(100) NULL,
            RpAccWorkFaxNumber nvarchar(100) NULL,
            RpAccZipCode nvarchar(100) NULL,
            RpAccEMail nvarchar(100) NULL,
            RpAccSaleBalanceLimit float NULL,
            RpAccPurchBalanceLimit float NULL,
            RpAccTrTotBalance float NULL,
            AddInf1 nvarchar(500) NULL,
            AddInf2 nvarchar(500) NULL,
            AddInf3 nvarchar(500) NULL,
            AddInf4 nvarchar(500) NULL,
            AddInf5 nvarchar(500) NULL,
            AddInf6 nvarchar(500) NULL,
            RpAccUName nvarchar(100) NULL,
            RpAccUPass nvarchar(100) NULL,
            CreatedDate datetime NULL,
            ModifiedDate datetime NULL,
            SyncDateTime datetime NULL)
          ''');
    await db.execute('''
          CREATE TABLE tbl_dk_cart_item(
            CIId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            RpAccId int NULL,
            ResId int NULL,
            ResPriceGroupId int NULL,
            ResPriceValue REAL NULL,
            ResRegNo String NULL,
            ResPendingTotalAmount FLOAT NULL,
            ResTotBalance FLOAT NULL,
            ItemCount INT,
            ItemPriceTotal REAL
          )
          ''');
    await db.execute('''
          CREATE TABLE tbl_dk_mobile_order(
            OInvId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            OInvGuid String NULL,
            PtId INT NULL,
            PmId INT NULL,
            CurrencyId INT NULL,
            RpAccId INT NULL,
            UId INT NULL,
            RpAccGuid String NULL,
            PaymStatusId INT NULL,
            PaymCode String NULL,
            PaymDesc String NULL,
            OInvRegNo String NULL,
            OInvDesc String NULL,
            OInvDate datetime NULL,
            OInvTotal float NULL,
            OInvExpenseAmount float null,
            OInvTaxAmount float null,
            OInvDiscountAmount float null,
            OInvFTotal float null,
            OInvFTotalInWrite STRING NULL,
            OInvPaymAmount float null,
            OInvModifyCount int null,
            OInvPrintCount int null,
            OInvCreditDays int null,
            OInvCreditDesc STRING NULL,
            OInvLatitude float null,
            OInvLongitude float null,
            AddInf1 String NULL,
            AddInf2 String NULL,
            AddInf3 String NULL,
            AddInf4 String NULL,
            AddInf5 String NULL,
            AddInf6 String NULL,
            CreatedDate datetime null,
            ModifiedDate datetime null,
            SyncDateTime datetime null
          )
          ''');
    await db.execute('''
          CREATE TABLE tbl_dk_mobile_order_line(
            OInvLineId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            OInvId INT NULL,
            UnitId INT NULL,
            CurrencyId int NULL,
            ResId int NULL,
            ResGuid String NULL,
            ResName String NULL,
            OInvLineDesc String NULL,
            OInvLineAmount float NULL,
            ResPriceGroupId int NULL,
            OInvLinePrice float NULL,
            OInvLineTotal float NULL,
            OInvLineExpenseAmount float NULL,
            OInvLineTaxAmount float NULL,
            OInvLineDiscAmount float NULL,
            OInvLineFTotal float NULL,
            OInvLineDate datetime NULL,
            AddInf1 String null,
            AddInf2 String null,
            AddInf3 String null,
            AddInf4 String null,
            AddInf5 String null,
            AddInf6 String null,
            CreatedDate datetime null,
            ModifiedDate datetime null
          )
          ''');
    await db.execute('''
          CREATE TABLE tbl_dk_payment_types(
            PtId INTEGER NOT NULL,
            PtName String NULL,
            PtDesc String NULL,
            PtVisibleIndex int NULL,
            AddInf1 String NULL,
            AddInf2 String NULL,
            AddInf3 String NULL,
            AddInf4 String NULL,
            AddInf5 String NULL,
            AddInf6 String NULL,
            CreatedDate datetime NULL,
            ModifiedDate datetime NULL,
            CreatedUId int NULL,
            ModifiedUId int NULL,
            GCRecord int NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE tbl_dk_payment_methods(
            PmId INTEGER NOT NULL,
            PmName String NULL,
            PmDesc String NULL,
            PmVisibleIndex int NULL,
            AddInf1 String NULL,
            AddInf2 String NULL,
            AddInf3 String NULL,
            AddInf4 String NULL,
            AddInf5 String NULL,
            AddInf6 String NULL,
            CreatedDate datetime NULL,
            ModifiedDate datetime NULL,
            CreatedUId int NULL,
            ModifiedUId int NULL,
            GCRecord int NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE tbl_dk_resources(
            ResId INTEGER NOT NULL,
            ResGuid String NULL,
            ResCatId int NULL,
            UnitId int NULL,
            UnitName String NULL,
            BrandId int NULL,
            UsageStatusId int NULL,
            ResMainImgId int NULL,
            BarcodeVal String NULL,
            ResRegNo String NULL,
            ResName String NULL,
            ResDesc String NULL,
            ResFullDesc String NULL,
            ResPendingTotalAmount  float NULL,
            ResTotBalance float NULL,
            ResPriceValue float NULL,
            ResMinSaleAmount float NULL,
            ResMaxSaleAmount float NULL,
            ResMinSalePrice float NULL,
            ResMaxSalePrice float NULL,
            AddInf1 String NULL,
            AddInf2 String NULL,
            AddInf3 String NULL,
            AddInf4 String NULL,
            AddInf5 String NULL,
            AddInf6 String NULL,
            CreatedDate datetime NULL,
            ModifiedDate datetime NULL,
            SyncDateTime int NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE tbl_dk_barcode(
            BarcodeId INTEGER NOT NULL,
            BarcodeGuid String NULL,
            ResId int NULL,
            UnitId int NULL,
            BarcodeVal Text NULL,
            SyncDateTime datetime NULL
          )
    ''');

    await db.execute('''
          CREATE TABLE tbl_dk_res_price(
            ResPriceId INTEGER NOT NULL,
            ResPriceGroupId int NULL,
            UnitId int NULL,
            CurrencyId int NULL,
            ResId int NULL,
            ResPriceRegNo String NULL,
            ResPriceValue float NULL,
            PriceStartDate datetime NULL,
            PriceEndDate datetime NULL,
            CreatedDate datetime NULL,
            ModifiedDate datetime NULL,
            SyncDateTime datetime NULL
          )
    ''');
    await db.execute('''
          CREATE TABLE tbl_dk_res_total(
            ResTotId INTEGER NOT NULL,
            ResId int NULL,
            WhId int NULL,
            ResTotBalance float NULL,
            ResTotInAmount float NULL,
            ResPendingTotalAmount float NULL,
            ResTotOutAmount float NULL,
            CreatedDate datetime NULL,
            ModifiedDate datetime NULL,
            SyncDateTime datetime NULL
          )
    ''');
    await db.execute('''
          CREATE TABLE tbl_dk_res_price_group(
            ResPriceGroupId INTEGER NOT NULL,
            ResPriceGroupName String NULL,
            ResPriceGroupDesc String NULL,
            CreatedDate datetime NULL,
            ModifiedDate datetime NULL,
            SyncDateTime datetime NULL
          )
    ''');
    await db.execute('''
          CREATE TABLE tbl_dk_warehouse(
            WhId INTEGER NOT NULL,
            WhGuid String NULL,
            CId int NULL,
            DivId int NULL,
            WhName String NULL,
            CreatedDate datetime NULL,
            ModifiedDate datetime NULL,
            SyncDateTime datetime NULL
          )
    ''');
    await db.execute('''
          CREATE TABLE tbl_dk_brand(
            BrandId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            BrandName String NULL,
            BrandDesc String NULL,
            BrandVisibleIndex int NULL,
            IsMain int NULL,
            BrandLink1 String NULL,
            BrandLink2 String NULL,
            BrandLink3 String NULL,
            BrandLink4 String NULL,
            BrandLink5 String NULL,
            AddInf1 String NULL,
            AddInf2 String NULL,
            AddInf3 String NULL,
            AddInf4 String NULL,
            AddInf5 String NULL,
            AddInf6 String NULL,
            CreatedDate datetime NULL,
            ModifiedDate datetime NULL,
            SyncDateTime datetime NULL
            )
          ''');
    await db.execute('''
          CREATE TABLE tbl_dk_res_category(
            ResCatId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            ResOwnerCatId int NULL,
            ResCatVisibleIndex int NULL,
            IsMain int NULL,
            ResCatName String NULL,
            ResCatDesc String NULL,
            ResCatIconName String NULL,
            ResCatIconFilePath String NULL,
            ResCatIconData String NULL,
            CreatedDate datetime NULL,
            ModifiedDate datetime NULL,
            SyncDateTime datetime NULL
            )
          ''');
    await db.execute('''
          CREATE TABLE tbl_dk_user(
            UId INTEGER NOT NULL,
            UGuid String NULL,
            RpAccId int NULL,
            ResPriceGroupId int NULL,
            URegNo String NULL,
            UFullName String NULL,
            UName String NULL,
            UEmail String NULL,
            EmpId int NULL,
            UTypeId int NULL,
            AddInf1 String NULL,
            AddInf2 String NULL,
            AddInf3 String NULL,
            AddInf4 String NULL,
            AddInf5 String NULL,
            AddInf6 String NULL,
            CreatedDate datetime NULL,
            ModifiedDate datetime NULL,
            SyncDateTime datetime NULL
            )
          ''');
    await db.execute('''
          CREATE TABLE tbl_dk_image(
            ImgId INTEGER NOT NULL,
            ImgGuid String NULL,
            EmpId int NULL,
            BrandId int NULL,
            ResCatId int NULL,
            CId int NULL,
            UId int NULL,
            RpAccId int NULL,
            ProdId int NULL,
            ResId int NULL,
            FileName String NULL,
            FileHash String NULL,
            FilePath String NULL,
            Image Uint8List NULL,
            CreatedDate datetime NULL,
            ModifiedDate datetime NULL,
            SyncDateTime datetime NULL
            )
          ''');
    debugPrint('Print Database is created');
  }

  static Future<int?> rowCount(String table) async => Sqflite.firstIntValue(await _db!.rawQuery('Select Count(*) FROM $table'));

  static Future<List<Map<String, dynamic>>> queryAllRows(String table, {String where = ''}) async =>
      (where.isNotEmpty) ? await _db!.query(table, where: where) : await _db!.query(table);

  static Future<Map<String, dynamic>> queryFirstRow(String table, {String where = ''}) async {
    if (where.isNotEmpty) {
      List<Map<String, dynamic>> result = await _db!.query(table, where: where, limit: 1);
      if (result.isNotEmpty) return result[0];
      return {};
    }
    List<Map<String, dynamic>> result = await _db!.query(table, limit: 1);
    if (result.isNotEmpty) return result[0];
    return {};
  }

  static Future<List<VDkResource>> queryVResource(int resPriceGroupId, {bool loadNegativeWhQuantity = false}) async {
    try {
      debugPrint('Im here');
      if (resPriceGroupId>0){
        List<Map<String, dynamic>> result = await _db!.rawQuery(
            "SELECT  tbl_dk_resources.ResId,ResGuid,ResCatId,tbl_dk_resources.UnitId,UnitName,BrandId,tbl_dk_res_price.ResPriceGroupId, tbl_dk_res_price.ResPriceValue,tbl_dk_res_total.ResPendingTotalAmount,tbl_dk_res_total.ResTotBalance,UsageStatusId,ResMainImgId,BarcodeVal,ResRegNo,ResName,ResDesc,ResFullDesc,ResMinSaleAmount,ResMaxSaleAmount,ResMinSalePrice,ResMaxSalePrice,AddInf1,AddInf2,AddInf3,AddInf4,AddInf5,AddInf6 FROM tbl_dk_resources"
            " LEFT JOIN tbl_dk_res_price on tbl_dk_res_price.ResId=tbl_dk_resources.ResId and tbl_dk_res_price.ResPriceGroupId=$resPriceGroupId and tbl_dk_res_price.ResPriceValue>0"
           " LEFT JOIN (SELECT ResId,SUM(tbl_dk_res_total.ResTotBalance) as ResTotBalance,SUM(tbl_dk_res_total.ResPendingTotalAmount) as ResPendingTotalAmount from tbl_dk_res_total GROUP BY ResId) tbl_dk_res_total on tbl_dk_res_total.ResId=tbl_dk_resources.ResId"
           " where tbl_dk_res_price.ResPriceValue>0 ${(loadNegativeWhQuantity==true) ? '' : 'and tbl_dk_res_total.ResPendingTotalAmount>0'}");
          // " LEFT JOIN (SELECT ResId,SUM(ResTotBalance) as ResTotBalance,SUM(tbl_dk_res_total.ResPendingTotalAmount) as ResPendingTotalAmount from tbl_dk_res_total where WhId=2 GROUP BY ResId) tbl_dk_res_total on tbl_dk_res_total.ResId=tbl_dk_resources.ResId"
          // " WHERE tbl_dk_res_price.ResPriceValue>0 ${(loadNegativeWhQuantity==true) ? '' : 'and tbl_dk_res_total.ResPendingTotalAmount>0'} ");
        return result.map((e) => VDkResource.fromMap(e)).toList();
      } else {
        List<Map<String, dynamic>> result = await _db!.rawQuery(
            "SELECT  tbl_dk_resources.ResId,ResGuid,ResCatId,tbl_dk_resources.UnitId,UnitName,BrandId,tbl_dk_res_price.ResPriceGroupId, tbl_dk_res_price.ResPriceValue,tbl_dk_res_total.ResPendingTotalAmount,tbl_dk_res_total.ResTotBalance,UsageStatusId,ResMainImgId,BarcodeVal,ResRegNo,ResName,ResDesc,ResFullDesc,ResMinSaleAmount,ResMaxSaleAmount,ResMinSalePrice,ResMaxSalePrice,AddInf1,AddInf2,AddInf3,AddInf4,AddInf5,AddInf6 FROM tbl_dk_resources"
                " LEFT JOIN tbl_dk_res_price on tbl_dk_res_price.ResId=tbl_dk_resources.ResId"
                " LEFT JOIN (SELECT ResId,SUM(ResTotBalance) as ResTotBalance,SUM(tbl_dk_res_total.ResPendingTotalAmount) as ResPendingTotalAmount from tbl_dk_res_total GROUP BY ResId) tbl_dk_res_total on tbl_dk_res_total.ResId=tbl_dk_resources.ResId"
                " where tbl_dk_res_price.ResPriceValue>0 ${(loadNegativeWhQuantity==true) ? '' : 'and tbl_dk_res_total.ResPendingTotalAmount>0'}");
        // " LEFT JOIN (SELECT ResId,SUM(ResTotBalance) as ResTotBalance,SUM(tbl_dk_res_total.ResPendingTotalAmount) as ResPendingTotalAmount from tbl_dk_res_total where WhId=2 GROUP BY ResId) tbl_dk_res_total on tbl_dk_res_total.ResId=tbl_dk_resources.ResId"
        // " where tbl_dk_res_price.ResPriceValue>0 ${(loadNegativeWhQuantity==true) ? '' : 'and tbl_dk_res_total.ResPendingTotalAmount>0'}");
        return result.map((e) => VDkResource.fromMap(e)).toList();
      }

    } catch(e) {
      debugPrint("PrintError $e");
    }
    return [];
  }

  static Future<TblDkResTotal?> queryResTotal(String table, {String where = ''}) async {
    if (where.isNotEmpty) {
      List<Map<String, dynamic>> result = await _db!.query(table, where: where);
      if (result.isNotEmpty) {
        double totalAmount = 0;
        double pendingTotalAmount = 0;
        TblDkResTotal? resTot;
        for (Map<String, dynamic> resTotal in result) {
          resTot = TblDkResTotal.fromMap(resTotal);
          totalAmount += resTot.ResTotBalance;
          pendingTotalAmount += resTot.ResPendingTotalAmount;
        }
        TblDkResTotal total = TblDkResTotal(
            ResTotId: resTot!.ResTotId,
            ResId: resTot.ResId,
            WhId: resTot.WhId,
            ResTotBalance: totalAmount,
            ResTotInAmount: resTot.ResTotInAmount,
            ResPendingTotalAmount: pendingTotalAmount,
            ResTotOutAmount: resTot.ResTotOutAmount,
            CreatedDate: resTot.CreatedDate,
            ModifiedDate: resTot.ModifiedDate,
            SyncDateTime: resTot.SyncDateTime);
        return total;
      }
    }
    return null;
  }

  static Future<List<Map<String, dynamic>>> rawQueryImageNameAndGuid() async {
    return await _db!.rawQuery("Select ImgGuid,FileName from tbl_dk_image");
  }

  static Future<int> insert(String table, Model model) async => await _db!.insert(table, model.toMap());

  static Future<int> update(String table, String columnId, Model model) async =>
      await _db!.update(table, model.toMap(), where: '$columnId = ?', whereArgs: [model.toMap()[columnId]]);

  static Future<int> delete(String table, {String? where}) async => await _db!.delete(table, where: where);

  static Future<int> insertUpdateRowById(String table, Model model, String idColumnName, int id) async {
    try {
      int? count = Sqflite.firstIntValue(await _db!.rawQuery('SELECT COUNT(*) FROM $table WHERE $idColumnName=$id'));
      if (count != null && count > 0) {
        return _db!.update(table, model.toMap(), where: '$idColumnName=$id');
      }
      return await _db!.insert(table, model.toMap());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<int> insertUpdateRowByGuid(String table, Model model, String guidColumnName, String uGuid) async {
    try {
      int count = Sqflite.firstIntValue(await _db!.rawQuery('SELECT COUNT(*) FROM $table WHERE $guidColumnName=\'$uGuid\'')) ?? 0;
      if (count > 0) {
        return _db!.update(table, model.toMap(), where: '$guidColumnName=\'$uGuid\'');
      } else {
        return await _db!.insert(table, model.toMap());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<int> initTable(String tableName) async => await _db!.delete(tableName);

  static Future<int> deleteRowByGuid(String tableName, String guidColumnName, String guid) async =>
      await _db!.delete(tableName, where: '$guidColumnName=\'$guid\'');

  static Future<List<Map<String, dynamic>>> getRowByGuid(String tableName, String guidColumnName, String guid) async =>
      await _db!.query(tableName, where: '$guidColumnName=\'$guid\'');

  /////////////////////////////// Cart Items //////////////////////////////////
  static Future<int> insertCartItem(String table, Model model, int resId, int rpAccId) async {
    int count = Sqflite.firstIntValue(await _db!.rawQuery('SELECT COUNT(*) FROM tbl_dk_cart_item WHERE ResId=$resId and RpAccId=$rpAccId')) ?? 0;
    if (count > 0) {
      if ((model as TblDkCartItem).ItemCount == 0) {
        return _db!.delete(table, where: 'ResId=? and RpAccId=?', whereArgs: [resId, rpAccId]);
      }
      return _db!.update(table, model.toMap(), where: 'ResId= ? and RpAccId=?', whereArgs: [resId, rpAccId]);
    }
    return await _db!.insert(table, model.toMap());
  }

  static Future<int> initCartItems(int rpAccId) async => await _db!.delete('tbl_dk_cart_item', where: 'RpAccId=?', whereArgs: [rpAccId]);

  static Future<int> deleteCartItem(int resId, int rpAccId) async =>
      await _db!.delete('tbl_dk_cart_item', where: 'ResId = ? and RpAccId=?', whereArgs: [resId, rpAccId]);

  static Future<List<Map<String, dynamic>>> getCartItemsByRpAccId(int rpAccId) async =>
      await _db!.query('tbl_dk_cart_item', where: 'RpAccId=?', whereArgs: [rpAccId]);

  /////////////////// Payment methods & types ////////////////////
  static Future<int> insertPaymentMethod(String table, Model model, int pmId) async {
    int count = Sqflite.firstIntValue(await _db!.rawQuery('SELECT COUNT(*) from tbl_dk_payment_methods where PmId=$pmId')) ?? 0;
    if (count > 0) {
      return _db!.update(table, model.toMap(), where: 'PmId= ?', whereArgs: [pmId]);
    }
    return await _db!.insert(table, model.toMap());
  }

  static Future<int> initPaymentMethods() async => await _db!.delete('tbl_dk_payment_methods');

  static Future<int> deletePaymentMethod(int pmId) async => await _db!.delete('tbl_dk_payment_methods', where: 'PmId = ?', whereArgs: [pmId]);

  static Future<List<Map<String, dynamic>>> getPaymentMethods() async => await queryAllRows('tbl_dk_payment_methods');

  static Future<int> insertPaymentType(String table, Model model, int ptId) async {
    int count = Sqflite.firstIntValue(await _db!.rawQuery('SELECT COUNT(*) from tbl_dk_payment_types where PtId=$ptId')) ?? 0;
    if (count > 0) {
      return _db!.update(table, model.toMap(), where: 'PtId= ?', whereArgs: [ptId]);
    }
    return await _db!.insert(table, model.toMap());
  }

  static Future<int> initPaymentTypes() async => await _db!.delete('tbl_dk_payment_types');

  static Future<int> deletePaymentTyped(int ptId) async => await _db!.delete('tbl_dk_payment_types', where: 'PtId = ?', whereArgs: [ptId]);

  static Future<List<Map<String, dynamic>>> getPaymentTypes() async => await queryAllRows('tbl_dk_payment_types');

//////////////////////////////// tbl_dk_rp_acc //////////////////////////////////////////////////////
  static Future<int> insertRpAcc(String table, Model model, int rpAccId, String rpAccGuid) async {
    int count = Sqflite.firstIntValue(await _db!.rawQuery('SELECT COUNT(*) FROM tbl_dk_rp_acc WHERE RpAccGuid=\'$rpAccGuid\'')) ?? 0;
    if (count > 0) {
      return _db!.update(table, model.toMap(), where: 'RpAccGuid=\'$rpAccGuid\'');
    }
    return await _db!.insert(table, model.toMap());
  }

  static Future<int> insertUpdateCategoryByName(String table, Model model, String nameColumnName, String name, String idColumn) async {
    try {
      int id = Sqflite.firstIntValue(await _db!.rawQuery('SELECT $idColumn FROM $table WHERE $nameColumnName=\'$name\'')) ?? 0;
      if (id > 0) {
        return id;
      } else {
        return await _db!.insert(table, model.toMap());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<int> initRpAcc(int rpAccId) async => await _db!.delete('tbl_dk_cart_item');

  static Future<int> deleteRpAcc(String rpAccGuid) async => await _db!.delete('tbl_dk_rp_acc', where: 'RpAccGuid=\'$rpAccGuid\'');

  static Future<List<Map<String, dynamic>>> getRpAcc(int rpAccGuid) async =>
      await _db!.query('tbl_dk_rp_acc', where: 'RpAccGuid=\'$rpAccGuid\'');

  // static Future<int> insertRpAccList(String table, List<Resp_dk_user> respList) async {
  //   Batch batch = _db!.batch();
  //   await _db!.delete('tbl_dk_rp_acc');
  //   for (var model in respList) {
  //     try {
  //       TblDkRpAcc rpAcc = TblDkRpAcc(
  //         RpAccId: model.RpAccId,
  //         UId: model.UId,
  //         CId: model.CId,
  //         DivId: model.DivId,
  //         EmpId: model.EmpId,
  //         GenderId: model.GenderId,
  //         RpAccStatusId: model.RpAccStatusId,
  //         WpId: model.WpId,
  //         RpAccTypeId: model.RpAccTypeId,
  //         ResPriceGroupId: model.ResPriceGroupId,
  //         RpAccRegNo: model.RpAccRegNo,
  //         RpAccName: model.RpAccName,
  //         RpAccAddress: model.RpAccAddress,
  //         RpAccMobilePhoneNumber: model.RpAccMobilePhoneNumber,
  //         RpAccHomePhoneNumber: model.RpAccHomePhoneNumber,
  //         RpAccWorkPhoneNumber: model.RpAccWorkPhoneNumber,
  //         RpAccWorkFaxNumber: model.RpAccWorkFaxNumber,
  //         RpAccZipCode: model.RpAccZipCode,
  //         RpAccEMail: model.RpAccEMail,
  //         RpAccSaleBalanceLimit: model.RpAccSaleBalanceLimit,
  //         RpAccPurchBalanceLimit: model.RpAccPurchBalanceLimit,
  //         RpAccTrTotBalance: model.RpAccTrTotBalance,
  //         AddInf1: model.AddInf1,
  //         AddInf2: model.AddInf2,
  //         AddInf3: model.AddInf3,
  //         AddInf4: model.AddInf4,
  //         AddInf5: model.AddInf5,
  //         AddInf6: model.AddInf6,
  //         RpAccUName: model.RpAccUName,
  //         RpAccUPass: model.RpAccUPass,
  //         CreatedDate: model.CreatedDate,
  //         ModifiedDate: model.ModifiedDate,
  //         SyncDateTime: model.SyncDateTime,
  //       );
  //       batch.insert(table, rpAcc.toMap());
  //     } catch (e) {
  //       throw Exception(e.toString());
  //     }
  //   }
  //
  //   try {
  //     await batch.commit();
  //     return respList.length;
  //   } on Exception catch (_) {
  //     return 0;
  //   }
  // }

  //////////////////////////////// tbl_dk_config //////////////////////////////////////////////////////
  static Future<int> insertConfig(Model model) async {
    await _db!.delete('tbl_dk_config');
    return await _db!.insert('tbl_dk_config', model.toMap());
  }

  static Future<Map<String, dynamic>?> getConfig() async {
    List<Map<String, dynamic>> maps = await _db!.query('tbl_dk_config');
    if (maps.isNotEmpty) {
      return maps.first;
    } else {
      return null;
    }
  }

//region /////////////////////////// tbl_dk_order /////////////////////

  static Future<int> rawUpdateOrderSyncDateTime(int orderId, DateTime datetime) async {
    int cnt =
        await _db!.rawUpdate('UPDATE tbl_dk_mobile_order SET SyncDateTime = ? WHERE OInvId=?', [datetime.millisecondsSinceEpoch, orderId]);
    return cnt;
  }

//endregion /////////////////////// tbl_dk_order /////////////////////

//region ////////////////ResCategories/////////////////////////////////

  static Future<int> insertCategoryList(String table, List<Resp_dk_res_category> categoryList, String serverAddress, int requestType) async {
    Batch batch = _db!.batch();
    await _db!.delete(table);
    for (Resp_dk_res_category model in categoryList) {
      try {
        String base64Image = "";
        if (model.ResCatIconFilePath.isNotEmpty) {
          Uri uri = (requestType == 1) ? Uri.http(serverAddress, model.ResCatIconFilePath) : Uri.https(serverAddress, model.ResCatIconFilePath);
          http.Response response = await http.get(uri);
          Uint8List bytes = response.bodyBytes;
          base64Image = base64Encode(bytes);
        }

        TblDkResCategory resCategory = TblDkResCategory(
          ResCatId: model.ResCatId,
          ResOwnerCatId: model.ResOwnerCatId,
          ResCatVisibleIndex: model.ResCatVisibleIndex,
          IsMain: (model.IsMain) ? 1 : 0,
          ResCatName: model.ResCatName,
          ResCatDesc: model.ResCatDesc,
          ResCatIconName: model.ResCatIconName,
          ResCatIconFilePath: model.ResCatIconFilePath,
          ResCatIconData: base64Image,
          CreatedDate: model.CreatedDate,
          ModifiedDate: model.ModifiedDate,
          SyncDateTime: model.SyncDateTime,
        );
        batch.insert(table, resCategory.toMap());
      } catch (e) {
        throw Exception(e.toString());
      }
    }

    try {
      await batch.commit();
      return categoryList.length;
    } on Exception catch (_) {
      return 0;
    }
  }

//endregion ResCategories

//region //////////////////ResPrices///////////////////////////////////

  static Future<int> insertResPricesList(String table, List<RespDkResPrice> resPricesList) async {
    Batch batch = _db!.batch();
    await _db!.delete(table);
    for (RespDkResPrice model in resPricesList) {
      try {
        TblDkResPrice resPrices = TblDkResPrice(
          ResPriceId: model.ResPriceId,
          ResPriceGroupId: model.ResPriceGroupId,
          UnitId: model.ResUnitId,
          CurrencyId: model.CurrencyId,
          ResId: model.ResId,
          ResPriceRegNo: model.ResPriceRegNo,
          ResPriceValue: model.ResPriceValue,
          PriceStartDate: model.PriceStartDate,
          PriceEndDate: model.PriceEndDate,
          CreatedDate: model.CreatedDate,
          ModifiedDate: model.ModifiedDate,
          SyncDateTime: model.SyncDateTime,
        );
        batch.insert(table, resPrices.toMap());
      } catch (e) {
        throw Exception(e.toString());
      }
    }

    try {
      await batch.commit();
      return resPricesList.length;
    } on Exception catch (_) {
      return 0;
    }
  }

//endregion ResPrices

//region ///////////////tbl_dk_res_total///////////////////////////////

  static Future<int> insertResTotalsList(String table, List<RespDkResTotals> resTotalsList) async {
    Batch batch = _db!.batch();
    await _db!.delete(table);
    for (RespDkResTotals model in resTotalsList) {
      try {
        TblDkResTotal resTotal = TblDkResTotal(
          ResTotId: model.ResTotId,
          ResId: model.ResId,
          WhId: model.WhId,
          ResTotBalance: model.ResTotBalance,
          ResTotInAmount: model.ResTotInAmount,
          ResPendingTotalAmount: model.ResPendingTotalAmount,
          ResTotOutAmount: model.ResTotOutAmount,
          CreatedDate: model.CreatedDate,
          ModifiedDate: model.ModifiedDate,
          SyncDateTime: model.SyncDateTime,
        );
        batch.insert(table, resTotal.toMap());
      } catch (e) {
        throw Exception(e.toString());
      }
    }

    try {
      await batch.commit();
      return resTotalsList.length;
    } on Exception catch (_) {
      return 0;
    }
  }

  static Future<int> rawUpdateResTotal(double resPendingTotalAmount, int resId) async {
    int cnt = await _db!.rawUpdate('UPDATE tbl_dk_res_total SET ResPendingTotalAmount = ? WHERE ResId=?', [resPendingTotalAmount, resId]);
    return cnt;
  }
//endregion tbl_dk_res_total
}
