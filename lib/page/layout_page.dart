import 'dart:math';

import 'package:flutter/material.dart';
import 'package:testflutter/widget/ConstraintPrinterWidget.dart';

import '../common/UIUtil.dart';
import '../widget/SingleLineFittedBox.dart';

class LayoutPage extends StatefulWidget {
  static const String sName = "LayoutPage";

  const LayoutPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return LayoutPageState();
  }
}

class LayoutPageState extends State<LayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: UIUtil.appBarLeading(context),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Layout"),
        actions: const [
          //todo center
          SizedBox(
            width: 10,
            height: 10,
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("jjjjjjjjjjj"),
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 50, minWidth: 200),
              child: const SizedBox(
                height: 20,
                width: double.maxFinite,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                ),
              ),
            ),
            // Row(
            //   children: [
            //     // Container(
            //     //   width: 100,
            //     //   height: 200,
            //     //   color: Colors.blue,
            //     // ),
            //     // Flexible(
            //     //   child: Container(
            //     //     color: Colors.amber,
            //     //     height: 200,
            //     //     child: Center(
            //     //       child: Image.asset(Assets.imagesLogo , width: 50 , height: 50 , fit: BoxFit.fitWidth,),
            //     //     )
            //     //   ),
            //     // ),
            //     Expanded(
            //         flex: 1,
            //         child: Container(
            //           color: Colors.cyanAccent,
            //           height: 200,
            //         ))
            //   ],
            // ),
            // Wrap(
            //   children: [
            //     Text("data "),
            //     Text("data "),
            //     Text("data "),
            //     Text("data "),
            //   ],
            // ),
            // Container(
            //   width: 300,
            //   height: 50,
            //   decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            //   child: Stack(
            //     alignment: Alignment.center,
            //     fit: StackFit.expand,
            //     children: [
            //       Positioned(left: 20, child: Text("rigister")),
            //       Positioned(
            //           right: 20,
            //           child: IconButton(
            //               onPressed: () {},
            //               icon: Icon(Icons.accessible_forward_rounded))),
            //     ],
            //   ),
            // ),
            // Container(
            //   width: 300,
            //   height: 50,
            //   decoration: BoxDecoration(
            //       border: Border.all(color: Colors.blue),
            //       borderRadius: BorderRadius.all(Radius.circular(5))),
            //   child: Stack(
            //     alignment: Alignment.center,
            //     fit: StackFit.expand,
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.only(left: 38),
            //         child: Align(
            //           child: Text("rigister"),
            //           alignment: Alignment.centerLeft,
            //         ),
            //       ),
            //       Align(
            //           alignment: Alignment.centerRight,
            //           child: IconButton(
            //             onPressed: () {},
            //             icon: Icon(
            //               Icons.accessible_forward_rounded,
            //               size: 18,
            //             ),
            //           )),
            //     ],
            //   ),
            // ),
            // Container(
            //   width: 100 , child: ResponseColumnWidget(children: List.filled(6, Text("A"))),
            // ),
            // Container(
            //   width: 200 , child: ResponseColumnWidget(children: List.filled(6, Text("B"))),
            // ),
            // SizedBox(
            //   width: 200,
            //   height: 150,
            //   child: ConstraintPrinterWidget(
            //     tag: "pp",
            //     child: Text("test"),
            //   ),
            // ),
            // Flex(
            //   direction: Axis.horizontal,
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Text("abc"),
            //     Text("  ef"),
            //   ],
            // ),
            // Transform.rotate(
            //   angle: 45,
            //   child: Container(
            //     color: Colors.red,
            //     width: 100,
            //     height: 100,
            //     child: IconButton(
            //       icon: Icon(Icons.add),
            //       onPressed: () {},
            //     ),
            //   ),
            // ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.yellow, Colors.red],
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 4,
                          offset: Offset(5, 5))
                    ]),
                width: 200,
                height: 200,
                // transform: Matrix4.rotationZ(0.5),
              ),
            ),
            Center(
              child: Column(
                children: [
                  wRow(' 90000000000000000 '),
                  SingleLineFittedBox(child: wRow(' 90000000000000000 ')),
                  wRow(' 800 '),
                  SingleLineFittedBox(child: wRow(' 800 ')),
                  ConstraintPrinterWidget(tag: "test", child: Text("test")),
                  SingleLineFittedBox(child: ConstraintPrinterWidget(tag: "test", child: wRow(' test2 ')))
                ].map((e) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: e,
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget wRow(String text) {
    Widget child = Text(text);
    child = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [child, child, child],
    );
    return child;
  }
}
