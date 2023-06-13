import 'package:flutter/material.dart';
import 'package:testflutter/widget/AnimatedSwitcherCounterRoute.dart';
import 'package:testflutter/widget/custoom_hero_widget.dart';

import '../widget/Stagger_animation.dart';

/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: TestAnimationPage2
/// @Date: on 2023-06-05 10:53

class TestAnimationPage2 extends StatelessWidget {
  static const String sName = "TestAnimationPage2";

  const TestAnimationPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TestAnimationPage2"),
      ),
      // body: CustomHeroAnimation(),
      // body: TestStaggerWidget(),
      body: AnimatedSwitcherCounterRoute(),
    );
  }
}
