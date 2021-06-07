
import 'dart:async';

import 'package:flutter/services.dart';

class UnnamedAnon {
  static const MethodChannel _channel =
      const MethodChannel('unnamed_anon');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
