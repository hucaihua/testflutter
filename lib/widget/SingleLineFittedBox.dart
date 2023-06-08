import 'package:flutter/cupertino.dart';

class SingleLineFittedBox extends StatelessWidget{
  final Widget? child;

  const SingleLineFittedBox({super.key , this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_ , constraints){
      return FittedBox(
        child: ConstrainedBox(
          constraints: constraints.copyWith(maxWidth: constraints.maxWidth),
          child: child,
        ),
      );
    });
  }

}