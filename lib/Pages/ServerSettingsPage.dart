// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:delivery_app/Helpers/localization.dart';
import 'package:delivery_app/bloc/ServerSettingsBloc.dart';

class ServerSettingsPage extends StatelessWidget {
  const ServerSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ServerSettingsPageContent();
  }
}

class ServerSettingsPageContent extends StatefulWidget {
  const ServerSettingsPageContent({super.key});

  @override
  State<ServerSettingsPageContent> createState() => _ServerSettingsPageContentState();
}

class _ServerSettingsPageContentState extends State<ServerSettingsPageContent> {
  final TextEditingController _serverNameController = TextEditingController();

  final TextEditingController _serverUNameController = TextEditingController();

  final TextEditingController _serverUPassController = TextEditingController();

  final TextEditingController _dbNameController = TextEditingController();

  final TextEditingController _apiPrefixController = TextEditingController();

  bool? directConnectionMode;

  @override
  Widget build(BuildContext context) {
    final trs = AppLocalizations.of(context);
    return BlocListener<ServerSettingsBloc, ServerSettingsState>(
      listener: (context, state) {
        if (state is ServerSettingsSavedState) {
          Navigator.pop(context);
        }
      },
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          GoRouter.of(context).go('/configPage');
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text(trs.translate('server_settings') ?? 'Server settings'),
              automaticallyImplyLeading: false,
              leading: IconButton(onPressed: () => GoRouter.of(context).go('/configPage'),
                  icon: const Icon(Icons.arrow_back)),
              actions: [
               IconButton(
                          icon: const Icon(Icons.phone_android),
                          tooltip: trs.translate('register_phone_hint') ??
                              'Click to send register request',
                          onPressed: () {}
                          ),
                const VerticalDivider(),
                IconButton(
                    icon: const Icon(Icons.save),
                    tooltip: trs.translate('save') ?? 'Save',
                    onPressed: () {
                      BlocProvider.of<ServerSettingsBloc>(context).add(
                          SaveServerSettings(
                              _serverNameController.text,
                              _serverUNameController.text,
                              _serverUPassController.text,
                              _dbNameController.text,
                              _apiPrefixController.text,
                              (directConnectionMode==false) ? 1 : 2));
                    })
              ],
            ),
            body: BlocBuilder<ServerSettingsBloc, ServerSettingsState>(
              builder: (context, state) {
                if (state is LoadingServerSettingsState) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.white,),
                  );
                } else if (state is ServerSettingsSavedState) {
                  BlocProvider.of<ServerSettingsBloc>(context)
                      .add(LoadServerSettings());
                  return Container();
                } else if (state is ServerSettingsLoadedState) {
                  _serverNameController.text = state.serverName;
                  _serverUNameController.text = state.serverUName;
                  _serverUPassController.text = state.serverUPass;
                  _dbNameController.text = state.dbName;
                  _apiPrefixController.text = state.apiPrefix;
                  directConnectionMode??=(state.defaultConnectionMode==1) ? false : true;

                  return ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                trs.translate('device_id_text') ?? 'Device id:',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            Text(
                              state.deviceId,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
                        child: Text(
                          trs.translate('text_local') ?? 'Local:',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      ListTile(
                        leading: Radio(
                          value: true,
                          groupValue: directConnectionMode,
                          onChanged: (bool? value) {
                            setState(() {
                              directConnectionMode=value!;
                            });
                          },
                        ),
                        onTap: () {
                          setState(() {
                            directConnectionMode=true;
                          });
                        },
                        title: Text(
                          trs.translate('default_db_conn_mode') ?? 'Default connection mode',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
                        child: TextField(
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: trs.translate('server_name') ??
                                  'Server name'),
                          controller: _serverNameController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
                        child: TextField(
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: trs.translate('server_u_name') ??
                                  'User name'),
                          controller: _serverUNameController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
                        child: TextField(
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText:
                                  trs.translate('server_u_pass') ?? 'Password'),
                          controller: _serverUPassController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
                        child: TextField(
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: trs.translate('server_db_name') ??
                                  'Database name'),
                          controller: _dbNameController,
                        ),
                      ),
                      const Divider(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
                        child: Text(
                          trs.translate('text_online') ?? 'Online:',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),

                      ListTile(
                        leading: Radio(
                          value: false,
                          groupValue: directConnectionMode,
                          onChanged: (bool? value) {
                            setState(() {
                              directConnectionMode=value!;
                            });
                          },
                        ),
                        title: Text(
                          trs.translate('default_db_conn_mode') ?? 'Default connection mode',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            directConnectionMode=false;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
                        child: TextField(
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText:
                                  trs.translate('api_prefix') ?? 'Api prefix'),
                          controller: _apiPrefixController,
                        ),
                      ),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            )
        ),
      ),
    );
  }
}
