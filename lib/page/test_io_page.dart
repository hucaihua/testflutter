import 'package:flutter/material.dart';
import 'package:testflutter/common/log.dart';
import 'package:testflutter/common/platform_util.dart';
import 'package:testflutter/model/user_entity.dart';
import 'package:testflutter/net/api.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketRoute extends StatefulWidget {
  static const String sName = "WebSocketRoute";

  @override
  _WebSocketRouteState createState() => _WebSocketRouteState();
}

class _WebSocketRouteState extends State<WebSocketRoute> {
  TextEditingController _controller = TextEditingController();
  late IOWebSocketChannel channel;
  String _text = "";


  @override
  void initState() {
    super.initState();
    //创建websocket连接
    if (PlatformUtil.isWeb) {
      // channel = HtmlWebSocketChannel.connect('wss://echo.websocket.events');
    }
    channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebSocket(内容回显)"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Send a message'),
              ),
            ),
            StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                //网络不通会走到这
                if (snapshot.hasError) {
                  _text = "网络不通...";
                } else if (snapshot.hasData) {
                  _text = "echo: " + snapshot.data;
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(_text),
                );
              },
            ),
            TextButton.icon(
                onPressed: () {
                  testHttp();
                },
                icon: Icon(Icons.network_wifi_3_bar_outlined),
                label: Text("testHttp"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: Icon(Icons.send),
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  Future<void> testHttp() async {
    var response = await  Api.client.queryTest("ljasdf183ds" , "test" , "abcd" , 100);
    Log.d(response.toJson());
    // Api.client.testPostUser(UserEntity()
    //   ..name = "caihua"
    //   ..id = "1234");
  }
}