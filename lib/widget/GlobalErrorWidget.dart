import 'package:flutter/material.dart';

///* @Author : Alex Hu
///* @Date: on 2023-06-19 10:03
///* @Comment: global ErrorWidget

class GlobalErrorWidget extends StatelessWidget {
  static const String sName = "ErrorWidget";

  const GlobalErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      // ,
      child: TextButton.icon(
        icon: const Icon(
          Icons.refresh,
          color: Colors.black38,
        ),
        label: const Text("Flutter running out...", style: TextStyle(fontSize: 15, color: Colors.black38)),
        onPressed: () {},
      ),
    );
  }
}
