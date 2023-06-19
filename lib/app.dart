import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:testflutter/common/Global.dart';

import '../generated/l10n.dart';
import '../model/ThemeModel.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ThemeApp();
  }
}

class ThemeApp extends StatefulWidget {
  static const String sName = "ThemeApp";

  const ThemeApp({super.key});

  @override
  ThemeAppState createState() => ThemeAppState();
}

class ThemeAppState extends State<ThemeApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeModel())],
      child: Consumer<ThemeModel>(
        builder: (context, themeModel, child) {
          return MaterialApp(
            onGenerateTitle: (context) => S.of(context).appName,
            localizationsDelegates: const [
              S.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: ThemeData(
              appBarTheme:
                  AppBarTheme(color: Provider.of<ThemeModel>(context, listen: false).profile?.isDarkMode == false ? themeModel.theme : Colors.black),
              colorScheme: Provider.of<ThemeModel>(context, listen: false).profile?.isDarkMode == false
                  ? ColorScheme.light(primary: themeModel.theme)
                  : ColorScheme.dark(primary: themeModel.theme),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(),
            routes: Global.routes,
            initialRoute: "/",
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
