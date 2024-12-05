import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:delivery_app/Pages/ApiConfigPage.dart';
import 'package:delivery_app/Pages/ConfigPage.dart';
import 'package:delivery_app/Pages/InitPage.dart';
import 'package:delivery_app/Pages/LoginPage.dart';
import 'package:delivery_app/Pages/OrdersDetailPage.dart';
import 'package:delivery_app/Pages/OrdersInfoPage.dart';
import 'package:delivery_app/Pages/ServerSettingsPage.dart';
import 'package:delivery_app/Pages/SplashScreenPage.dart';
import 'package:delivery_app/Pages/UserConfigPage.dart';
import 'package:delivery_app/models/responseModels/resp_dk_order_inv.dart';
import 'package:delivery_app/modules/qrScanModule.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      name: "splashScreen",
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreenPage();
      },
      routes: [
        GoRoute(
            path: 'initPage',
            name: "initPage",
            builder: (BuildContext context, GoRouterState state) {
              int? bottomNavIndex= state.extra as int?;
              return InitPage(
                bottomNavIndex: bottomNavIndex,
              );
            },
        ),
        GoRoute(
          path: 'serverSettings',
          name:'serverSettings',
          builder: (BuildContext context, GoRouterState state) {
            return const ServerSettingsPage();
          },
        ),
        GoRoute(
          path: 'configPage',
          name:'configPage',
          builder: (BuildContext context, GoRouterState state) {
            return const ConfigPage();
          },
        ),
        GoRoute(
          path: 'loginPage',
          name:'loginPage',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginPage();
          },
        ),
        GoRoute(
          path: 'qrViewPage',
          name:'qrViewPage',
          builder: (BuildContext context, GoRouterState state) {
            return const QrViewWidget();
          },
        ),
        GoRoute(
          path: 'ordersDetailPage',
          name:'ordersDetailPage',
          builder: (BuildContext context, GoRouterState state) {
            Resp_dk_order_inv order= state.extra as Resp_dk_order_inv;
            return OrdersDetailPage(order: order);
          },
        ),
        GoRoute(
          path: 'ordersInfoPage',
          name:'ordersInfoPage',
          builder: (BuildContext context, GoRouterState state) {
            Resp_dk_order_inv order= state.extra as Resp_dk_order_inv;
            return OrdersInfoPage(order: order);
          },
        ),
        GoRoute(
          path: 'apiConfigPage',
          name:'apiConfigPage',
          builder: (BuildContext context, GoRouterState state) {
            return const ApiConfigPage();
          },
        ),
        GoRoute(
          path: 'userSettingsPage',
          name:'userSettingsPage',
          builder: (BuildContext context, GoRouterState state) {
            return const UserSettingsPage();
          },
        ),
      ]
    )
  ],
);