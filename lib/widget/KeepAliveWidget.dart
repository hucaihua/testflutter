import 'package:flutter/material.dart';

/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: HomePage
/// @Date: on 2023-06-06 14:51
class KeepAliveWidget extends StatefulWidget {
  static const String sName = "KeepAliveWidget";

  final bool keepAlive;
  final Widget child;
  const KeepAliveWidget({super.key  , this.keepAlive = true , required this.child});

  @override
  KeepAliveWidgetState createState() => KeepAliveWidgetState();
}

class KeepAliveWidgetState extends State<KeepAliveWidget> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  void didUpdateWidget(covariant KeepAliveWidget oldWidget) {
    if(oldWidget.keepAlive != widget.keepAlive) {
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}