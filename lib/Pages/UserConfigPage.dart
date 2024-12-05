// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:delivery_app/Helpers/localization.dart';
import 'package:delivery_app/bloc/UserConfigPageBloc.dart';
import 'package:delivery_app/models/providerModel.dart';
import 'package:delivery_app/models/tbl_dk_res_price_group.dart';

class UserSettingsPage extends StatelessWidget {
  const UserSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final trs = AppLocalizations.of(context);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        GoRouter.of(context).go('/configPage');
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(trs.translate('user_settings') ?? "User settings"),
          automaticallyImplyLeading: false,
          leading: IconButton(onPressed: () => GoRouter.of(context).go('/configPage'),
              icon: const Icon(Icons.arrow_back)),
        ),
        body: BlocBuilder<UserConfigPageBloc, UserConfigPageState>(
          builder: (context, state) {
            if (state is LoadingUserConfigPageState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UserConfigPageLoadedState) {
              return Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          color: Colors.grey.shade200,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 15, 8, 8.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.sell,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                Text(
                                    trs.translate('price_groups') ?? "Price groups"),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 8, 8, 1),
                          child: DropdownButton<TblDkResPriceGroup>(
                              isExpanded: true,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Theme.of(context).primaryColor,
                              ),
                              iconSize: 30,
                              hint: Text(trs.translate('choose_price_group') ??
                                  "Choose price group"),
                              value: (state.getPriceGroupId>0) ? state.getPriceGroups.firstWhere((element) => element.ResPriceGroupId == state.getPriceGroupId) : state.getPriceGroups.first,
                              onChanged: (TblDkResPriceGroup? value) {
                                // BlocProvider.of<SettingsBloc>(context).add(SaveSettings(ResPriceGroupId: value?.ResPriceGroupId ?? 0));
                                // BlocProvider.of<UserConfigPageBloc>(context).add(LoadUserConfigPageEvent());
                                Provider.of<ProviderModel>(context,listen: false).setResPriceGroupId=value?.ResPriceGroupId ?? 0;
                              },
                              items: state.getPriceGroups
                                  .map((e) => DropdownMenuItem<TblDkResPriceGroup>(
                                value: e,
                                child: Text(e.ResPriceGroupName.toString()),
                              ))
                                  .toList()),
                        ),

                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
