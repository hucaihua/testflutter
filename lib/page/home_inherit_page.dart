import 'package:flutter/material.dart';
import 'package:testflutter/page/home_page.dart';
import 'package:testflutter/widget/ScrollStateInheritWidget.dart';

/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: HomePage
/// @Date: on 2023-06-05 10:53

class HomeInheritPage extends StatefulWidget {
  static const String sName = "HomeInheritPage";

  const HomeInheritPage({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return HomeInheritState();
  }
}

class HomeInheritState extends State<HomeInheritPage> {
  bool _show = false;

  void show(bool show) {
    setState(() {
      _show = show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollStateInheritWidget(
        showPercentButton: _show,
        child: Stack(
          children: [
            HomePage(),
            IconButton(onPressed: () {}, icon: Icon(Icons.change_circle))
          ],
        ));
  }
}
