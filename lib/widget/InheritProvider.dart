import 'package:flutter/cupertino.dart';

import '../common/P.dart';

/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: HomePage
/// @Date: on 2023-06-05 10:53
class InheritProvider<T> extends InheritedWidget{
  final T data;
  const InheritProvider({super.key, required this.data, required super.child });

  @override
  bool updateShouldNotify(covariant InheritProvider oldWidget) {
    return oldWidget.data != data;
  }
}