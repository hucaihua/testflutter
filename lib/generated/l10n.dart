// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `testFlutter`
  String get appName {
    return Intl.message(
      'testFlutter',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `testAnimation`
  String get testAnimation {
    return Intl.message(
      'testAnimation',
      name: 'testAnimation',
      desc: '',
      args: [],
    );
  }

  /// `testAnimation2`
  String get testAnimation2 {
    return Intl.message(
      'testAnimation2',
      name: 'testAnimation2',
      desc: '',
      args: [],
    );
  }

  /// `testFuture`
  String get testFuture {
    return Intl.message(
      'testFuture',
      name: 'testFuture',
      desc: '',
      args: [],
    );
  }

  /// `testHero`
  String get testHero {
    return Intl.message(
      'testHero',
      name: 'testHero',
      desc: '',
      args: [],
    );
  }

  /// `testHomeInheritPage`
  String get testHomeInheritPage {
    return Intl.message(
      'testHomeInheritPage',
      name: 'testHomeInheritPage',
      desc: '',
      args: [],
    );
  }

  /// `testio`
  String get testio {
    return Intl.message(
      'testio',
      name: 'testio',
      desc: '',
      args: [],
    );
  }

  /// `testjson`
  String get testjson {
    return Intl.message(
      'testjson',
      name: 'testjson',
      desc: '',
      args: [],
    );
  }

  /// `testLayout`
  String get testLayout {
    return Intl.message(
      'testLayout',
      name: 'testLayout',
      desc: '',
      args: [],
    );
  }

  /// `testLogin`
  String get testLogin {
    return Intl.message(
      'testLogin',
      name: 'testLogin',
      desc: '',
      args: [],
    );
  }

  /// `testTouch`
  String get testTouch {
    return Intl.message(
      'testTouch',
      name: 'testTouch',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
