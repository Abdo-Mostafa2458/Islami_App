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

  /// `Islami`
  String get app_title {
    return Intl.message(
      'Islami',
      name: 'app_title',
      desc: '',
      args: [],
    );
  }

  /// `verses Name`
  String get verses_Name {
    return Intl.message(
      'verses Name',
      name: 'verses_Name',
      desc: '',
      args: [],
    );
  }

  /// `verses Number`
  String get verses_Number {
    return Intl.message(
      'verses Number',
      name: 'verses_Number',
      desc: '',
      args: [],
    );
  }

  /// `Quran`
  String get quran_tab {
    return Intl.message(
      'Quran',
      name: 'quran_tab',
      desc: '',
      args: [],
    );
  }

  /// `Hadeth`
  String get hadeth_tab {
    return Intl.message(
      'Hadeth',
      name: 'hadeth_tab',
      desc: '',
      args: [],
    );
  }

  /// `Sebha`
  String get sebha_tab {
    return Intl.message(
      'Sebha',
      name: 'sebha_tab',
      desc: '',
      args: [],
    );
  }

  /// `Radio`
  String get radio_tab {
    return Intl.message(
      'Radio',
      name: 'radio_tab',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings_tab {
    return Intl.message(
      'Settings',
      name: 'settings_tab',
      desc: '',
      args: [],
    );
  }

  /// `Hadeth`
  String get alHadeth {
    return Intl.message(
      'Hadeth',
      name: 'alHadeth',
      desc: '',
      args: [],
    );
  }

  /// `Number_of_praises`
  String get number_of_praises {
    return Intl.message(
      'Number_of_praises',
      name: 'number_of_praises',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
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
