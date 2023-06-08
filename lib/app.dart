
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testflutter/common/UIUtil.dart';
import 'package:testflutter/page/home_inherit_page.dart';
import 'package:testflutter/page/home_page.dart';
import 'package:testflutter/page/layout_page.dart';
import 'package:testflutter/page/login_page.dart';
import 'package:testflutter/widget/ScrollStateInheritWidget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/"           :(context) => const MyHomePage(title: "HelloFlutter"),
        LoginPage.sName : (context) => const LoginPage(),
        LayoutPage.sName : (context) => const LayoutPage(),
        HomeInheritPage.sName : (context) => const HomeInheritPage(),
      },
      initialRoute: "/",
    );
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
  DateTime? _lastPressedAt  ;

  @override
  void initState() {
    super.initState();
    testController.text ="init";
    testController.selection = TextSelection(baseOffset: 0, extentOffset: testController.text.length);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        if (_lastPressedAt == null || DateTime.now().difference(_lastPressedAt!) > Duration(seconds: 1)) {
          _lastPressedAt = DateTime.now();
          Fluttertoast.showToast(msg: "double tap exit the app");
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, LoginPage.sName);
                },
                child: Text("testLogin") , style: ButtonStyle(
                  foregroundColor: UIUtil.buttonStyle()
              ),),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, LayoutPage.sName);
                },
                child: Text("testLayout") , style: ButtonStyle(
                  foregroundColor: UIUtil.buttonStyle()
              ),),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, HomeInheritPage.sName);
                },
                child: Text("testHome") , style: ButtonStyle(
                  foregroundColor: UIUtil.buttonStyle()
              ),),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}