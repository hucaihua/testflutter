import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:testflutter/page/home_inherit_page.dart';
import 'package:testflutter/widget/ScrollStateInheritWidget.dart';

import '../common/log.dart';

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
  int _current = 0;
  final CarouselController _carouselController = CarouselController();
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  late List<Widget> imageSliders;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.offset > 1000 && !showTopButton) {
        Log.d("show button to top");
        showTopButton = true;
        context.findAncestorStateOfType<HomeInheritState>()?.show(showTopButton);
      } else if (showTopButton && _controller.offset <= 1000) {
        Log.d("hide button to top");
        showTopButton = false;
        context.findAncestorStateOfType<HomeInheritState>()?.show(showTopButton);
      }
    });

    initSliderWidgets();
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
              if(index == 0){
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider(
                      items: imageSliders,
                      carouselController: _carouselController,
                      options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _carouselController.animateToPage(entry.key),
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white)
                                    .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                  ]
                );
              }else{
                return Text(data[index]);
              }
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
    Log.d("didChangeDependencies in home_list ${ScrollStateInheritWidget.of(context)?.showPercentButton}");
  }

  void initSliderWidgets() {
    imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              'No. ${imgList.indexOf(item)} image',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
  }
}
