// ignore_for_file: file_names

import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:delivery_app/Helpers/localization.dart';
import 'package:delivery_app/models/responseModels/resp_dk_order_inv.dart';
import 'package:delivery_app/models/responseModels/resp_dk_order_inv_line.dart';
import 'package:delivery_app/services/services.dart';

class OrdersDetailPage extends StatelessWidget {
  final Resp_dk_order_inv order;
  const OrdersDetailPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final trs = AppLocalizations.of(context);
    double height = MediaQuery.sizeOf(context).height;
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop){
        GoRouter.of(context).go('/initPage');
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(order.RpAcc?.RpAccName ?? ''),
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
          leading: IconButton(onPressed: () => GoRouter.of(context).go('/initPage'),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(35),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(70, 6, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.location_on_sharp,color: Colors.white,size: 20,),
                              (order.InvDelAddress.isNotEmpty) ?
                              FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(order.InvDelAddress, style: const TextStyle(color: Colors.white),),
                              ) : Text(order.InvDelAddress, style: const TextStyle(color: Colors.white),),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.phone,color: Colors.white,size: 20,),
                              Text(order.InvDelPhone, style: const TextStyle(color: Colors.white),)
                            ],
                          ),
                        ],
                      ),
                    ),
                    FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text("${trs.translate('note') ?? 'Note'}: ${order.OInvDesc}", style: const TextStyle(color: Colors.white),))
                  ],
                ),
              )),
        ),
        body: SizedBox(
          height: height / 1.3,
          child: ListView.builder(
              itemCount: order.OrderLines.length,
              itemBuilder: (context,index){
                return OrdersDetailItem(orderLine: order.OrderLines[index]);
              }),
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
                  Text(trs.translate('sum') ?? "Sum", style: const TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w500),),
                  FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text("${order.OInvFTotal.toStringAsFixed(2)} TMT", style: const TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w500),)),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xffFFCC5F),
          foregroundColor: Theme.of(context).primaryColor,
          onPressed: (){
            GoRouter.of(context).go('/ordersInfoPage', extra: order);
          },
          tooltip: 'Increment Counter',
          child: const Icon(Icons.arrow_forward_ios),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}


class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double buttonRadius = 28; // Match the radius of the CircleAvatar

    Path path = Path()
      ..lineTo((width / 2) - buttonRadius, 0)
      ..lineTo((width / 2) - buttonRadius, 0)
      ..arcToPoint(
        Offset((width / 2) + buttonRadius, 0),
        radius: Radius.circular(buttonRadius),
        clockwise: false,
      )
      ..quadraticBezierTo(0, 0, 12, 0)
      ..lineTo(width, 0)
      ..lineTo(width, height)
      ..lineTo(0, height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class OrdersDetailItem extends StatefulWidget {
  final Resp_dk_order_inv_line orderLine;
  const OrdersDetailItem({super.key, required this.orderLine});

  @override
  State<OrdersDetailItem> createState() => _OrdersDetailItemState();
}

class _OrdersDetailItemState extends State<OrdersDetailItem> {
  double count = 1;
  TextEditingController countCtrl = TextEditingController();
  double _fontSize = 16;
  @override
  void initState() {
    countCtrl.text = count.toStringAsFixed(0);
    countCtrl.addListener(_adjustFontSizeToFit);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final srv = Services();
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      margin: const EdgeInsets.all(4.0),
      child: AspectRatio(
        aspectRatio: 3.4 / 1,
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
                color: Colors.white,
              ),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    // === === === === === Image Part === === === === ===
                    Expanded(
                      flex: 4,
                      child: AspectRatio(
                        aspectRatio: 1.7 / 1,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          child: Image.network(
                            (srv.reqType == 1)
                                ? 'http://${srv.publicAddress}${widget.orderLine.Resource?.Images[0].FilePath}M/${widget.orderLine.Resource?.Images[0].FileName}'
                                : 'https://${srv.publicAddress}${widget.orderLine.Resource?.Images[0].FilePath}M/${widget.orderLine.Resource?.Images[0].FileName}',
                            fit: BoxFit.contain,
                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                        : null,
                                  ),
                                );
                              }
                            },
                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                              return SvgPicture.asset("assets/images/NoImage.svg");
                            },
                          ),

                        ),
                      ),
                    ),
                    const VerticalDivider(color: Color(0xffCACACA),thickness: 1.2,),
                    // === === === === === Other Stuff === === === === ===
                    Expanded(
                      flex: 8,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (widget.orderLine.Resource != null && widget.orderLine.Resource!.ResName.isNotEmpty) ?
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                widget.orderLine.Resource!.ResName,
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ) : Text(
                              widget.orderLine.Resource?.ResName ?? '',
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10.0,top: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Theme.of(context).primaryColor
                                          ),
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.all(2),
                                          child: const Text("TMT", style: TextStyle(color: Colors.white,fontSize: 6),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 4.0),
                                          child: Text(
                                            "${widget.orderLine.OInvLinePrice.toStringAsFixed(2)} TMT",
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.functions,
                                          size: 20,
                                        ),
                                        Text(
                                          "${widget.orderLine.OInvLineTotal.toStringAsFixed(2)} TMT",
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            AspectRatio(
                              aspectRatio: 7/1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Transform.translate(
                                    offset: const Offset(-7,3),
                                    child: Material(
                                      child: InkWell(
                                        onTap: (){},
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.horizontal(right: Radius.circular(6))
                                          ),
                                          padding: const EdgeInsets.all(3.0),
                                          child: const Icon(Icons.delete, color: Colors.white,size: 25,),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: width/12,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
                                          color: Theme.of(context).primaryColor
                                        ),
                                        child: IconButton(
                                          iconSize: 20,
                                          color: Colors.white,
                                          onPressed: () {
                                            if(count>1){
                                              setState(() {
                                                count--;
                                                countCtrl.text = count.toStringAsFixed(0);
                                              });
                                            }
                                          },
                                          icon: const Icon(Icons.remove),
                                        ),
                                      ),
                                      Container(
                                          width: width /11,
                                          decoration: const BoxDecoration(
                                            color: Color(0xff5AB8C3)
                                          ),
                                          alignment: Alignment.center,
                                          child: TextField(
                                            cursorColor: Colors.black,
                                            style: TextStyle(fontSize: _fontSize, fontWeight: FontWeight.w600),
                                            textAlign: TextAlign.center,
                                            controller: countCtrl,
                                            keyboardType: TextInputType.number,
                                            maxLength: 8,
                                            onChanged: (value) {
                                              if (value.startsWith('0') && value.length > 1) {
                                                countCtrl.text = value.substring(1);
                                                countCtrl.selection = TextSelection.fromPosition(TextPosition(offset: countCtrl.text.length));
                                              }
                                              if(value.isNotEmpty) {
                                                final double parsedValue = double.parse(value);
                                                if (parsedValue != count) {
                                                  setState(() {
                                                    count = parsedValue;
                                                  });
                                                }
                                              }
                                            },
                                            onSubmitted: (value) {
                                              if(value.isNotEmpty) {
                                                final double parsedValue = double.parse(value);
                                                if (parsedValue != count) {
                                                  setState(() {
                                                    count = parsedValue;
                                                  });
                                                }
                                              }
                                            },
                                            decoration: InputDecoration(
                                              counterText: "",
                                              contentPadding: const EdgeInsets.only(bottom: 10),
                                              border: const UnderlineInputBorder(
                                                borderSide: BorderSide(color: Colors.transparent),
                                              ),
                                              focusedBorder: const UnderlineInputBorder(
                                                borderSide: BorderSide(color: Colors.transparent),
                                              ),
                                              focusColor: Theme.of(context).scaffoldBackgroundColor,
                                              disabledBorder: const UnderlineInputBorder(
                                                borderSide: BorderSide(color: Colors.transparent),
                                              ),
                                              enabledBorder: const UnderlineInputBorder(
                                                borderSide: BorderSide(color: Colors.transparent),
                                              ),
                                            ),
                                                                                ),
                                      ),
                                      Container(
                                        width: width/12,
                                        decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12)),
                                            color: Theme.of(context).primaryColor
                                        ),
                                        child: IconButton(
                                          iconSize: 20,
                                          onPressed: () {
                                            setState(() {
                                              count++;
                                              countCtrl.text = count.toStringAsFixed(0);
                                            });
                                          },
                                          color: Colors.white,
                                          icon: const Icon(Icons.add),
                                        ),
                                      ),
                                    ],
                                  )
                                                        ],
                                                      ),
                            ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    )
    ]
    )
    )
    );
  }
  void _adjustFontSizeToFit() {
    double textWidth = _calculateTextWidth(countCtrl.text, _fontSize, Colors.black);

    while (textWidth > MediaQuery.sizeOf(context).width / 13 && _fontSize > 6) {
      _fontSize -= 2;
      textWidth = _calculateTextWidth(countCtrl.text, _fontSize, Colors.black);
    }
    while (textWidth < MediaQuery.sizeOf(context).width / 15 && _fontSize < 16){
      _fontSize += 2;
      textWidth = _calculateTextWidth(countCtrl.text, _fontSize, Colors.black);
    }
  }

  double _calculateTextWidth(String text, double fontSize, Color textColor) {
    final paragraphStyle = ui.ParagraphStyle(
      textAlign: TextAlign.left,
      fontSize: fontSize,
      maxLines: 1,
    );

    final textStyle = ui.TextStyle(
      fontSize: fontSize,
      color: textColor,
    );

    final paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
      ..pushStyle(textStyle)
      ..addText(text);

    final paragraph = paragraphBuilder.build();
    paragraph.layout(const ui.ParagraphConstraints(width: double.infinity));

    return paragraph.maxIntrinsicWidth;
  }
}
