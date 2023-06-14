import 'package:flutter/material.dart';
import 'package:testflutter/generated/assets.dart';

/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: TestAnimationPage
/// @Date: on 2023-06-12 15:31
class TestAnimationPage extends StatefulWidget {
  static const String sName = "TestAnimationPage";

  const TestAnimationPage({super.key});

  @override
  TestAnimationPageState createState() => TestAnimationPageState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class TestAnimationPageState extends State<TestAnimationPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    //图片宽高从0变到300
    animation = Tween(begin: 0.1, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.linear));
    //启动动画(正向执行)
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(
      animation: animation,
      child: Image.asset(Assets.imagesBanner),
    );

    // return ScaleTransition(
    //   scale: controller,
    //   child: Image.asset(Assets.imagesBanner),
    // );
  }

  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

class GrowTransition extends StatelessWidget {
  const GrowTransition({
    Key? key,
    required this.animation,
    this.child,
  }) : super(key: key);

  final Widget? child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, child) {
          return SizedBox(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
