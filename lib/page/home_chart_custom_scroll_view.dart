import 'package:flutter/material.dart';
import 'package:testflutter/generated/assets.dart';

/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: HomeChartCustomScrollView 组合多种数据，用一个滑动列表
/// @Date: on 2023-06-06 16:20
class HomeChartCustomScrollView extends StatefulWidget {
  static const String sName = "HomeChartCustomScrollView";

  const HomeChartCustomScrollView({super.key});

  @override
  HomeChartCustomScrollViewState createState() =>
      HomeChartCustomScrollViewState();
}

class HomeChartCustomScrollViewState extends State<HomeChartCustomScrollView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
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
    );
  }
}
