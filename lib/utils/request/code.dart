import 'package:flutter_app/utils/event/http_error_event.dart';
//import 'package:flutter_app/utils/event/index.dart';
import 'package:flutter_app/utils/T.dart';

///错误编码
class Code {
  ///网络错误
  static const NETWORK_ERROR = -1;

  ///网络超时
  static const NETWORK_TIMEOUT = -2;

  ///网络返回数据格式化一次
  static const NETWORK_JSON_EXCEPTION = -3;

  ///Github APi Connection refused
  static const GITHUB_API_REFUSED = -4;

  static const SUCCESS = 200;

  static const RESP_SUCCESS_CODE = "success";   //
  static const RESP_ERROR_CODE = 0;

  static errorHandleFunction(code, message, noTip) {
    if (noTip) {
      return message;
    }
    if(message != null && message is String && (message.contains("Connection refused") || message.contains("Connection reset"))) {
      code = GITHUB_API_REFUSED;
    }

//    sEventBus.fire(new HttpErrorEvent(code, message));
    T.eventBus.fire(new HttpErrorEvent(code, message));
    return message;
  }
}
