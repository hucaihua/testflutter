import 'package:flutter/material.dart';

import '../common/log.dart';

/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: StaggerAnimation
/// @Date: on 2023-06-05 10:53
///
/// 注意
/// 1. 动画执行是一个future 可以等待结束
/// void _playAnimation() async{
//     try {
//       await controller.forward().orCancel;
//       await controller.reverse().orCancel;
//     } on TickerCanceled catch (e) {
//       Log.e(e);
//     }
//   }
/// 2. 对于动画执行时间的控制，在每个动画的interval中设置 0% - 60%
/// curve: Interval(0 , 0.6 , curve: Curves.ease)

class StaggerAnimation extends StatelessWidget {
  static const String sName = "StaggerAnimation";
  late final AnimationController controller;
  late final Animation color;
  late final Animation high;
  late final Animation offset;
  StaggerAnimation({Key? key , required this.controller}) : super(key: key){
    color = ColorTween(
      begin:Colors.red,
      end: Colors.blue
    ).animate(CurvedAnimation(parent: controller, curve: Interval(0 , 0.6 , curve: Curves.ease)));

    high = Tween<double>(
        begin:0,
        end: 300
    ).animate(CurvedAnimation(parent: controller, curve: Interval(0 , 0.6 , curve: Curves.ease)));

    offset = Tween<EdgeInsets>(
        begin:EdgeInsets.only(left: 0),
        end: EdgeInsets.only(left: 100 , top: 100)
    ).animate(CurvedAnimation(parent: controller, curve: Interval(0.6 , 1 , curve: Curves.ease)));
  }

  Widget _buildAnimation(context , child){
    return Container(
      padding: offset.value,
      alignment: Alignment.center,
      child: Container(
        width: 50,
        height: high.value,
        color: color.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller, builder: _buildAnimation);
  }
}


class TestStaggerWidget extends StatefulWidget{
  const TestStaggerWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return TestStaggerState();
  }

}

class TestStaggerState extends State<TestStaggerWidget> with SingleTickerProviderStateMixin{
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this ,duration: Duration(seconds: 2));
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => _playAnimation(),
            child: Text("start animation"),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border.all()
            ),
            width: double.maxFinite,
            height: 500,
            child: StaggerAnimation(controller: controller,),
          ),
        ],
      ),
    );
  }

  void _playAnimation() async{
    try {
      await controller.forward().orCancel;
      await controller.reverse().orCancel;
    } on TickerCanceled catch (e) {
      Log.e(e);
    }
  }

}
