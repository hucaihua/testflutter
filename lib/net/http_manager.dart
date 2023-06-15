import 'package:dio/dio.dart';

import 'api.dart';
import 'interceptors/log_interceptor.dart';
import 'interceptors/network_interceptor.dart';
import 'interceptors/request_option_interceptor.dart';
import 'interceptors/response_interceptor.dart';
import 'interceptors/token_interceptor.dart';

///* @Author : Alex Hu
///* @Contact: hucaihua.lzu@gmail.com
///* @Date: on 2023-06-15 11:05
///* @Comment: HttpManager
/// ```dart
/// var response = await  HttpManager.get().queryTest("ljasdf183ds" , "test" , "abcd" , 100);
///     Log.d(response.toJson());
///```
///* Notice !! dio use BackgroundTransformer to transformer application/json to map ,
/// thus only the first level of json will be transform to map.
/// for example: the following data will only be transform to a string.
/// ```dart
/// {
///    "args": {},
///   "data": "{\"id\":\"1234\",\"name\":\"caihua\",\"age\":0}",
///   "files": {},
///   "form": {},
///   "headers": {
///     "Accept-Encoding": "gzip",
///     "Authorization": "",
///     "Content-Length": "37",
///     "Content-Type": "application/json",
///     "Host": "httpbin.org",
///     "User-Agent": "Dart/3.0 (dart:io)",
///     "X-Amzn-Trace-Id": "Root=1-648ac2b1-55289fd979a72007220c3ecc"
///   },
///   "json": {
///     "age": 0,
///     "id": "1234",
///     "name": "xxx"
///   },
///   "origin": "27.42.99.20",
///   "url": "http://httpbin.org/post"
/// }
/// ```
class HttpManager {
  static late final Retrofit _client;
  static final _dio = Dio();

  static HttpManager? instance;

  HttpManager._();

  static Retrofit get() {
    if (instance == null) {
      instance = HttpManager._();
      _dio.interceptors.add(NetworkInterceptors());
      _dio.interceptors.add(RequestOptionInterceptors());
      _dio.interceptors.add(TokenInterceptors());
      _dio.interceptors.add(LogsInterceptors());
      _dio.interceptors.add(ResponseInterceptors());
      _client = Retrofit(_dio);
    }
    return _client;
  }
}
