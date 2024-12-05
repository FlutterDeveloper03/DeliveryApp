// ignore_for_file: use_build_context_synchronously, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:delivery_app/Helpers/localization.dart';
import 'package:delivery_app/bloc/OrdersPageBloc.dart';
import 'package:delivery_app/models/providerModel.dart';
import 'package:delivery_app/models/responseModels/resp_dk_order_inv.dart';
import 'package:delivery_app/models/responseModels/resp_dk_order_inv_status.dart';
import 'package:delivery_app/modules/qrScanModule.dart';

class OrdersPage extends StatefulWidget {
  final bool gridOrList;
  const OrdersPage({super.key, required this.gridOrList});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final _searchController = TextEditingController();
  final DateFormat _df = DateFormat('dd.MM.yyyy');
  final DateTime _rangeStartDate = DateTime.parse('2020-01-01');
  final DateTime _rangeEndDate = DateTime.parse('2030-31-12');

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final providerModel = Provider.of<ProviderModel>(context, listen: false);
    final trs = AppLocalizations.of(context);
    double height = MediaQuery.of(context).size.height;
    return
      RefreshIndicator(
      onRefresh: () async{
        context.read<OrdersPageBloc>().add(LoadOrdersEvent(providerModel.getOrdersStartDate, providerModel.getOrdersEndDate));
      },
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            collapsedHeight: height/10,
            expandedHeight: height/10,
            backgroundColor: Colors.white,
            flexibleSpace:  (height >= 550) ?
              Container(
                      height: height/10,
                      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
                      child: BlocBuilder<OrdersPageBloc, OrdersPageState>(
                        builder: (context, state) {
                          if (state is SearchingCompletedState) {
                            _searchController.text = state.getSearchedText;
                            _searchController.selection = TextSelection.fromPosition(
                              TextPosition(offset: _searchController.text.length),
                            );
                            return TextField(
                              controller: _searchController,
                              onChanged: (value) {
                                BlocProvider.of<OrdersPageBloc>(context).add(
                                  SearchOrdersEvent(
                                      Provider.of<ProviderModel>(context, listen: false).getOrders,
                                      value,
                                      providerModel.getOrdersStartDate, providerModel.getOrdersEndDate
                                  ),
                                );
                              },
                              onSubmitted: (value) {
                                BlocProvider.of<OrdersPageBloc>(context).add(
                                  SearchOrdersEvent(
                                      Provider.of<ProviderModel>(context, listen: false).getOrders,
                                      value,
                                      providerModel.getOrdersStartDate, providerModel.getOrdersEndDate
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
                                    BlocProvider.of<OrdersPageBloc>(context).add(
                                      SearchOrdersEvent(
                                          Provider.of<ProviderModel>(context, listen: false).getOrders,
                                          value,
                                          providerModel.getOrdersStartDate, providerModel.getOrdersEndDate
                                      ),
                                    );
                                  },
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                    BlocProvider.of<OrdersPageBloc>(context).add(
                                      SearchOrdersEvent(
                                          Provider.of<ProviderModel>(context, listen: false).getOrders,
                                          _searchController.text,
                                          providerModel.getOrdersStartDate, providerModel.getOrdersEndDate
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
                                BlocProvider.of<OrdersPageBloc>(context).add(
                                  SearchOrdersEvent(
                                      Provider.of<ProviderModel>(context, listen: false).getOrders,
                                      value,
                                      providerModel.getOrdersStartDate, providerModel.getOrdersEndDate
                                  ),
                                );
                              },
                              onSubmitted: (value) {
                                BlocProvider.of<OrdersPageBloc>(context).add(
                                  SearchOrdersEvent(
                                      Provider.of<ProviderModel>(context, listen: false).getOrders,
                                      value,
                                      providerModel.getOrdersStartDate, providerModel.getOrdersEndDate
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
                                    BlocProvider.of<OrdersPageBloc>(context).add(
                                      SearchOrdersEvent(
                                          Provider.of<ProviderModel>(context, listen: false).getOrders,
                                          value,
                                          providerModel.getOrdersStartDate, providerModel.getOrdersEndDate
                                      ),
                                    );
                                  },
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                    BlocProvider.of<OrdersPageBloc>(context).add(
                                      SearchOrdersEvent(
                                          Provider.of<ProviderModel>(context, listen: false).getOrders,
                                          _searchController.text,
                                          providerModel.getOrdersStartDate, providerModel.getOrdersEndDate
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () async {
                        DateTimeRange? dr = await showDateRangePicker(
                          context: context,
                          firstDate: _rangeStartDate,
                          lastDate: _rangeEndDate,
                          helpText: trs.translate('select_range_text') ?? 'Select range',
                          cancelText: trs.translate('close') ?? 'Close',
                          saveText: trs.translate('save') ?? 'Save',
                          errorFormatText: trs.translate('invalid_format_text') ?? 'Invalid format',
                          errorInvalidRangeText: trs.translate('error_invalid_range_text') ?? 'Out of range',
                          fieldStartLabelText: trs.translate('start_date_text') ?? 'Start date',
                          fieldEndLabelText: trs.translate('end_date_text') ?? 'End date',
                          locale: AppLocalizations.of(context).locale,
                        );
                        if (dr != null) {
                          providerModel.setOrdersStartDate = dr.start;
                          providerModel.setOrdersEndDate = dr.end;
                          context.read<OrdersPageBloc>().add(LoadOrdersEvent(dr.start, dr.end));
                        }
                      },
                      child: Ink(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    trs.translate('date_range') ?? 'Date range',
                                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.date_range),
                                      Text(
                                        '${_df.format(providerModel.getOrdersStartDate)}${trs.translate('date_ending') ?? 'y.'} - ${_df.format(providerModel.getOrdersEndDate)}${trs.translate('date_ending') ?? 'y.'}',
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 10, 5),
                      child: Icon(Icons.filter_alt),
                    ),
                  ],
                ),
              ),
            ),
          ),
          BlocConsumer<OrdersPageBloc, OrdersPageState>(
            listener: (BuildContext context, OrdersPageState state) {
              if(state is SearchingCompletedState){
                providerModel.setOrders = state.getOrdersList;
              }
              else if(state is OrdersLoadedState) {
                providerModel.setOrders = state.getOrdersList;
              }
              else if(state is OrdersEmptyState) {
                providerModel.setOrders = [];
              }
            },
            builder: (BuildContext context, OrdersPageState state) {
              if(state is OrdersLoadedState || state is SearchingCompletedState){
                List<Resp_dk_order_inv> orders = providerModel.getOrders;
                return SliverPadding(
                  padding: const EdgeInsets.only(left: 4.0, right: 2.0),
                  sliver: widget.gridOrList ? GridWidget(orders: orders) : ListWidget(orders: orders),
                );
              }
              else if (state is LoadingOrdersState){
                return const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }
              else if (state is OrdersEmptyState || state is SearchResultEmptyState) {
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
              else if (state is OrdersLoadErrorState) {
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
  final List<Resp_dk_order_inv> orders;
  const GridWidget({super.key, required this.orders});

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
                     return OrdersGridItem(order: orders[index]);
                  },
              childCount: orders.length,
            ),
            );
  }
}

class ListWidget extends StatelessWidget {
  final List<Resp_dk_order_inv> orders;
  const ListWidget({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return  SliverList(
            key: UniqueKey(),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return OrdersListItem(order: orders[index]);
                  },
              childCount: orders.length,
            ),
          );
        }
}

// === === === === === === === OrdersListItem  === === === === === === ===

class OrdersListItem extends StatelessWidget {
  final Resp_dk_order_inv order;
  const OrdersListItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final trs = AppLocalizations.of(context);
    final providerModel = Provider.of<ProviderModel>(context, listen: false);
    Resp_dk_order_inv_status orderStatus = providerModel.getOrderStatuses.firstWhere((element) => element.InvStatId==order.InvStatId);
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
                                      Text("${order.OInvFTotal.toStringAsFixed(2)} TMT", style: const TextStyle(fontSize: 12, color: Colors.green),)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time_filled,color: Theme.of(context).primaryColor, size: 20,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: Text(dateFormat.format(order.OInvDate ?? DateTime.now()), style: const TextStyle(fontSize: 12),),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time_filled,color: Theme.of(context).primaryColor, size: 20,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: Text(dateFormat.format(order.ModifiedDate ?? DateTime.now()), style: const TextStyle(fontSize: 12),),
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
                          (order.RpAcc != null && order.RpAcc!.RpAccName.isNotEmpty) ?
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              order.RpAcc?.RpAccName ?? '',
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
                                  child: (order.InvDelAddress.isNotEmpty) ?
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      order.InvDelAddress,
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
                                    order.InvDelPhone,
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
                              (order.OInvDesc.isNotEmpty) ?
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  order.OInvDesc,
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
          ],
        ),
      ),
    );
  }
}

// === === === === === === === OrdersGridItem  === === === === === === ===

class OrdersGridItem extends StatelessWidget {
  final Resp_dk_order_inv order;
  const OrdersGridItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final trs = AppLocalizations.of(context);
    final providerModel = Provider.of<ProviderModel>(context, listen: false);
    Resp_dk_order_inv_status orderStatus = providerModel.getOrderStatuses.firstWhere((element) => element.InvStatId==order.InvStatId);
    DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
    final double width = MediaQuery.of(context).size.width;
    return Padding(
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
                    (order.RpAcc != null && order.RpAcc!.RpAccName.isNotEmpty) ?
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        order.RpAcc?.RpAccName ?? '',
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
                                order.InvDelAddress,
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
                              order.InvDelPhone,
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
                            order.OInvDesc,
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
                        Text("${order.OInvFTotal.toStringAsFixed(2)} TMT", style: const TextStyle(fontSize: 12, color: Colors.green),)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time_filled,color: Theme.of(context).primaryColor, size: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(dateFormat.format(order.OInvDate ?? DateTime.now()), style: const TextStyle(fontSize: 12),),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time_filled,color: Theme.of(context).primaryColor, size: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(dateFormat.format(order.ModifiedDate ?? DateTime.now()), style: const TextStyle(fontSize: 12),),
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
    );
  }
}
