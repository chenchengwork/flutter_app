import 'package:dio/dio.dart';
import '../code.dart';
import '../result_data.dart';

///Token拦截器
class ResponseInterceptors extends InterceptorsWrapper {
  @override
  onResponse(Response response) async {
    RequestOptions option = response.request;
    var value;
    try {
      var header = response.headers[Headers.contentTypeHeader];
      if ((header != null && header.toString().contains("text"))) {
        value = new ResultData(response.data, true, Code.SUCCESS);
      } else if (response.statusCode >= 200 && response.statusCode < 300) {
        /*
          处理response.data的数据格式为{"code": "success", "message": "", "data": ""}的数据
         */
        if(response.data is Map && response.data.containsKey("code")){
          if(response.data["code"] == Code.RESP_SUCCESS_CODE){
            value = new ResultData(response.data["data"], true, Code.SUCCESS,
                headers: response.headers);
          } else {
            value = new ResultData(response.data["data"], false, Code.RESP_ERROR_CODE,
                headers: response.headers);
          }
        }else{
          value = new ResultData(response.data, true, Code.SUCCESS,
              headers: response.headers);
        }
      }
    } catch (e) {
      print(e.toString() + option.path);
      value = new ResultData(response.data, false, response.statusCode,
          headers: response.headers);
    }

    return value;
  }
}
