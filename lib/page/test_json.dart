import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:testflutter/common/P.dart';
import 'package:testflutter/generated/json/base/json_convert_content.dart';
import 'package:testflutter/model/http_bin_entity.dart';

/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: TestJson
/// @Date: on 2023-06-14 15:11
class TestJson extends StatefulWidget {
  static const String sName = "TestJson";

  const TestJson({super.key});

  @override
  TestJsonState createState() => TestJsonState();
}

class TestJsonState extends State<TestJson> {
  var _name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TestJson"),
      ),
      body: Container(
        child: Column(
          children: [
            Text("name = ${_name}"),
            TextButton(child: Text("json"),onPressed: (){
              testJson();
            },)
          ],
        ),
      ),
    );
  }

  void testJson() {
    var jsonInput = """
    {
  "args": {
    "name": "caihua"
  }, 
  "headers": {
    "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7", 
    "Accept-Encoding": "gzip, deflate, br", 
    "Accept-Language": "zh-CN,zh;q=0.9", 
    "Host": "httpbin.org", 
    "Sec-Ch-Ua": "\\"Not.A/Brand\\";v=\\"8\\", \\"Chromium\\";v=\\"114\\", \\"Google Chrome\\";v=\\"114\\"", 
    "Sec-Ch-Ua-Mobile": "?0", 
    "Sec-Ch-Ua-Platform": "\\"macOS\\"", 
    "Sec-Fetch-Dest": "document", 
    "Sec-Fetch-Mode": "navigate", 
    "Sec-Fetch-Site": "none", 
    "Sec-Fetch-User": "?1", 
    "Upgrade-Insecure-Requests": "1", 
    "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36", 
    "X-Amzn-Trace-Id": "Root=1-648968a3-04033ffa794120bc0401d074"
  }, 
  "origin": "34.216.166.165", 
  "url": "https://httpbin.org/get?name=caihua"
}
    """;
    // HttpBinEntity entity = HttpBinEntity.fromJson(json.decode(jsonString));
    // Log.d(entity.toJson());
    // setState(() {
    //   _name = entity.headers?.host ?? "default";
    // });

    Log.d("before ==> ${jsonInput}");

    HttpBinEntity? entity = HttpBinEntity.fromJson(jsonDecode(jsonInput));

    setState(() {
      _name = entity?.headers?.host ?? "default";
    });
  }
}