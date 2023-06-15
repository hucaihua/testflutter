import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:testflutter/model/api_response_entity.dart';

import '../http_code.dart';

///* @Author : Alex Hu
///* @Contact: hucaihua.lzu@gmail.com
///* @Date: on 2023-06-14 21:11
///* @Comment: check net is connected.
class NetworkInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options, handler) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return handler.reject(DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
          response: Response(
              requestOptions: options,
              data: ApiResponseEntity()
                ..code = HttpCode.ERROR_NETWORK
                ..message = "network error")));
    }
    return super.onRequest(options, handler);
  }
}
