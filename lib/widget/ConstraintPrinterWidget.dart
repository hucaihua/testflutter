import 'package:flutter/cupertino.dart';

import '../common/P.dart';

// a helper widget to print constraints.
class ConstraintPrinterWidget<T> extends StatelessWidget{
  final T? tag;

  final Widget child;

  const ConstraintPrinterWidget({super.key , required this.tag , required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints){
      assert(() {
        P.v('${tag ?? key ?? child}: $constraints');
        return true;
      }());
      return child;
    });
  }

}