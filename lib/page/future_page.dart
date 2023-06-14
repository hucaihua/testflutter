import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:testflutter/common/log.dart';

/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: FuturePage
/// @Date: on 2023-06-11 11:13
///
final dio = Dio();

class FuturePage extends StatefulWidget {
  static const String sName = "FuturePage";

  const FuturePage({super.key});

  @override
  FuturePageState createState() => FuturePageState();
}

class FuturePageState extends State<FuturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FuturePage"),
      ),
      body: Container(
        width: double.maxFinite,
        height: 200,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
                future: query(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  var state = snapshot.connectionState;
                  if (state == ConnectionState.none) {
                    return Text("initial");
                  } else if (state == ConnectionState.waiting) {
                    return Text("waiting");
                  } else if (state == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Text("error");
                    } else {
                      return Text("success");
                    }
                  }else{
                    return Text("initial");
                  }
                }),
            TextButton.icon(onPressed: (){testStream();}, icon: Icon(Icons.query_builder ), label: Text("testStream")),
            TextButton.icon(onPressed: (){testFutures();}, icon: Icon(Icons.query_stats ), label: Text("testFuture")),

          ],
        ),
      ),
    );
  }

  Future<String?> query() async {
    final response = await dio.get<String>("https://httpbin.org/get");
    return response.data;
  }

  void testStream() {
    Stream.fromFutures([
      // 1秒后返回结果
      Future.delayed(Duration(seconds: 1), () {
        return "hello 1";
      }),
      // 抛出一个异常
      Future.delayed(Duration(seconds: 2),(){
        throw AssertionError("Error");
      }),
      // 3秒后返回结果
      Future.delayed(Duration(seconds: 3), () {
        return "hello 3";
      })
    ]).listen((data){
      print(data);
    }, onError: (e){
      print(e.message);
    },onDone: (){
      Log.d("all done");
    });
  }

  void testFutures() {
    Future.wait([
      // 1秒后返回结果
      Future.delayed(Duration(seconds: 1), () {
        return "hello 1";
      }),
      // 抛出一个异常
      Future.delayed(Duration(seconds: 2),(){
        return "hello 2";
      }),
      // 3秒后返回结果
      Future.delayed(Duration(seconds: 3), () {
        return "hello 3";
      })
    ]).then((data){
      print(data);
      Log.d("all done");
    }, onError: (e){
      print(e.message);
    });
  }
}
