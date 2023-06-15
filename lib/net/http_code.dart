///* @Author : Alex Hu
///* @Contact: hucaihua.lzu@gmail.com
///* @Date: on 2023-06-14 21:11
///* @Comment: error code for http request.

class HttpCode {
  ///网络错误
  static const ERROR_NETWORK = -1;

  ///网络超时
  static const ERROR_NETWORK_TIMEOUT = -2;

  ///网络返回数据格式化一次
  static const ERROR_NETWORK_JSON_EXCEPTION = -3;

  static const ERROR_REFUSED = -4;

  static const SUCCESS = 200;

  static errorHandleFunction(code, message, noTip) {
    if (noTip) {
      return message;
    }
    if(message != null && message is String && (message.contains("Connection refused") || message.contains("Connection reset"))) {
      code = ERROR_REFUSED;
    }

    return message;
  }
}
