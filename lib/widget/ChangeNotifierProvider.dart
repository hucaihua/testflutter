import 'package:flutter/material.dart';

import '../common/log.dart';
import 'InheritProvider.dart';

/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: rebuild InheritWidget when model changes by call update.
/// @Date: on 2023-06-08 20:57
/// 注意泛型的传递，需要在widget树和初始化时候传递，否则会找不到对应的provider
class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  final T data;
  final Widget child;
  static const String sName = "ChangeNotifierProvider";

  //防止仅需要使用的地方发生刷新。
  static T? of<T>(BuildContext context, {bool listen = true}) {
    final provider = listen
        ? context.dependOnInheritedWidgetOfExactType<InheritProvider<T>>()
        : context.getElementForInheritedWidgetOfExactType<InheritProvider<T>>()?.widget as InheritProvider<T>;
    return provider?.data;
  }

  const ChangeNotifierProvider(
      {super.key, required this.data, required this.child});

  @override
  ChangeNotifierProviderState<T> createState() => ChangeNotifierProviderState<T>();
}

class ChangeNotifierProviderState<T extends ChangeNotifier> extends State<ChangeNotifierProvider<T>> {
  @override
  void initState() {
    super.initState();
    widget.data.addListener(update);
  }

  @override
  Widget build(BuildContext context) {
    return InheritProvider<T>(data: widget.data, child: widget.child);
  }

  void update() {
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant ChangeNotifierProvider<T> oldWidget) {
    if (oldWidget.data != widget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
    widget.data.removeListener(update);
  }
}
