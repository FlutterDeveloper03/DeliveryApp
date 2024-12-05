// ignore_for_file: use_build_context_synchronously, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:delivery_app/Helpers/localization.dart';
import 'package:delivery_app/bloc/NewOrdersPageBloc.dart';
import 'package:delivery_app/models/providerModel.dart';
import 'package:delivery_app/models/responseModels/resp_dk_order_inv.dart';
import 'package:delivery_app/models/responseModels/resp_dk_order_inv_status.dart';
import 'package:delivery_app/modules/qrScanModule.dart';

class NewOrdersPage extends StatefulWidget {
  final bool gridOrList;
  const NewOrdersPage({super.key, required this.gridOrList});

  @override
  State<NewOrdersPage> createState() => _NewOrdersPageState();
}

class _NewOrdersPageState extends State<NewOrdersPage> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final trs = AppLocalizations.of(context);
    final providerModel = Provider.of<ProviderModel>(context, listen: false);
    double height = MediaQuery.of(context).size.height;
    return RefreshIndicator(
      onRefresh: () async{
        if(_searchController.text.isNotEmpty){
          context.read<NewOrdersPageBloc>().add(SearchNewOrdersEvent(providerModel.getNewOrders, _searchController.text));
        }
        else {
          context.read<NewOrdersPageBloc>().add(LoadNewOrdersEvent());
        }
      },
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            actions: const [SizedBox.shrink()],
            collapsedHeight: height/12,
            expandedHeight: height/12,
            backgroundColor: Colors.white,
            flexibleSpace:  (height >= 550) ?
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
              child: BlocBuilder<NewOrdersPageBloc, NewOrdersPageState>(
                builder: (context, state) {
                  if (state is SearchingNewOrdersCompletedState) {
                    _searchController.text = state.getSearchedText;
                    _searchController.selection = TextSelection.fromPosition(
                      TextPosition(offset: _searchController.text.length),
                    );
                    return TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        BlocProvider.of<NewOrdersPageBloc>(context).add(
                          SearchNewOrdersEvent(
                            Provider.of<ProviderModel>(context, listen: false).getNewOrders,
                            value
                          ),
                        );
                      },
                      onSubmitted: (value) {
                        BlocProvider.of<NewOrdersPageBloc>(context).add(
                          SearchNewOrdersEvent(
                            Provider.of<ProviderModel>(context, listen: false).getNewOrders,
                            value
                          ),
                        );
                      },
                      decoration: InputDecoration(
                        hintText: trs.translate('search_text_hint') ?? 'Search',
                        prefixIcon: IconButton(
                          icon: const Icon(Icons.qr_code_scanner),
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            String value = '';
                            try {
                              if (await Permission.camera.request().isGranted) {
                                value = await Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const QrViewWidget()),
                                );
                                debugPrint("Barcode value: $value");
                              }
                            } catch (e) {
                              value = '*Näbelli ýalňyşlyk: $e';
                            }
                            BlocProvider.of<NewOrdersPageBloc>(context).add(
                              SearchNewOrdersEvent(
                                Provider.of<ProviderModel>(context, listen: false).getNewOrders,
                                value
                              ),
                            );
                          },
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            BlocProvider.of<NewOrdersPageBloc>(context).add(
                              SearchNewOrdersEvent(
                                Provider.of<ProviderModel>(context, listen: false).getNewOrders,
                                _searchController.text
                              ),
                            );
                          },
                          icon: const Icon(Icons.search),
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                      ),
                    );
                  } else {
                    _searchController.selection = TextSelection.fromPosition(
                      TextPosition(offset: _searchController.text.length),
                    );
                    return TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        BlocProvider.of<NewOrdersPageBloc>(context).add(
                          SearchNewOrdersEvent(
                            Provider.of<ProviderModel>(context, listen: false).getNewOrders,
                            value
                          ),
                        );
                      },
                      onSubmitted: (value) {
                        BlocProvider.of<NewOrdersPageBloc>(context).add(
                          SearchNewOrdersEvent(
                            Provider.of<ProviderModel>(context, listen: false).getNewOrders,
                            value
                          ),
                        );
                      },
                      decoration: InputDecoration(
                        hintText: trs.translate('search_text_hint') ?? 'Search',
                        prefixIcon: IconButton(
                          icon: const Icon(Icons.qr_code_scanner),
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            String value = '';
                            try {
                              if (await Permission.camera.request().isGranted) {
                                value = await Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const QrViewWidget()),
                                );
                                debugPrint("Barcode value: $value");
                              }
                            } catch (e) {
                              value = '*Näbelli ýalňyşlyk: $e';
                            }
                            BlocProvider.of<NewOrdersPageBloc>(context).add(
                              SearchNewOrdersEvent(
                                Provider.of<ProviderModel>(context, listen: false).getNewOrders,
                                value
                              ),
                            );
                          },
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            BlocProvider.of<NewOrdersPageBloc>(context).add(
                              SearchNewOrdersEvent(
                                Provider.of<ProviderModel>(context, listen: false).getNewOrders,
                                _searchController.text
                              ),
                            );
                          },
                          icon: const Icon(Icons.search),
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                      ),
                    );
                  }
                },
              ),
            )
                : const SizedBox.shrink(),
          ),
          BlocConsumer<NewOrdersPageBloc, NewOrdersPageState>(
            listener: (BuildContext context, NewOrdersPageState state) {
              if(state is SearchingNewOrdersCompletedState){
                providerModel.setNewOrders = state.getOrdersList;
              }
              else if(state is NewOrdersLoadedState) {
                providerModel.setNewOrders = state.getOrdersList;
              }
              else if(state is NewOrdersSortedState) {
                providerModel.setNewOrders = state.sortedOrders;
                setState(() {
                  _searchController.text = '';
                });
              }
              else if(state is NewOrdersSortEmptyState) {
                setState(() {
                  _searchController.text = '';
                });
              }
              else if(state is NewOrdersSortErrorState) {
                setState(() {
                  _searchController.text = '';
                });
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(backgroundColor: Colors.deepOrangeAccent,
                        content: Text(trs.translate("error_text") ?? "Error"))
                );
              }
              else if(state is NewOrdersEmptyState) {
                providerModel.setNewOrders = [];
              }
            },
            builder: (BuildContext context, NewOrdersPageState state) {
              if(state is NewOrdersLoadedState || state is SearchingNewOrdersCompletedState || state is NewOrdersSortedState){
                List<Resp_dk_order_inv> newOrders = providerModel.getNewOrders;
                return SliverPadding(
                  padding: const EdgeInsets.only(left: 4.0, right: 2.0),
                  sliver: widget.gridOrList ? GridWidget(newOrders: newOrders) : ListWidget(newOrders: newOrders),
                );
              }
              else if (state is LoadingNewOrdersState){
                return const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }
              else if (state is NewOrdersEmptyState || state is SearchNewOrdersEmptyState || state is NewOrdersSortEmptyState) {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 1.75,
                    child: Center(
                      child: Text(
                        trs.translate('nothing_found_text') ?? "Nothing found",
                      ),
                    ),
                  ),
                );
              }
              else if (state is NewOrdersLoadErrorState) {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 1.75,
                    child: Center(
                      child: Text(
                        '${trs.translate('error_text') ?? "Error"}: ${state.errorText}',
                      ),
                    ),
                  ),
                );
              }
              else if (state is NewOrdersSearchErrorState) {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 1.75,
                    child: Center(
                      child: Text(
                        '${trs.translate('error_text') ?? "Error"}: ${state.errorText}',
                      ),
                    ),
                  ),
                );
              }
              else if (state is NewOrdersSortErrorState) {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 1.75,
                    child: Center(
                      child: Text(
                        '${trs.translate('error_text') ?? "Error"}: ${state.errorText}',
                      ),
                    ),
                  ),
                );
              }
              return const SliverToBoxAdapter(child: SizedBox.shrink());
            },
          )
        ],
      ),
    );
  }
}

class GridWidget extends StatelessWidget {
  final List<Resp_dk_order_inv> newOrders;
  const GridWidget({super.key, required this.newOrders});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      key: UniqueKey(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return NewOrdersGridItem(newOrder: newOrders[index]);
        },
        childCount: newOrders.length,
      ),
    );
  }
}

class ListWidget extends StatelessWidget {
  final List<Resp_dk_order_inv> newOrders;
  const ListWidget({super.key, required this.newOrders});

  @override
  Widget build(BuildContext context) {
    return  SliverList(
      key: UniqueKey(),
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return NewOrdersListItem(newOrder: newOrders[index]);
        },
        childCount: newOrders.length,
      ),
    );
  }
}

// === === === === === === === OrdersListItem  === === === === === === ===

class NewOrdersListItem extends StatelessWidget {
  final Resp_dk_order_inv newOrder;
  const NewOrdersListItem({super.key, required this.newOrder});

  @override
  Widget build(BuildContext context) {
    final trs = AppLocalizations.of(context);
    final providerModel = Provider.of<ProviderModel>(context, listen: false);
    Resp_dk_order_inv_status orderStatus = providerModel.getOrderStatuses.firstWhere((element) => element.InvStatId==newOrder.InvStatId);
    DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.all(4.0),
      child: AspectRatio(
        aspectRatio: 3 / 1,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 3.0,
                    color: Colors.grey.withOpacity(0.7),
                    offset: const Offset(0, 2),
                  ),
                ],
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: InkWell(
                onTap: () {
                  GoRouter.of(context).go('/ordersDetailPage', extra: newOrder);
                },
                child: Row(
                  children: [
                    // === === === === === Image Part === === === === ===
                    Expanded(
                      flex: 4,
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                width: width / 15,
                                height: height/ 30,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
                                  color: Color(0xffFFCC5F)
                                ),
                                child: Icon(Icons.share, color: Theme.of(context).primaryColor,size: 17,),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.check,color: Theme.of(context).primaryColor, size: 20,),
                                      Text(
                                        trs.locale.languageCode=='tk'? orderStatus.InvStatTmName
                                            :trs.locale.languageCode=='ru'? orderStatus.InvStatRuName
                                        : orderStatus.InvStatEnName, style: const TextStyle(fontSize: 12),)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.functions,color: Colors.red),
                                      Text("${newOrder.OInvFTotal.toStringAsFixed(2)} TMT", style: const TextStyle(fontSize: 12, color: Colors.green),)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time_filled,color: Theme.of(context).primaryColor, size: 20,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: Text(dateFormat.format(newOrder.OInvDate ?? DateTime.now()), style: const TextStyle(fontSize: 12),),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time_filled,color: Theme.of(context).primaryColor, size: 20,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: Text(dateFormat.format(newOrder.ModifiedDate ?? DateTime.now()), style: const TextStyle(fontSize: 12),),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: VerticalDivider(color: Color(0xffCACACA),thickness: 1.2,),
                    ),
                    // === === === === === Other Stuff === === === === ===
                    Expanded(
                      flex: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            (newOrder.RpAcc != null && newOrder.RpAcc!.RpAccName.isNotEmpty) ?
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                newOrder.RpAcc?.RpAccName ?? '',
                                style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            )
                            : const SizedBox.shrink(),
                            Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_on_sharp,
                                    color: Theme.of(context).primaryColor,
                                    size: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: (newOrder.InvDelAddress.isNotEmpty) ?
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        newOrder.InvDelAddress,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff6D6D6D),
                                        ),
                                      ),
                                    )
                                    : const SizedBox.shrink(),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: Theme.of(context).primaryColor,
                                    size: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      newOrder.InvDelPhone,
                                      style: const TextStyle(
                                        color: Color(0xff6D6D6D),
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${trs.translate('note') ?? 'Note'}: ",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff252525),
                                  ),
                                ),
                                (newOrder.OInvDesc.isNotEmpty) ?
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    newOrder.OInvDesc,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff6D6D6D),
                                    ),
                                  ),
                                ) : const SizedBox.shrink(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// === === === === === === === OrdersGridItem  === === === === === === ===

class NewOrdersGridItem extends StatelessWidget {
  final Resp_dk_order_inv newOrder;
  const NewOrdersGridItem({super.key, required this.newOrder});

  @override
  Widget build(BuildContext context) {
    final trs = AppLocalizations.of(context);
    final providerModel = Provider.of<ProviderModel>(context, listen: false);
    Resp_dk_order_inv_status orderStatus = providerModel.getOrderStatuses.firstWhere((element) => element.InvStatId==newOrder.InvStatId);
    DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
    final double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).go('/ordersDetailPage', extra: newOrder);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(1, 6, 4, 4),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                offset: const Offset(0.0, 2.0),
                blurRadius: 3.0,
              ),
            ],
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /////////////// Image //////////////
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      (newOrder.RpAcc != null && newOrder.RpAcc!.RpAccName.isNotEmpty) ?
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          newOrder.RpAcc?.RpAccName ?? '',
                          style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ) : const SizedBox.shrink(),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on_sharp,
                              color: Theme.of(context).primaryColor,
                              size: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: SizedBox(
                                width: width / 2.9,
                                child: Text(
                                  newOrder.InvDelAddress,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff6D6D6D),
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Theme.of(context).primaryColor,
                              size: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                newOrder.InvDelPhone,
                                style: const TextStyle(
                                  color: Color(0xff6D6D6D),
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${trs.translate('note') ?? 'Note'}: ",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xff252525),
                            ),
                          ),
                          SizedBox(
                            width: (trs.locale.languageCode=='ru') ?
                            MediaQuery.sizeOf(context).width /3.31
                            : MediaQuery.sizeOf(context).width /3,
                            child: Text(
                              newOrder.OInvDesc,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Color(0xff6D6D6D),
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(thickness: 1.2,),
              ),

              ////////////// Data ////////////////
              Expanded(
                flex: 4,
                child: Container(
                  // color: Colors.green,
                  padding: const EdgeInsets.fromLTRB(10.0, 2.0, 4.0, 2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.check,color: Theme.of(context).primaryColor, size: 20,),
                          Text(
                              trs.locale.languageCode=='tk'? orderStatus.InvStatTmName
                                  :trs.locale.languageCode=='ru'? orderStatus.InvStatRuName
                                  : orderStatus.InvStatEnName, style: const TextStyle(fontSize: 12),)
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.functions,color: Colors.red),
                          Text("${newOrder.OInvFTotal.toStringAsFixed(2)} TMT", style: const TextStyle(fontSize: 12, color: Colors.green),)
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.access_time_filled,color: Theme.of(context).primaryColor, size: 20,),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(dateFormat.format(newOrder.OInvDate ?? DateTime.now()), style: const TextStyle(fontSize: 12),),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.access_time_filled,color: Theme.of(context).primaryColor, size: 20,),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(dateFormat.format(newOrder.ModifiedDate ?? DateTime.now()), style: const TextStyle(fontSize: 12),),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
