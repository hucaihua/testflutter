import 'package:flutter/material.dart';

/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: AudoColorNavBar
/// @Date: on 2023-06-09 15:46
class AutoColorNavBar extends StatefulWidget {
  static const String sName = "AudoColorNavBar";

  final String title;
  final Color color;

  const AutoColorNavBar({Key? key,
    required this.color,
    required this.title,});

  @override
  AutoColorNavBarState createState() => AutoColorNavBarState();
}

class AutoColorNavBarState extends State<AutoColorNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 52,
        minWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        color: widget.color,
        boxShadow: [
          //阴影
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 3),
            blurRadius: 3,
          ),
        ],
      ),
      child: Text(
        widget.title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          //根据背景色亮度来确定Title颜色
          color: widget.color.computeLuminance() < 0.5 ? Colors.white : Colors.black,
        ),
      ),
      alignment: Alignment.center,
    );
  }
}