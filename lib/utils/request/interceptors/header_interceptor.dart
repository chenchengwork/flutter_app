import 'package:dio/dio.dart';

///header拦截器
class HeaderInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    ///超时
    options.connectTimeout = 30000;   // 30s
    options.receiveTimeout = 30000;   // 30s

    return options;
  }
}
