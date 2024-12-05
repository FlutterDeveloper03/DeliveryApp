// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:delivery_app/Helpers/localization.dart';
import 'package:delivery_app/bloc/NewOrdersPageBloc.dart';
import 'package:delivery_app/bloc/OrdersInfoPageBloc.dart';
import 'package:delivery_app/models/providerModel.dart';
import 'package:delivery_app/models/responseModels/resp_dk_order_inv.dart';
import 'package:delivery_app/models/responseModels/resp_dk_order_inv_status.dart';

class OrdersInfoPage extends StatefulWidget {
  final Resp_dk_order_inv order;
  const OrdersInfoPage({super.key, required this.order});

  @override
  State<OrdersInfoPage> createState() => _OrdersInfoPageState();
}

class _OrdersInfoPageState extends State<OrdersInfoPage> {
  String groupValue = "Waiting";

  void onChanged(String? value){
    setState(() {
      groupValue = value!;
    });
  }

  // void setGroupValue(){
  //   final providerModel = Provider.of<ProviderModel>(context, listen: false);
  //   groupValue = providerModel.getOrderStatuses.firstWhere((element) => element.InvStatId==widget.order.InvStatId).InvStatEnName;
  // }
  //
  // @override
  // void initState() {
  //   setGroupValue();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final trs = AppLocalizations.of(context);
    final providerModel = Provider.of<ProviderModel>(context);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        GoRouter.of(context).go('/ordersDetailPage', extra: widget.order);
      },
      child: BlocListener<OrdersInfoPageBloc, OrdersInfoPageState>(
        listener: (BuildContext context, OrdersInfoPageState state) {
          if(state is OrderStatusChangedState) {
            GoRouter.of(context).go('/initPage', extra: 0);
            context.read<NewOrdersPageBloc>().add(LoadNewOrdersEvent());
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(backgroundColor: Colors.greenAccent,
                    content: Text(state.orderStatusResponse.messages.first))
            );
          }
          else if(state is OrderStatusChangeErrorState){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(backgroundColor: Colors.deepOrangeAccent,
                    content: Text("${trs.translate("error_text") ?? "Error"}: ${state.errorText}"))
            );
          }
          else if(state is OrderStatusesLoadedState) {
            providerModel.setOrderStatuses = state.getOrderStatusesList;
          }
          else if(state is OrderStatusesEmptyState || state is OrderStatusesLoadErrorState) {
            providerModel.setOrderStatuses = [];
            context.read<OrdersInfoPageBloc>().add(LoadOrderStatusesEvent());
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(trs.translate('order_data') ?? "Order data"),
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).primaryColor,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
            ),
            leading: IconButton(
              onPressed: () => GoRouter.of(context).go('/ordersDetailPage', extra: widget.order),
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          body: (providerModel.getOrderStatuses.isNotEmpty) ?
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 1.3,
            child: ListView.builder(
              itemCount: providerModel.getOrderStatuses.length,
              itemBuilder: (context, index) {
                return OrdersInfoItem(
                  value: providerModel.getOrderStatuses[index].InvStatEnName,
                  orderStatus: providerModel.getOrderStatuses[index],
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value!;
                    });
                  },
                );
              },
            ),
          )
          : SizedBox(
            height: MediaQuery.of(context).size.height / 1.75,
            child: Center(
              child: Text(
                trs.translate('nothing_found_text') ?? "Nothing found",
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Theme.of(context).primaryColor,
            shape: const CircularNotchedRectangle(),
            notchMargin: 8,
            child: SizedBox(
              height: 50.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      trs.translate('sum') ?? "Sum",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                    FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "${widget.order.OInvFTotal.toStringAsFixed(2)} TMT",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                        )),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xffFFCC5F),
            foregroundColor: Theme.of(context).primaryColor,
            onPressed: () {
              BlocProvider.of<OrdersInfoPageBloc>(context).add(ChangeOrderStatusEvent(
              providerModel.getOrderStatuses.firstWhere((element) => element.InvStatEnName==groupValue), widget.order));
            },
            tooltip: 'Increment Counter',
            child: const Icon(Icons.arrow_forward_ios),
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}

class OrdersInfoItem extends StatelessWidget {
  final String value;
  final Resp_dk_order_inv_status orderStatus;
  final String groupValue;
  final ValueChanged<String?> onChanged;

  const OrdersInfoItem(
      {super.key,
        required this.value,
        required this.groupValue,
        required this.onChanged,
        required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    final trs = AppLocalizations.of(context);
    return RadioListTile<String>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: const Color(0xffFFCC5F),
      title: Text(
        trs.locale.languageCode=='tk' ? orderStatus.InvStatTmName
        : trs.locale.languageCode=='ru' ? orderStatus.InvStatRuName
            : orderStatus.InvStatEnName,
        style: const TextStyle(
            fontSize: 24, color: Color(0xff5B5B5B), fontWeight: FontWeight.w500),
      ),
    );
  }
}
