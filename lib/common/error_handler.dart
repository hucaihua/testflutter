///* @Author : Alex Hu
///* @Contact: hucaihua.lzu@gmail.com
///* @Date: on 2023-06-19 08:36
///* @Comment: ErrorHandler . global error handler . handleErrorByZone is a trigger to use zone or Dispatcher.onError to handle errors outside of render flow.

import 'dart:async';
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'Constants.dart';

bool handleErrorByZone = true;
const maxFrames = 50;

void handleError(void Function() app) {
  FlutterError.onError = (FlutterErrorDetails details) {
    if (C.isDebug) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      _handleError(details);
    }
  };

  if (!handleErrorByZone) {
    var platformError = PlatformDispatcher.instance.onError;
    PlatformDispatcher.instance.onError = (error, stack) {
      platformError?.call(error, stack);
      _reportError(error, stack);
      return true;
    };
  }

  ErrorWidget.builder = (FlutterErrorDetails details) {
    _handleError(details);
    return const Center(
      child: Text("Flutter running out..."),
    );
  };

  runZonedGuarded(app, (Object error, StackTrace stackTrace) async {
    await _reportError(error, stackTrace);
  });
}

void _handleError(FlutterErrorDetails details) {
  if (handleErrorByZone) {
    Zone.current.handleUncaughtError(details.exception, details.stack!);
  } else {
    _reportError(details.exception, details.stack!);
  }
}

Future<void> _reportError(Object error, StackTrace stackTrace) async {
  if (C.isDebug) {
    debugPrintStack(
      stackTrace: stackTrace,
      label: error.toString(),
      maxFrames: maxFrames,
    );
  } else {
    //todo report to server.
  }
}
