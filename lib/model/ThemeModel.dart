import 'package:flutter/material.dart';
import 'package:testflutter/model/ProfileModel.dart';

import '../common/Global.dart';
import '../common/log.dart';

///* @Author : Alex Hu
///* @Contact: hucaihua.lzu@gmail.com
///* @Date: on 2023-06-16 16:27
///* @Comment: ThemeModel
/// ```dart
///```
class ThemeModel extends ProfileModel{
  MaterialColor get theme => Global.themes
      .firstWhere((e) => e.value == profile?.theme, orElse: () => Colors.blue);

  bool get darkMode => profile?.isDarkMode == true;

  set theme(MaterialColor color) {
    Log.d("change theme : $color");
    if (color != theme) {
      profile?.theme = color[500]!.value;
      notifyListeners();
    }
  }

  set darkMode(bool isDark){
    if(profile?.isDarkMode != isDark){
      profile?.isDarkMode = isDark;
      notifyListeners();
    }
  }
}