import 'package:flutter/material.dart';
import 'package:testflutter/widget/ConstraintPrinterWidget.dart';

import '../generated/assets.dart';

/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: HomePage
/// @Date: on 2023-06-05 15:02
class HomeSetting extends StatefulWidget {
  static const String sName = "HomeSetting";

  const HomeSetting({super.key});

  @override
  HomeSettingState createState() => HomeSettingState();
}

class HomeSettingState extends State<HomeSetting> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              // title: Text("demo" , style: TextStyle(color: Colors.black),),
              titlePadding: EdgeInsets.only(bottom: 5),
              background: Image.asset(
                Assets.imagesBanner,
                fit: BoxFit.cover,
              ),
            ),
            bottom: TabBar(
              controller: TabController(length: 3, vsync: this,),
              tabs: [
                Tab(text: "1111"),
                Tab(text: "2222"),
                Tab(text: "3333"),
              ],
            ),
          ),
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Text("__$index");
                },
                childCount: 20,
              ),
              itemExtent: 50),
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Text("__$index");
                },
                childCount: 20,
              ),
              itemExtent: 50)
        ],
      ),
    );
  }
}
