import 'package:flutter/cupertino.dart';

import '../common/log.dart';

// a helper widget to print constraints.
class ConstraintPrinterWidget<T> extends StatelessWidget{
  final T? tag;

  final Widget child;

  const ConstraintPrinterWidget({super.key , required this.tag , required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints){
      assert(() {
        Log.v('${tag ?? key ?? child}: $constraints');
        return true;
      }());
      return child;
    });
  }

}