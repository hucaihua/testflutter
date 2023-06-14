/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: TestTurnBox
/// @Date: on 2023-06-05 10:53
import 'package:flutter/material.dart';

import 'TurnBox.dart';

class TurnBoxRoute extends StatefulWidget {
  const TurnBoxRoute({Key? key}) : super(key: key);

  @override
  _TurnBoxRouteState createState() => _TurnBoxRouteState();
}

class _TurnBoxRouteState extends State<TurnBoxRoute> {
  double _turns = .0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TurnBox(
            turns: _turns,
            speed: 500,
            child: const Icon(
              Icons.refresh,
              size: 50,
            ),
          ),
          TurnBox(
            turns: _turns,
            speed: 1000,
            child: const Icon(
              Icons.refresh,
              size: 150.0,
            ),
          ),
          ElevatedButton(
            child: const Text("顺时针旋转1/5圈"),
            onPressed: () {
              setState(() {
                _turns += .2;
              });
            },
          ),
          ElevatedButton(
            child: const Text("逆时针旋转1/5圈"),
            onPressed: () {
              setState(() {
                _turns -= .2;
              });
            },
          )
        ],
      ),
    );
  }
}