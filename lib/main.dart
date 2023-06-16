import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:testflutter/common/Global.dart';

import 'app.dart';
import 'common/log.dart';

void reportErrorAndLog(Object exception, [StackTrace? stack]) {
  if (kDebugMode) {
    Log.e(exception);
    Log.e(stack);
  }
}

void main() {

  //  debugProfileBuildsEnabled = true;
//  debugPaintLayerBordersEnabled = true;
//  debugProfilePaintsEnabled = true;
//  debugRepaintRainbowEnabled = true;
  var onError = FlutterError.onError;
  FlutterError.onError = (FlutterErrorDetails details) {
    onError?.call(details);
    reportErrorAndLog(details.exception, details.stack);
  };

  var platformError = PlatformDispatcher.instance.onError;
  PlatformDispatcher.instance.onError = (error, stack) {
    platformError?.call(error, stack);
    reportErrorAndLog(error, stack);
    return true;
  };

  Global.init().whenComplete(() => runApp(const MyApp()));
}

