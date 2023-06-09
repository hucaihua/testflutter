import 'package:flutter/material.dart';

import 'ChangeNotifierProvider.dart';

/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: HomePage
/// @Date: on 2023-06-09 10:56
typedef ConsumerBuilder<T> = Widget Function(BuildContext context , T? value);

class Consumer<T> extends StatelessWidget {

  static const String sName = "Consumer";

  ConsumerBuilder<T> builder;

  Consumer({super.key , required this.builder});

  @override
  Widget build(BuildContext context) {
    return builder(context , ChangeNotifierProvider.of<T>(context));
  }
}
