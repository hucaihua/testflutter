import 'package:flutter/material.dart';

/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: HomePage
/// @Date: on 2023-06-06 09:24
class HomeAnimateList extends StatefulWidget {
  static const String sName = "HomeAnimateList";

  const HomeAnimateList({super.key});

  @override
  HomeAnimateListState createState() => HomeAnimateListState();
}

class HomeAnimateListState extends State<HomeAnimateList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeAnimateList"),
      ),
      body: Container(),
    );
  }
}