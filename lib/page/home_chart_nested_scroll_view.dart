import 'package:flutter/material.dart';

import '../common/P.dart';
import '../generated/assets.dart';

/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: HomePage
/// @Date: on 2023-06-06 18:09
class HomeChartNestedScrollView extends StatefulWidget {
  static const String sName = "HomeChartNestedScrollView";

  const HomeChartNestedScrollView({super.key});

  @override
  HomeChartNestedScrollViewState createState() =>
      HomeChartNestedScrollViewState();
}

class HomeChartNestedScrollViewState extends State<HomeChartNestedScrollView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          // 返回一个 Sliver 数组给外部可滚动组件。
          return <Widget>[
            SliverAppBar(
              pinned: false, // 固定在顶部
              forceElevated: innerBoxIsScrolled,
              backgroundColor: Colors.red,
              expandedHeight: 200,
              floating: true,
              snap: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("demo" , style: TextStyle(color: Colors.black),),
                // title: IconButton(onPressed: (){}, icon: Icon(Icons.share)),
                background: Image.asset(
                  Assets.imagesBanner,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            buildSliverList(100), //构建一个 sliverList
          ];
        },
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          physics: const ClampingScrollPhysics(), //重要
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 50,
              child: Center(child: Text('Item $index')),
            );
          },
        ),
      ),
    );
  }

  SliverFixedExtentList buildSliverList(int count) {
    return SliverFixedExtentList(
      delegate: SliverChildBuilderDelegate((context, index) {
        Log.d("build sliver");
        return Text("__ $index");
      }, childCount: count),
      itemExtent: 50,
    );
  }
}
