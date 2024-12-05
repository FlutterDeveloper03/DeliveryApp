// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:delivery_app/Helpers/enums.dart';
import 'package:delivery_app/Helpers/localization.dart';
import 'package:delivery_app/bloc/OrdersInfoPageBloc.dart';
import 'package:delivery_app/bloc/SplashScreenPageCubit.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  SplashScreenPState createState() => SplashScreenPState();
}

class SplashScreenPState extends State<SplashScreenPage> with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  //Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    if (_controller != null) _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final trs = AppLocalizations.of(context);
    Orientation orientation = MediaQuery.of(context).orientation;
    final double height = MediaQuery.of(context).size.height;
    final double fontSize = height >= 550 ? 14 : MediaQuery.sizeOf(context).width / 70;
    if (_controller != null) _controller?.forward();
    return Scaffold(
      body: BlocConsumer<SplashScreenPageCubit, SplashScreenPageState>(listener: (context, state) {
        if (state is SplashScreenPageInitial || state is SplashScreenPageErrorState) {
          context.read<SplashScreenPageCubit>().loadSplashScreenPage();
        } else if (state is ServerSettingsEmptyState) {
          GoRouter.of(context).go('/serverSettings');
        } else if (state is SplashScreenPageLoadedState) {
          context.read<OrdersInfoPageBloc>().add(LoadOrderStatusesEvent());
          GoRouter.of(context).go('/loginPage');
        }
      }, builder: (context, state) {
        if (state is LoadingSplashScreenPageData) {
          return (orientation == Orientation.landscape)
              ? Stack(children: [
            Container(
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: AssetImage("assets/images/delivery.gif"),
                  fit: BoxFit.contain,
                ),
              ),
              alignment: const Alignment(0.3, 0.2),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      "DELIVERY",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 60,
                        color: Colors.yellow,
                      ),
                    ),
                    Text("APP",
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 60,
                          color: Colors.white,
                        ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 15,
              child: ListView(
                children: [
                  _widget(trs.translate('loading_data_from_db') ?? 'Loading data from DB', state.loadingData, fontSize),
                  _widget(trs.translate('check_settings') ?? 'Checking settings', state.settings, fontSize)
                ],
              ),
            )
          ])
              : Stack(children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: AssetImage("assets/images/delivery.gif"),
                  fit: BoxFit.contain,
                ),
              ),
              alignment: const Alignment(0, 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width/1.1,
                height: MediaQuery.of(context).size.height/3.2,
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Expanded(
                        child: Text("DELIVERY",
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 60,
                              color: Colors.yellow,
                            )),
                      ),
                      Expanded(
                        child: Text("APP",
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 60,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.clip),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 15,
              child: SizedBox(
                width: MediaQuery.of(context).size.width/1.2,
                height: MediaQuery.of(context).size.height/4,
                child: ListView(
                  children: [
                    _widget(trs.translate('loading_data_from_db') ?? 'Loading data from DB', state.loadingData, fontSize),
                    _widget(trs.translate('check_settings') ?? 'Checking settings', state.settings, fontSize)
                  ],
                ),
              ),
            )
          ]);
        }
        return const SizedBox.shrink();
      }),
    );
  }

  Widget _widget(String text, Status status, double fontSize) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(text, style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: fontSize, color: Colors.yellow)),
            ),
          ),
          setStatus(status)
        ],
      ),
    );
  }

  Widget setStatus(Status status) {
    Widget widget = const SizedBox.shrink();
    switch (status) {
      case Status.initial:
        widget = const SizedBox.shrink();
        break;
      case Status.progress:
        widget = const SizedBox(
          height: 18.0,
          width: 18.0,
          child: CircularProgressIndicator(),
        );
        break;
      case Status.completed:
        widget = const Icon(
          Icons.check,
          color: Colors.green,
        );
        break;
      case Status.failed:
        widget = const Icon(
          Icons.close,
          color: Colors.red,
        );
        break;
      default:
        widget = const SizedBox.shrink();
    }
    return widget;
  }
}
