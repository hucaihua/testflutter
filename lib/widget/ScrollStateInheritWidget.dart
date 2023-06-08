import 'package:flutter/material.dart';

/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: HomePage
/// @Date: on 2023-06-05 10:53

class ScrollStateInheritWidget extends InheritedWidget {
  static const String sName = "ScrollStateInheritWidget";

  bool showToTopButton = false;

  ScrollStateInheritWidget({super.key , required this.showToTopButton, required super.child});

  static ScrollStateInheritWidget? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<ScrollStateInheritWidget>();
  }

  @override
  bool updateShouldNotify(covariant ScrollStateInheritWidget oldWidget) {
    return oldWidget.showToTopButton != showToTopButton;
  }
}
