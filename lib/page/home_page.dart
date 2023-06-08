import 'package:flutter/material.dart';
import 'package:testflutter/page/home_chart.dart';
import 'package:testflutter/page/home_list.dart';
import 'package:testflutter/page/home_setting.dart';
import 'package:testflutter/widget/ScrollStateInheritWidget.dart';

import '../common/P.dart';
import '../widget/KeepAliveWidget.dart';

/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: HomePage
/// @Date: on 2023-06-05 10:53
class HomePage extends StatefulWidget {
  static const String sName = "HomePage";

  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final GlobalKey<HomeListState> homeListKey = GlobalKey();
  final GlobalKey<HomeChartState> homeChartKey = GlobalKey();
  final GlobalKey<HomeSettingState> homeSettingKey = GlobalKey();
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 2
          ? null
          : AppBar(
              title: const Text("HomePage"),
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "list"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "chart"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "setting"),
        ],
        onTap: _onTap,
        currentIndex: _selectedIndex,
      ),
      body: buildPageView(),
      floatingActionButton: ScrollStateInheritWidget.of(context)?.showPercentButton ?? false
          ? IconButton(icon: const Icon(Icons.arrow_upward), onPressed: () {
        homeListKey.currentState?.toTop();
      })
          : null,
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    P.d("didChangeDependencies in home_page ${ScrollStateInheritWidget.of(context)?.showPercentButton}");
  }

  void _onTap(int value) {
    setState(() {
      _selectedIndex = value;
      pageController.animateToPage(value,
          duration: Duration(milliseconds: 500), curve: Curves.linear);
    });
  }

  Widget buildPageView() {
    return PageView(
      allowImplicitScrolling: true,
      controller: pageController,
      onPageChanged: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      children: [
        KeepAliveWidget(
          child: HomeList(key: homeListKey),
        ),
        KeepAliveWidget(child: HomeChart(key: homeChartKey)),
        KeepAliveWidget(child: HomeSetting(key: homeSettingKey))
      ],
    );
  }
}
