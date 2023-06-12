import 'package:flutter/material.dart';
import 'package:testflutter/widget/PointerDownListener.dart';

import '../common/P.dart';

/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: TestTouchPage
/// @Date: on 2023-06-12 10:01
class TestTouchPage extends StatefulWidget {
  static const String sName = "TestTouchPage";

  const TestTouchPage({super.key});

  @override
  TestTouchPageState createState() => TestTouchPageState();
}

class TestTouchPageState extends State<TestTouchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TestTouchPage"),
      ),
      body: Container(
        height: 500,
        width: 300,
        alignment: Alignment.center,
        child: Listener(
          child: Column(
            children: [
              Listener(
                child: AbsorbPointer(
                  child: TextButton(
                    onPressed: () {
                      Log.d("onPressed on TextButton");
                    },
                    child: Text("test touch"),
                  ),
                ),
                onPointerDown: (_) {
                  Log.d("on pointer on TextButton");
                },
              ),
              PointerDownListener(
                child: Text("child of touch"),
                onPointerDown: (event) {
                  Log.d("on pointer down");
                },
              ),
              Expanded(flex: 1, child: HitTestBehaviorTest()),
            ],
          ),
        ),
      ),
    );
  }
}

class HitTestBehaviorTest extends StatelessWidget {
  const HitTestBehaviorTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        wChild(1),
        wChild(2),
      ],
    );
  }

  /// 默认情况下behavior = HitTestBehavior.deferToChild ,由子renderObject决定是否命中测试
  /// 当设置为HitTestBehavior.translucent 时，hitTest = 子renderObject的 false ，但自身通过命中测试
  /// 当设置为HitTestBehavior.opaque 时，hitTest = true ,此时会阻断hitTestChildren
  Widget wChild(int index) {
    return Listener(
      // behavior: HitTestBehavior.opaque, // 放开此行，点击只会输出 2
      behavior: HitTestBehavior.translucent, // 放开此行，点击会同时输出 2 和 1
      onPointerDown: (e) => print(index),
      // onPointerUp: (e) => print(index),
      child: SizedBox.expand(),
    );

    // return Listener(
    //   behavior: HitTestBehavior.translucent, // 放开此行，点击只会输出 2
    //   onPointerDown: (e) => print(index),
    //   // onPointerUp: (e) => print(index),
    //   child: Text("$index"*10),
    // );
  }
}
