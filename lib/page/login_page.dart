import 'package:flutter/material.dart';

import '../common/log.dart';
import '../common/UIUtil.dart';

class LoginPage extends StatefulWidget {
  static const String sName = "LoginPage";

  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginPage> {
  final GlobalKey _globalKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    throw const FormatException("test exception");
    return Scaffold(
        appBar: AppBar(
          leading: UIUtil.appBarLeading(context),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("login"),
        ),
        body: Form(
            key: _globalKey,
            child: Column(
              children: [
                TextFormField(
                  autofocus: true,
                  controller: userNameController,
                  decoration: InputDecoration(
                      labelText: "Username",
                      hintText: "input your name",
                      icon: Icon(Icons.person)),
                  validator: (v) {
                    return v!.trim().isNotEmpty
                        ? null
                        : "user name can not be null";
                  },
                ),
                TextFormField(
                  autofocus: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                      labelText: "password",
                      hintText: "input your password",
                      icon: Icon(Icons.lock)),
                  obscureText: true,
                  validator: (v) {
                    return v!.trim().length > 8
                        ? null
                        : "password must more than 8";
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      FormState formState = _globalKey.currentState as FormState;
                      if (formState.validate()) {
                        Log.d("user: ${userNameController.text} , pass:${passwordController.text}");
                      }
                    },
                    child: Text("login"),
                  ),
                ),
              ],
            )));
  }
}
