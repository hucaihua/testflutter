import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'common/P.dart';

void reportErrorAndLog(Object exception, [StackTrace? stack]) {
  if (kDebugMode) {
    Log.e(exception);
    Log.e(stack);
  }
}

void main() {
  var onError = FlutterError.onError;
  FlutterError.onError = (FlutterErrorDetails details){
    // onError?.call(details);
    reportErrorAndLog(details.exception , details.stack);
  };

  var platformError = PlatformDispatcher.instance.onError;
  PlatformDispatcher.instance.onError = (error , stack){
    platformError?.call(error , stack);
    reportErrorAndLog(error , stack);
    return true;
  };
  
  // runZonedGuarded(() {
  //   runApp(const MyApp());
  // }, (error, stack) {
  //   reportErrorAndLog(FlutterErrorDetails(exception: error ,stack: stack));
  // });

  runApp(const MyApp());
}




