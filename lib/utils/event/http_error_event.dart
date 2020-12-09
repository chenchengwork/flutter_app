/// http错误事件
class HttpErrorEvent {
  final int code;

  final String message;

  HttpErrorEvent(this.code, this.message);
}
