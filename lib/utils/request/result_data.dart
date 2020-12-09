///网络结果数据
class ResultData<T> {
  T data;
  bool result;
  int httpCode;
  String code;
  var headers;

  ResultData(this.data, this.result, this.httpCode, {this.code, this.headers});

  static ResultData<T> from<T>(ResultData resp, T _data){
    return new ResultData<T>(_data, resp.result, resp.httpCode, code: resp.code, headers: resp.headers);
  }
}
