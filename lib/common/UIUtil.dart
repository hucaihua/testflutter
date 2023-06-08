import 'package:flutter/material.dart';

extension String2Color on String {
  Color toColor() {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) buffer.write('ff');
    buffer.write(replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

class UIUtil{
  static MaterialStateProperty<Color> buttonStyle(){
    return MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return "#ff063c91".toColor();
      } else if (states.contains(MaterialState.disabled)) {
        return "#509cf6".toColor();
      }
      return "#FF208FF9".toColor();
    });
  }

  static IconButton appBarLeading(BuildContext context){
    return IconButton(icon: Icon(Icons.arrow_back_rounded),
      color: Colors.white,
      onPressed: () {
        Navigator.pop(context);
      });
  }
}
