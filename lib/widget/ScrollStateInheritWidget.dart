import 'package:flutter/material.dart';

import '../common/P.dart';

/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: HomePage
/// @Date: on 2023-06-05 10:53

class ScrollStateInheritWidget extends InheritedWidget {
  static const String sName = "ScrollStateInheritWidget";

  bool showPercentButton = false;

  ScrollStateInheritWidget({super.key , required this.showPercentButton, required super.child});

  static ScrollStateInheritWidget? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<ScrollStateInheritWidget>();
  }

  @override
  bool updateShouldNotify(covariant ScrollStateInheritWidget oldWidget) {
    return oldWidget.showPercentButton != showPercentButton;
  }
}
