// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:delivery_app/Helpers/SharedPrefKeys.dart';
import 'package:delivery_app/Helpers/localization.dart';
import 'package:delivery_app/Pages/NewOrdersPage.dart';
import 'package:delivery_app/Pages/OrdersPage.dart';
import 'package:delivery_app/bloc/NewOrdersPageBloc.dart';
import 'package:delivery_app/bloc/OrdersPageBloc.dart';
import 'package:delivery_app/models/providerModel.dart';
import 'package:delivery_app/models/responseModels/resp_dk_order_inv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitPage extends StatefulWidget {
  final int? bottomNavIndex;
  const InitPage({super.key, this.bottomNavIndex});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage>
    with SingleTickerProviderStateMixin {
  int _selectedItem = 0;
  PageController _pageController = PageController();
  bool isVisibleSearch = false;
  bool gridOrList = true;
  late Animation<double> _iconAnimation;
  late AnimationController _iconController;
  List<Resp_dk_order_inv> sortedOrders = [];
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String statusValue = "None";
  String dateValue = "From early to late";
  void searchBarVisibilityChange() {
    setState(() {
      isVisibleSearch = false;
    });
  }

  void initBools() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      gridOrList = prefs.getBool(SharedPrefKeys.gridOrList) ?? true;
    });
    if (!gridOrList) {
      await _iconController.reverse();
    } else {
      await _iconController.forward();
    }
  }

  @override
  void initState() {
    super.initState();
    initBools();
    _iconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _selectedItem = widget.bottomNavIndex ?? 0;
    _pageController = PageController(initialPage: _selectedItem);
    _iconAnimation =
        CurvedAnimation(curve: Curves.linear, parent: _iconController);
  }

  @override
  void dispose() {
    _iconController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final providerModel = Provider.of<ProviderModel>(context, listen: false);
    final trs = AppLocalizations.of(context);
    Size size = MediaQuery.sizeOf(context);
    return PopScope(
      canPop: false,
      child: BlocListener<NewOrdersPageBloc, NewOrdersPageState>(
        listener: (BuildContext context, NewOrdersPageState state) {
          if(state is SearchNewOrdersEmptyState || state is SearchingNewOrdersCompletedState || state is NewOrdersSearchErrorState) {
            setState(() {
              statusValue = '';
              dateValue = '';
            });
          }
        },
        child: Scaffold(
          endDrawerEnableOpenDragGesture: (_selectedItem==0),
          key: _scaffoldKey,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).primaryColor,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
            ),
            title: (_selectedItem==0) ?
            BlocProvider.value(
              value: context.watch<NewOrdersPageBloc>(),
              child: Text("${trs.translate("orders_text") ??
                  "Orders"} ${(providerModel.getNewOrders.isNotEmpty)
                  ? "(${providerModel.getNewOrders.length})"
                  : ""}"),
            )
            : BlocProvider.value(
                value: context.watch<OrdersPageBloc>(),
                child: Text("${trs.translate("orders_text") ?? "Orders"} ${(providerModel.getOrders.isNotEmpty) ? "(${providerModel.getOrders.length})" : ""}")),
            actions: [
              Center(
                child: GestureDetector(
                  onTap: () async {
                    final SharedPreferences prefs = await _prefs;
                    if (gridOrList) {
                      await _iconController.reverse();
                    } else {
                      await _iconController.forward();
                    }
                    setState(() {
                      gridOrList = !gridOrList;
                      prefs.setBool(SharedPrefKeys.gridOrList, gridOrList);
                    });
                  },
                  child: AnimatedIcon(
                    progress: _iconAnimation,
                    icon: AnimatedIcons.view_list,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.sizeOf(context).width/16,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                  ),
                  child: Transform.translate(
                    offset: const Offset(-6,0),
                    child: IconButton(
                      icon: Icon(Icons.sync, color: Theme.of(context).primaryColor,size: 20,),
                      onPressed: () {
                        if (_selectedItem == 0) {
                          BlocProvider.of<NewOrdersPageBloc>(context)
                              .add(LoadNewOrdersEvent());
                        } else {
                          BlocProvider.of<OrdersPageBloc>(context)
                              .add(LoadOrdersEvent(providerModel.getOrdersStartDate,providerModel.getOrdersEndDate));
                        }
                      },
                    ),
                  ),
                ),
              ),
              IconButton(
                visualDensity: const VisualDensity(horizontal: -4.0),
                icon: const Icon(Icons.settings),
                onPressed: () {
                  GoRouter.of(context).go('/configPage');
                },
              ),
              Visibility(
                visible: (_selectedItem==0),
                child: Transform.translate(
                  offset: const Offset(-7, 0),
                  child: IconButton(
                    visualDensity: const VisualDensity(horizontal: -4.0),
                    icon: const Icon(Icons.sort),
                    onPressed: () => _scaffoldKey.currentState!.openEndDrawer()
                  ),
                ),
              ),
            ],
          ),
          endDrawer: Drawer(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(20))
            ),
            backgroundColor: const Color(0xffF6F6F6),
            width: size.width/1.15,
            child: Column(
              children: [
                SizedBox(
                  height: size.height/1.08,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0,top: 8),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Text("${trs.translate("order_date") ?? "Order date"}:",
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)
                        ),
                        RadioListTile(
                            dense: true,
                            value: "From early to late",
                            groupValue: dateValue,
                            title: Text(trs.translate("early_to_late") ?? "From early to late",
                              style: const TextStyle(fontSize: 16,fontWeight: FontWeight.normal),
                            ),
                            activeColor: Theme.of(context).primaryColor,
                            onChanged: (val) {
                              setState(() {
                                dateValue = val!;
                              });
                            }),
                        RadioListTile(
                            dense: true,
                            value: "From late to early",
                            groupValue: dateValue,
                            title: Text(trs.translate("late_to_early") ?? "From late to early",
                              style: const TextStyle(fontSize: 16,fontWeight: FontWeight.normal),
                            ),
                            activeColor: Theme.of(context).primaryColor,
                            onChanged: (val) {
                              setState(() {
                                dateValue = val!;
                              });
                            }),
                        const Divider(thickness: 2),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text("${trs.translate("order_status") ?? "Order status"}:",
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)
                          ),
                        ),
                        SizedBox(
                          height: size.height/1.72,
                          child: ListView.builder(
                              itemCount: providerModel.getOrderStatuses.length,
                              itemBuilder: (context,index){
                            return RadioListTile(
                                dense: true,
                                value: providerModel.getOrderStatuses[index].InvStatGuid,
                                groupValue: statusValue,
                                title: Text(trs.locale.languageCode=='tk'? providerModel.getOrderStatuses[index].InvStatTmName
                                    :trs.locale.languageCode=='ru'? providerModel.getOrderStatuses[index].InvStatRuName
                                    : providerModel.getOrderStatuses[index].InvStatEnName,
                                  style: const TextStyle(fontSize: 16,fontWeight: FontWeight.normal),
                                ),
                                activeColor: Theme.of(context).primaryColor,
                                onChanged: (val) {
                                  setState(() {
                                    statusValue = val!;
                                  });
                                });
                          }),
                        ),
                        const Divider(thickness: 2),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.all(10)
                              ),
                              onPressed: (){
                                setState(() {
                                  statusValue = '';
                                  dateValue = '';
                                });
                                context.read<NewOrdersPageBloc>().add(SortNewOrdersEvent(statusValue, dateValue));
                              },
                              child: Text(trs.translate('clear') ?? "CLEAR", style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: (){
                      context.read<NewOrdersPageBloc>().add(SortNewOrdersEvent(statusValue, dateValue));
                      _scaffoldKey.currentState!.closeEndDrawer();
                    },
                    style: TextButton.styleFrom(
                      shape: LinearBorder.bottom(size: 0),
                      fixedSize: Size(size.width, size.height/13.5),
                      backgroundColor: const Color(0xff01A9B4),
                    ),
                    child: Text(trs.translate("sort") ?? "Sort",
                      style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          body: PageView(
            onPageChanged: (index) {
              setState(
                    () {
                  _selectedItem = index;
                },
              );
              if (_selectedItem == 0) {
                BlocProvider.of<NewOrdersPageBloc>(context)
                    .add(LoadNewOrdersEvent());
              } else {
                BlocProvider.of<OrdersPageBloc>(context)
                    .add(LoadOrdersEvent(providerModel.getOrdersStartDate,providerModel.getOrdersEndDate));
              }
            },
            controller: _pageController,
            children: [
              NewOrdersPage(gridOrList: gridOrList),
              OrdersPage(gridOrList: gridOrList),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color(0xFF005E6A),
            selectedItemColor: Colors.red,
            currentIndex: _selectedItem,
            unselectedItemColor: Colors.white,
            onTap: (index) {
              _selectedItem = index;
              _pageController.animateToPage(_selectedItem,
                  duration: const Duration(milliseconds: 200), curve: Curves.linear);
              if (_selectedItem == 0) {
                BlocProvider.of<NewOrdersPageBloc>(context)
                    .add(LoadNewOrdersEvent());
              } else {
                BlocProvider.of<OrdersPageBloc>(context)
                    .add(LoadOrdersEvent(providerModel.getOrdersStartDate, providerModel.getOrdersEndDate));
              }
            },
            items: [
              BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.receipt,
                  ),
                  label: trs.translate("new_orders") ?? "New orders"),
              BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.receipt,
                  ),
                  label: trs.translate("orders_text") ?? "Orders"),
            ],
          ),
        ),
      ),
    );
  }
}
