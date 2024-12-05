// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:delivery_app/Helpers/localization.dart';
import 'package:delivery_app/bloc/ConfigPageBloc.dart';
import 'package:delivery_app/bloc/LanguageBloc.dart';
import 'package:delivery_app/models/appLanguage.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    final trs = AppLocalizations.of(context);

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop){
        GoRouter.of(context).go('/initPage');
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(onPressed: () => GoRouter.of(context).go('/initPage'),
              icon: const Icon(Icons.arrow_back)),
          title: Text(trs.translate('settings') ?? "Settings"),
        ),
        body: BlocBuilder<ConfigPageBloc, ConfigPageState>(
          builder: (context, state) {
            if (state is LoadingConfigPageState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ConfigPageLoadedState) {
              return ListView(
                children: [
                  ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.person_outline_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(trs.translate('Profile') ?? "User profile"),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Theme.of(context).primaryColor,
                      size: 30,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.settings_applications_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    onTap: () {
                      GoRouter.of(context).go('/apiConfigPage');
                    },
                    title: Text(
                        trs.translate('system_config_text') ?? "System configurations"),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Theme.of(context).primaryColor,
                      size: 30,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.person_pin_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    onTap: () {
                      GoRouter.of(context).go('/userSettingsPage');
                    },
                    title: Text(
                        trs.translate('user_settings') ?? "User settings"),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Theme.of(context).primaryColor,
                      size: 30,
                    ),
                  ),
                  Container(
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 15, 8, 8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.language,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Text(
                              trs.translate('UiLanguage') ?? "UI language"),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 8, 8, 1),
                    child: DropdownButton<AppLanguage>(
                        isExpanded: true,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Theme.of(context).primaryColor,
                        ),
                        iconSize: 30,
                        hint: Text(trs.translate('choose_language') ??
                            "Choose language"),
                        value: state.getAppLanguages.firstWhere((element) =>
                            element.langCode ==
                            (BlocProvider.of<LanguageBloc>(context).state)
                                .locale
                                .languageCode),
                        onChanged: (AppLanguage? value) =>
                            BlocProvider.of<LanguageBloc>(context).add(
                                LanguageSelected(value?.langCode ?? "tk")),
                        items: state.getAppLanguages
                            .map((e) => DropdownMenuItem<AppLanguage>(
                                  value: e,
                                  child: Text(e.langName.toString()),
                                ))
                            .toList()),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.system_security_update_good_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(trs.translate('version') ?? "App version"),
                    trailing: Text(state.getAppVersion),
                  ),
                  const Divider(
                    height: 1,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.perm_data_setting_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    onTap: () {
                      GoRouter.of(context).go('/serverSettings');
                    },
                    title: Text(trs.translate('server_settings') ??
                        "Server settings"),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Theme.of(context).primaryColor,
                      size: 30,
                    ),
                  ),
                  const Divider(
                    height: 1,
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
