// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:delivery_app/Helpers/localization.dart';
import 'package:delivery_app/bloc/AuthBloc.dart';
import 'package:delivery_app/bloc/NewOrdersPageBloc.dart';
import 'package:delivery_app/bloc/OrdersInfoPageBloc.dart';
import 'package:delivery_app/models/providerModel.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userController= TextEditingController();
  TextEditingController passController= TextEditingController();

  @override
  void dispose() {
    userController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final providerModel = Provider.of<ProviderModel>(context, listen: false);
    final trs = AppLocalizations.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
          title: const Text("DeliveryApp"),
          titleTextStyle: TextStyle(color: Theme.of(context).cardColor, fontWeight: FontWeight.w600, fontSize: 20),
      ),
      body: BlocListener<OrdersInfoPageBloc,OrdersInfoPageState>(
        listener: (BuildContext context, OrdersInfoPageState state) {
          if(state is OrderStatusesLoadedState) {
            providerModel.setOrderStatuses = state.getOrderStatusesList;
          }
          else if(state is OrderStatusesEmptyState || state is OrderStatusesLoadErrorState) {
            providerModel.setOrderStatuses = [];
            context.read<OrdersInfoPageBloc>().add(LoadOrderStatusesEvent());
          }
        },
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (BuildContext context, AuthState state) {
            if(state is AuthSuccess) {
              if(providerModel.getOrderStatuses.isNotEmpty) {
                context.read<NewOrdersPageBloc>().add(LoadNewOrdersEvent());
                GoRouter.of(context).go('/initPage');
              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(backgroundColor: Colors.deepOrangeAccent,
                        content: Text(trs.translate("error_text") ?? "Error"))
                );
              }
            }
            else if (state is AuthFailure){
              debugPrint("${trs.translate("error_text") ?? "Error"}: ${state.errorStatus}");
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(backgroundColor: Colors.deepOrangeAccent,
                      content: Text(trs.translate("error_text") ?? "Error"))
              );
              BlocProvider.of<AuthBloc>(context).add(AuthLogOutEvent());
            }
          },
          builder: (BuildContext context, AuthState state) {
            if(state is AuthInProgress){
              return const Center(child: CircularProgressIndicator());
            }
            else if(state is AuthInitial) {
             return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipPath(
                          clipper: WaveClipper(),
                          child: Container(
                              height: MediaQuery.sizeOf(context).height/3.4,
                              color: Theme.of(context).primaryColor
                          ),
                        ),
                        Positioned(
                          left: 160,
                          top: 100,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            width: size.width/4,
                            height: size.height/7,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(color: Theme.of(context).dividerColor,
                                  blurRadius: 5,
                                )
                              ],
                              color: Theme.of(context).cardColor,
                            ),
                            child: Text("App logo",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Text("DeliveryApp",
                      style: TextStyle(color: Color(0xff434343), fontSize: 32),
                    ),
                    const Divider(indent: 80, endIndent: 80, thickness: 2,),
                    Text(trs.translate("delivery_program") ?? "Delivery program",
                      style: const TextStyle(color: Color(0xff747474), fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50),
                      child: Container(
                        width: size.width,
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: const Color(0xff0398A2),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0,3)
                              )
                            ]
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                              child: TextField(
                                controller: userController,
                                decoration: InputDecoration(
                                  label: Text(trs.translate('server_u_name') ?? "User name"),
                                  floatingLabelStyle: TextStyle(color: Theme.of(context).primaryColor),
                                  alignLabelWithHint: true,
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xffCDCDCD)),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Theme.of(context).primaryColor),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5.0))
                                  ),
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xffCDCDCD)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0))
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: TextField(
                                controller: passController,
                                obscureText: true,
                                obscuringCharacter: "*",
                                decoration: InputDecoration(
                                  label: Text(trs.translate("server_u_pass") ?? "Password"),
                                  floatingLabelStyle: TextStyle(color: Theme.of(context).primaryColor),
                                  alignLabelWithHint: true,
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xffCDCDCD)),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Theme.of(context).primaryColor),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5.0))
                                  ),
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xffCDCDCD)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0))
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 50),
                              child: TextButton(
                                onPressed: (){
                                  BlocProvider.of<AuthBloc>(context).add(AuthLogInEvent(username: userController.text, password: passController.text),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Theme.of(context).primaryColor,
                                  fixedSize: Size(size.width, size.height/16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: Text(trs.translate("login") ?? "Login",
                                  style: TextStyle(
                                    color: Theme.of(context).cardColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

// class WaveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, 240);
//     path.quadraticBezierTo(size.width / 4, 150, size.width / 2, 155);
//     path.quadraticBezierTo(4 / 5 * size.width, 150, size.width, 80);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }


class WaveClipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height-70);
    path.quadraticBezierTo(0, size.height+40,size.width-40, size.height-
        130);
    path.quadraticBezierTo(size.width+60, size.height-170,size.width, 0);
    path.close();
    return path;
  }
}
