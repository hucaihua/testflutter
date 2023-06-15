import 'package:dio/dio.dart';

import '../../common/Constants.dart';

///* @Author : Alex Hu
///* @Contact: hucaihua.lzu@gmail.com
///* @Date: on 2023-06-14 21:11
///* @Comment: check net is connected.
class RequestOptionInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options, handler) async {
    options.connectTimeout = const Duration(seconds: C.connection_time_out_in_seconds);
    options.receiveTimeout = const Duration(seconds: C.connection_time_out_in_seconds);

    return super.onRequest(options, handler);
  }
}
