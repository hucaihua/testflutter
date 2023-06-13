import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testflutter/page/home_inherit_page.dart';
import 'package:testflutter/page/layout_page.dart';
import 'package:testflutter/page/login_page.dart';
import 'package:testflutter/page/test_animation_hero.dart';
import 'package:testflutter/page/test_animation_page.dart';
import 'package:testflutter/page/test_animation_page_2.dart';
import 'package:testflutter/page/test_touch_page.dart';

import 'future_page.dart';

/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: ThemeableApp
/// @Date: on 2023-06-10 12:23
class ThemeableApp extends StatefulWidget {
  static const String sName = "ThemeableApp";

  const ThemeableApp({super.key});

  @override
  ThemeableAppState createState() => ThemeableAppState();
}

class ThemeableAppState extends State<ThemeableApp> {
  var _themeColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: IconThemeData(color: _themeColor),
        appBarTheme: AppBarTheme(backgroundColor: _themeColor),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const MyHomePage(title: "HelloFlutter"),
        LoginPage.sName: (context) => const LoginPage(),
        LayoutPage.sName: (context) => const LayoutPage(),
        HomeInheritPage.sName: (context) => const HomeInheritPage(),
        FuturePage.sName: (context) => const FuturePage(),
        TestTouchPage.sName: (context) => const TestTouchPage(),
        TestAnimationPage.sName: (context) => const TestAnimationPage(),
        TestAnimationPage2.sName: (context) => const TestAnimationPage2(),
        TestAnimationHero.sName: (context) => const TestAnimationHero(),
      },
      initialRoute: "/",
    );
  }

  void updateThemeColor(MaterialColor red) {
    setState(() {
      _themeColor = red;
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController testController = TextEditingController();
  DateTime? _lastPressedAt;

  @override
  void initState() {
    super.initState();
    testController.text = "init";
    testController.selection =
        TextSelection(baseOffset: 0, extentOffset: testController.text.length);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt!) > Duration(seconds: 1)) {
          _lastPressedAt = DateTime.now();
          Fluttertoast.showToast(msg: "double tap exit the app");
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginPage.sName);
                },
                child: Text("testLogin"),
                style: ButtonStyle(
                    // foregroundColor: UIUtil.buttonStyle()
                    ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, LayoutPage.sName);
                },
                child: const Text("testLayout"),
                style: const ButtonStyle(
                    // foregroundColor: UIUtil.buttonStyle()
                    ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomeInheritPage.sName);
                },
                child: const Text("testHomeInheritPage"),
                style: const ButtonStyle(
                    // foregroundColor: UIUtil.buttonStyle()
                    ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, FuturePage.sName);
                },
                child: const Text("testFuture"),
                style: const ButtonStyle(
                  // foregroundColor: UIUtil.buttonStyle()
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, TestTouchPage.sName);
                },
                child: const Text("testTouch"),
                style: const ButtonStyle(
                    // foregroundColor: UIUtil.buttonStyle()
                    ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      //动画时间为500毫秒
                      pageBuilder: (BuildContext context, Animation<double> animation, Animation secondaryAnimation) {
                        return FadeTransition(
                          //使用渐隐渐入过渡,
                          opacity: animation,
                          child: TestAnimationPage(), //路由B
                        );
                      },
                    ),
                  );
                  // Navigator.pushNamed(context, TestAnimationPage.sName);
                },
                child: const Text("testAnimation"),
                style: const ButtonStyle(
                    // foregroundColor: UIUtil.buttonStyle()
                    ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, TestAnimationPage2.sName);
                },
                child: const Text("testAnimation2"),
                style: const ButtonStyle(
                  // foregroundColor: UIUtil.buttonStyle()
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, TestAnimationHero.sName);
                },
                child: const Text("testHero"),
                style: const ButtonStyle(
                  // foregroundColor: UIUtil.buttonStyle()
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              context.findAncestorStateOfType<ThemeableAppState>()?.updateThemeColor(Colors.cyan);
            });
          },
            child: Icon(Icons.palette)
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
