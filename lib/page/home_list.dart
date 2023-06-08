import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:testflutter/page/home_inherit_page.dart';
import 'package:testflutter/widget/ScrollStateInheritWidget.dart';

import '../common/P.dart';

/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: HomePage
/// @Date: on 2023-06-05 15:06
class HomeList extends StatefulWidget {
  static const String sName = "HomeList";

  const HomeList({super.key});

  @override
  HomeListState createState() => HomeListState();
}

class HomeListState extends State<HomeList> {
  var data = List.empty(growable: true);

  bool showTopButton = false;

  final RefreshController _refreshController = RefreshController(initialRefresh: true);
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if(_controller.offset > 1000 && !showTopButton) {
        P.d("show button to top");
        showTopButton = true;
        context.findAncestorStateOfType<HomeInheritState>()?.show(showTopButton);
      }else if(showTopButton && _controller.offset <= 1000){
        P.d("hide button to top");
        showTopButton = false;
        context.findAncestorStateOfType<HomeInheritState>()?.show(showTopButton);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
    SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      enablePullUp: true,
      onLoading: _loadingMore,
      onRefresh: _onRefresh,
      header: const ClassicHeader(),
      footer: const ClassicFooter(
        loadStyle: LoadStyle.ShowWhenLoading,
      ),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Text(data[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 50,
            color: Colors.grey,
          );
        },
        itemCount: data.length,
        controller: _controller,
      ),
    ),
        CircleAvatar(
          //显示进度百分比
          radius: 30.0,
          backgroundColor: Colors.black54,
          child: Text(ScrollStateInheritWidget.of(context)?.showPercentButton ?? false ? "展示" : "隐藏"),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _loadingMore() {
    Future.delayed(const Duration(seconds: 2)).asStream().listen((event) {
      setState(() {
        data.insertAll(data.length - 1, List.filled(20, "test_${Random(100)}"));
      });
      _refreshController.loadComplete();
    });
  }

  void _onRefresh() {
    Future.delayed(const Duration(seconds: 2)).asStream().listen((event) {
      setState(() {
        data.clear();
        data.addAll(List.filled(20, "test_${Random(100)}"));
      });
      _refreshController.refreshCompleted();
    });
  }

  void toTop() {
    _controller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.easeIn);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    P.d("didChangeDependencies in home_list ${ScrollStateInheritWidget.of(context)?.showPercentButton}");
  }
}
