import 'dart:convert';

/// 路由参数转换类
class ConvertParamUtil{
  /// 传递中文参数前，先转换，fluro 不支持中文传递
  String cnParamsEncode(String originalCn) {
    return jsonEncode(Utf8Encoder().convert(originalCn));
  }

  /// 传递后取出参数，解析
  String cnParamsDecode(String encodeCn) {
    var list = List<int>();

    ///字符串解码
    jsonDecode(encodeCn).forEach(list.add);
    String value = Utf8Decoder().convert(list);
    return value;
  }

  /// string 转为 int
  int string2int(String str) {
    return int.parse(str);
  }

  /// string 转为 double
  double string2double(String str) {
    return double.parse(str);
  }

  /// string 转为 bool
  bool string2bool(String str) {
    if (str == 'true') {
      return true;
    } else {
      return false;
    }
  }

  /// object 转为 string json
  String object2string<T>(T t) {
    return cnParamsEncode(jsonEncode(t));
  }

  /// string json 转为 map
  Map<String, dynamic> string2map(String str) {
    return json.decode(cnParamsDecode(str));
  }

}