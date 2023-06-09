import 'package:flutter/material.dart';
import 'package:testflutter/page/home_chart_custom_scroll_view.dart';
import 'package:testflutter/page/home_chart_nested_scroll_view.dart';
import 'package:testflutter/page/home_chart_provider.dart';

import '../widget/KeepAliveWidget.dart';

/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: HomePage
/// @Date: on 2023-06-05 15:02
class HomeChart extends StatefulWidget {
  static const String sName = "HomeChart";

  const HomeChart({super.key});

  @override
  HomeChartState createState() => HomeChartState();
}

class HomeChartState extends State<HomeChart>
    with SingleTickerProviderStateMixin {
  List<String> tabs = ["news", "history", "provider"];
  List<Icon> tabsIcons = [
    Icon(Icons.add),
    Icon(Icons.access_alarm),
    Icon(Icons.ac_unit_outlined)
  ];

  TabController? _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(
      length: tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Column(
        children: [
          TabBar(
            tabs: _buildTabs(),
            controller: _controller,
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: [
                KeepAliveWidget(child: HomeChartCustomScrollView()),
                KeepAliveWidget(child: HomeChartNestedScrollView()),
                KeepAliveWidget(child: HomeChartProvider()),
              ]
            ),
          ),
        ],
      ),
    );
  }

  List<Tab> _buildTabs() {
    List<Tab> result = [];
    for (int i = 0; i < tabs.length; i++) {
      result.add(Tab(
        text: tabs[i],
        // icon: tabsIcons[i],
      ));
    }
    return result;
  }
}
