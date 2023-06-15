import 'package:dio/dio.dart';
import 'package:testflutter/common/Constants.dart';

import '../../common/sp_util.dart';

///* @Author : Alex Hu
///* @Contact: hucaihua.lzu@gmail.com
///* @Date: on 2023-06-14 21:11
///* @Comment: add verify token
class TokenInterceptors extends InterceptorsWrapper {
  String? _token;

  @override
  onRequest(RequestOptions options, handler) async {
    if (_token == null) {
      var authorizationCode = await getAuthorization();
      if (authorizationCode != null) {
        _token = authorizationCode;
      }
    }
    if(_token != null) {
      options.headers["Authorization"] = _token;
    }
    return super.onRequest(options, handler);
  }

  @override
  onResponse(Response response, handler) async {
    try {
      var responseJson = response.data;
      if (response.statusCode == 201 && responseJson["token"] != null) {
        _token = 'token ${responseJson["token"]}';
        await SpUtil.putString(C.TOKEN_KEY, _token!);
      }
    } catch (e) {
      print(e);
    }
    return super.onResponse(response, handler);
  }

  ///清除授权
  clearAuthorization() {
    _token = null;
    SpUtil.remove(C.TOKEN_KEY);
  }

  ///获取授权token
  getAuthorization() async {
    String? token = SpUtil.getString(C.TOKEN_KEY);
    if (token == null) {
      String? basic = SpUtil.getString(C.BASIC_CODE);
      if (basic == null) {
        //todo login failed.
      } else {
        return "Basic $basic";
      }
    } else {
      _token = token;
      return token;
    }
  }
}
