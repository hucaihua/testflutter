///* @Author : Alex Hu
///* @Date: on 2023-06-19 08:36
///* @Comment: ErrorHandler . global error handler . handleErrorByZone is a trigger to use zone or Dispatcher.onError to handle errors outside of render flow.

import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../widget/GlobalErrorWidget.dart';
import 'Constants.dart';
import 'log.dart';

bool handleErrorByZone = false;
const maxFrames = 20;

void handleError(void Function() app) {
  ErrorWidget.builder = (_) => const GlobalErrorWidget();

  FlutterError.onError = (error) => _handleError(error.exception, error.stack);

  if (handleErrorByZone) {
    runZonedGuarded(app, (error, stackTrace) async {
      await _reportError(error, stackTrace);
    });
  } else {
    PlatformDispatcher.instance.onError = _handleError;
    app.call();
  }
}

bool _handleError(Object error, StackTrace? stackTrace) {
  stackTrace = stackTrace ?? StackTrace.empty;
  if (handleErrorByZone) {
    Zone.current.handleUncaughtError(error, stackTrace);
  } else {
    _reportError(error, stackTrace);
  }
  return true;
}

Future<void> _reportError(Object error, StackTrace stackTrace) async {
  if (C.isDebug) {
    Log.e(stackTrace.toString());
    debugPrintStack(
      stackTrace: stackTrace,
      label: error.toString(),
      maxFrames: maxFrames,
    );

  } else {
    //todo report to server.
  }
}
