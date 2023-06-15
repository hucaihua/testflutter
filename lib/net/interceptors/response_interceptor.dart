import 'package:dio/dio.dart';
import 'package:testflutter/common/log.dart';
import 'package:testflutter/model/api_response_entity.dart';
import 'package:testflutter/net/http_code.dart';

///* @Author : Alex Hu
///* @Contact: hucaihua.lzu@gmail.com
///* @Date: on 2023-06-14 21:11
///* @Comment: check response.
class ResponseInterceptors extends InterceptorsWrapper {
  @override
  onResponse(Response response, handler) async {
    RequestOptions option = response.requestOptions;
    var value = ApiResponseEntity()..data = response.data;
    try {
      var header = response.headers[Headers.contentTypeHeader];
      if ((header != null && header.toString().contains("text"))) {
        value.code = HttpCode.SUCCESS;
      } else if (response.statusCode! >= HttpCode.SUCCESS && response.statusCode! < 300) {
        value
          ..headers = response.headers
          ..code = HttpCode.SUCCESS;
      }
    } catch (e) {
      Log.e(e.toString() + option.path);
      value
        ..headers = response.headers
        ..code = response.statusCode;
    }
    response.data = value;
    return handler.next(response);
  }
}
