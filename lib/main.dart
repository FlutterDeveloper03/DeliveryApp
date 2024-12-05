import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delivery_app/bloc/AuthBloc.dart';
import 'package:delivery_app/bloc/ConfigPageBloc.dart';
import 'package:delivery_app/bloc/GlobalConfigBloc.dart';
import 'package:delivery_app/bloc/NewOrdersPageBloc.dart';
import 'package:delivery_app/bloc/OrdersInfoPageBloc.dart';
import 'package:delivery_app/bloc/OrdersPageBloc.dart';
import 'package:delivery_app/bloc/ServerSettingsBloc.dart';
import 'package:delivery_app/bloc/SplashScreenPageCubit.dart';
import 'package:delivery_app/bloc/UserConfigPageBloc.dart';
import 'package:delivery_app/routes.dart';
import 'package:delivery_app/services/services.dart';
import 'Helpers/localization.dart';
import 'bloc/LanguageBloc.dart';
import 'models/providerModel.dart';


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  };
  HttpOverrides.global=MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider<ProviderModel>(
      key: UniqueKey(),
      create: (context) => ProviderModel(),
      child: MultiBlocProvider(providers: [
        BlocProvider(
          create: (_) => LanguageBloc()..add(LanguageLoadStarted()),
        ),
        BlocProvider(
          create: (_) => ConfigPageBloc()..add(LoadConfigPageEvent()),
        ),
        BlocProvider(
          create: (_) => ServerSettingsBloc()..add(LoadServerSettings()),
        ),
        BlocProvider(
          create: (context) => OrdersPageBloc(Services(), Provider.of<ProviderModel>(context, listen: false)),
        ),
        BlocProvider(
          create: (context)=>GlobalConfigBloc()..add(LoadGlobalConfigEvent()),
        ),
        BlocProvider(
          create: (context) => AuthBloc(Services(), Provider.of<ProviderModel>(context, listen: false)),
        ),
        BlocProvider(
            create: (_) => SplashScreenPageCubit()..loadSplashScreenPage()
        ),
        BlocProvider(
          create: (context) => NewOrdersPageBloc(Services(), Provider.of<ProviderModel>(context, listen: false)),
        ),
        BlocProvider(
          create: (context) => OrdersInfoPageBloc(Services(), Provider.of<ProviderModel>(context, listen: false)),
        ),
        BlocProvider(
            create: (_) => UserConfigPageBloc()..add(LoadUserConfigPageEvent())
        ),
      ], child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, languageState) {
          return MaterialApp.router(
            theme: ThemeData(
              useMaterial3: false,
              primaryColor: const Color(0xFF005E6A),
              colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFFEBF0FF),primary:const Color(0xFF005E6A)),
              appBarTheme: const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: Brightness.dark)),
            ),
            locale: languageState.locale,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              TkMaterialLocalizations.delegate,
              AppLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ru', 'RU'),
              Locale('tk', 'TM'),
            ],
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
            routerDelegate: router.routerDelegate,
          );
        });
  }
}
