import 'package:event_bus/event_bus.dart';
import 'local/local_storage.dart';
import 'request/httpClient.dart';
import 'event/index.dart';

class T {
  static final LocalStorage localStorage = sLocalStorage;

  static final HttpClient httpClient = sHttpClient;

  static final EventBus eventBus = sEventBus;
}
