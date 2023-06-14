/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: AnimatedSwitcherCounterRoute
/// @Date: on 2023-06-05 10:53
///
///
/// 切换的widget如果是同一个runType。需要确保key不一样
/// key: ValueKey<int>(_count),
/// begin: Offset(1, 0) ， 这个1代表的是1个子widget的宽度
import 'package:flutter/material.dart';
import 'package:testflutter/widget/SlideTransitionX.dart';

class AnimatedSwitcherCounterRoute extends StatefulWidget {
  const AnimatedSwitcherCounterRoute({super.key});

  @override
  _AnimatedSwitcherCounterRouteState createState() => _AnimatedSwitcherCounterRouteState();
}

class _AnimatedSwitcherCounterRouteState extends State<AnimatedSwitcherCounterRoute> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildSwitcher(),
          ElevatedButton(
            child: const Text(
              '+1',
            ),
            onPressed: () {
              setState(() {
                _count += 1;
              });
            },
          ),
        ],
      ),
    );
  }

  AnimatedSwitcher buildSwitcher() {
    // return AnimatedSwitcher(
    //   duration: const Duration(milliseconds: 500),
    //   transitionBuilder: (Widget child, Animation<double> animation) {
    //     //执行缩放动画
    //     return ScaleTransition(scale: animation, child: child);
    //   },
    //   child: Text(
    //     '$_count',
    //     //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
    //     key: ValueKey<int>(_count),
    //     style: Theme.of(context).textTheme.headlineLarge,
    //   ),
    // );

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1000),
      transitionBuilder: (Widget child, Animation<double> animation) {
        var tween = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
        // return MySlideTransition(
        //   child: child,
        //   position: tween.animate(animation),
        // );
        return SlideTransitionX(
            child: child,
            direction: AxisDirection.left, //上入下出
            position: animation);
      },
      child: Container(
        key: ValueKey<int>(_count),
        width: double.maxFinite,
        child: Text(
          '$_count',
          textAlign: TextAlign.center,
          //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}

class MySlideTransition extends AnimatedWidget {
  const MySlideTransition({
    Key? key,
    required Animation<Offset> position,
    this.transformHitTests = true,
    required this.child,
  }) : super(key: key, listenable: position);

  final bool transformHitTests;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final position = listenable as Animation<Offset>;
    Offset offset = position.value;
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}