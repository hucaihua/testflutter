import 'package:flutter/material.dart';
import 'package:testflutter/common/Global.dart';

import 'app.dart';
import 'common/Constants.dart';
import 'common/error_handler.dart';

void main() {
  C.showPerformance(show: false);

  handleError(() => Global.init().whenComplete(() => runApp(const MyApp())));
}
