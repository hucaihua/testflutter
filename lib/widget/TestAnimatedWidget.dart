/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: TestAnimatedWidget
/// @Date: on 2023-06-05 10:53
import 'package:flutter/material.dart';
import 'package:testflutter/common/P.dart';

class AnimatedWidgetsTest extends StatefulWidget {
  const AnimatedWidgetsTest({Key? key}) : super(key: key);

  @override
  _AnimatedWidgetsTestState createState() => _AnimatedWidgetsTestState();
}

class _AnimatedWidgetsTestState extends State<AnimatedWidgetsTest> {
  double _padding = 10;
  var _align = Alignment.topRight;
  double _height = 100;
  double _left = 0;
  Color _color = Colors.red;
  TextStyle _style = const TextStyle(color: Colors.black);
  Color _decorationColor = Colors.blue;
  double _opacity = 1;

  @override
  Widget build(BuildContext context) {
    var duration = const Duration(milliseconds: 400);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              setState(() {
                _padding = 20;
              });
            },
            child: AnimatedPadding(
              duration: duration,
              padding: EdgeInsets.all(_padding),
              child: const Text("AnimatedPadding"),
            ),
          ),
          SizedBox(
            height: 50,
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  duration: duration,
                  left: _left,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _left = 100;
                      });
                    },
                    child: const Text("AnimatedPositioned"),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 100,
            color: Colors.grey,
            child: AnimatedAlign(
              duration: duration,
              alignment: _align,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _align = Alignment.center;
                  });
                },
                child: const Text("AnimatedAlign"),
              ),
            ),
          ),
          AnimatedContainer(
            duration: duration,
            height: _height,
            color: _color,
            child: TextButton(
              onPressed: () {
                setState(() {
                  _height = 150;
                  _color = Colors.blue;
                });
              },
              child: const Text(
                "AnimatedContainer",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          AnimatedDefaultTextStyle(
            child: GestureDetector(
              child: const Text("hello world"),
              onTap: () {
                setState(() {
                  _style = const TextStyle(
                    color: Colors.blue,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationColor: Colors.blue,
                  );
                });
              },
            ),
            style: _style,
            duration: duration,
          ),
          AnimatedOpacity(
            opacity: _opacity,
            duration: duration,
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
              onPressed: () {
                setState(() {
                  _opacity = 0.2;
                });
              },
              child: const Text(
                "AnimatedOpacity",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ].map((e) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: e,
          );
        }).toList(),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant AnimatedWidgetsTest oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    Log.d("didUpdateWidget");
  }
}