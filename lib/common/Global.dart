import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';
import 'package:testflutter/common/log.dart';

import '../model/profile_entity.dart';
import '../page/entry_page.dart';
import '../page/future_page.dart';
import '../page/home_inherit_page.dart';
import '../page/layout_page.dart';
import '../page/login_page.dart';
import '../page/test_animation_hero.dart';
import '../page/test_animation_page.dart';
import '../page/test_animation_page_2.dart';
import '../page/test_io_page.dart';
import '../page/test_json.dart';
import '../page/test_touch_page.dart';

///* @Author : Alex Hu
///* @Date: on 2023-06-16 14:53
///* @Comment: Global

const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class Global {
  static ProfileEntity? profile;

  static List<MaterialColor> get themes => _themes;

  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SpUtil.getInstance();
    var profileString = SpUtil.getString("profile");
    if (profileString != null && profileString.isNotEmpty) {
      try {
        profile = ProfileEntity.fromJson(jsonDecode(profileString));
      } catch (e) {
        Log.e(e);
        profile = ProfileEntity()..theme = 0;
      }
    } else {
      profile = ProfileEntity()..theme = 0;
    }
  }

  static saveProfile() => SpUtil.putString("profile", profile.toString());

  static MaterialColor currentTheme() {
    return _themes[profile?.theme.clamp(0, _themes.length) ?? 0];
  }

  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    "/": (context) => const EntryPage(title: "Entry"),
    LoginPage.sName: (context) => const LoginPage(),
    LayoutPage.sName: (context) => const LayoutPage(),
    HomeInheritPage.sName: (context) => const HomeInheritPage(),
    FuturePage.sName: (context) => const FuturePage(),
    TestTouchPage.sName: (context) => const TestTouchPage(),
    TestAnimationPage.sName: (context) => const TestAnimationPage(),
    TestAnimationPage2.sName: (context) => const TestAnimationPage2(),
    TestAnimationHero.sName: (context) => const TestAnimationHero(),
    WebSocketRoute.sName: (context) => WebSocketRoute(),
    TestJson.sName: (context) => const TestJson(),
  };
}
