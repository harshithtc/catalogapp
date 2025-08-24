import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

// Pick base URL dynamically
String getBaseUrl() {
  if (kIsWeb) {
    return 'http://127.0.0.1:8000'; // Flutter web
  } else if (Platform.isAndroid) {
    return 'http://10.0.2.2:8000'; // Android emulator
  } else if (Platform.isIOS || Platform.isMacOS) {
    return 'http://127.0.0.1:8000'; // iOS/desktop
  } else {
    return 'http://127.0.0.1:8000'; // fallback
  }
}

final String kApiBase = getBaseUrl();
