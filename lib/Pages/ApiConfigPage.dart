// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:delivery_app/Helpers/localization.dart';
import 'package:delivery_app/bloc/GlobalConfigBloc.dart';
import 'package:delivery_app/models/providerModel.dart';

class ApiConfigPage extends StatefulWidget {
  const ApiConfigPage({super.key});

  @override
  State<ApiConfigPage> createState() => _ApiConfigPageState();
}

class _ApiConfigPageState extends State<ApiConfigPage> {
  bool canChange = true;
  bool canDelete = true;

  @override
  Widget build(BuildContext context) {
    final trs = AppLocalizations.of(context);
    final providerModel = Provider.of<ProviderModel>(context);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        GoRouter.of(context).go('/configPage');
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(trs.translate('system_config_text') ?? 'System config'),
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () => GoRouter.of(context).go('/configPage'),
              icon: const Icon(Icons.arrow_back)),
          actions: [
            IconButton(
                icon: const Icon(Icons.refresh),
                tooltip: trs.translate('refresh_text') ?? 'Refresh',
                onPressed: () {
                  BlocProvider.of<GlobalConfigBloc>(context)
                      .add(LoadGlobalConfigEvent());
                })
          ],
        ),
        body: BlocConsumer<GlobalConfigBloc, GlobalConfigState>(
          listener: (context, state) {
            if (state is GlobalConfigInitialState) {
              BlocProvider.of<GlobalConfigBloc>(context)
                  .add(LoadGlobalConfigEvent());
            } else if (state is GlobalConfigLoadedState) {
              providerModel.setApiConfig = state.config;
            } else if (state is GlobalConfigLoadErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errorStr),
              ));
            }
          },
          builder: (context, state) {
            if (state is LoadingGlobalConfigState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView(
                children: [
                  // ListTile(
                  //   onTap: () {},
                  //   title: Text(trs.translate('order_on_empty') ?? "Can order on negative stock"),
                  //   subtitle: Text((providerModel.getApiConfig.NEGATIVE_WH_QTY_ORDER) ? trs.translate('yes_text') ?? 'Yes' : trs.translate("no_text") ?? 'No'),
                  //   trailing: (providerModel.getApiConfig.NEGATIVE_WH_QTY_ORDER) ? Icon(
                  //     Icons.check_box,
                  //     color: Theme.of(context).primaryColor,
                  //     size: 30,
                  //   ) : const Icon(
                  //     Icons.check_box_outline_blank,
                  //     color: Colors.grey,
                  //     size: 30,
                  //   ),
                  // ),
                  ListTile(
                    onTap: () {
                      setState(() {
                        canChange = !canChange;
                      });
                    },
                    title: Text(trs.translate('change_order_number') ?? "Change the number of items in an order"),
                    subtitle: Text((canChange)
                        ? trs.translate('yes_text') ?? 'Yes'
                        : trs.translate("no_text") ?? 'No'),
                    trailing: (canChange)
                        ? Icon(
                            Icons.check_box,
                            color: Theme.of(context).primaryColor,
                            size: 30,
                          )
                        : const Icon(
                            Icons.check_box_outline_blank,
                            color: Colors.grey,
                            size: 30,
                          ),
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {
                        canDelete = !canDelete;
                      });
                    },
                    title: Text(trs.translate('delete_order_lines') ?? "Delete the products of an order"),
                    subtitle: Text((canDelete)
                        ? trs.translate('yes_text') ?? 'Yes'
                        : trs.translate("no_text") ?? 'No'),
                    trailing: (canDelete)
                        ? Icon(
                            Icons.check_box,
                            color: Theme.of(context).primaryColor,
                            size: 30,
                          )
                        : const Icon(
                            Icons.check_box_outline_blank,
                            color: Colors.grey,
                            size: 30,
                          ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}



