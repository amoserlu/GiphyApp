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

class Language {
  Language();

  static Language? _current;

  static Language get current {
    assert(_current != null,
        'No instance of Language was loaded. Try to initialize the Language delegate before accessing Language.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Language> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Language();
      Language._current = instance;

      return instance;
    });
  }

  static Language of(BuildContext context) {
    final instance = Language.maybeOf(context);
    assert(instance != null,
        'No instance of Language present in the widget tree. Did you add Language.delegate in localizationsDelegates?');
    return instance!;
  }

  static Language? maybeOf(BuildContext context) {
    return Localizations.of<Language>(context, Language);
  }

  /// `Aplicación Giphy`
  String get appName {
    return Intl.message(
      'Aplicación Giphy',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Usuario`
  String get username {
    return Intl.message(
      'Usuario',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Entrar`
  String get login {
    return Intl.message(
      'Entrar',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Solo el usuario "user" es válido`
  String get userWarning {
    return Intl.message(
      'Solo el usuario "user" es válido',
      name: 'userWarning',
      desc: '',
      args: [],
    );
  }

  /// `Cambiar idioma`
  String get changeLanguage {
    return Intl.message(
      'Cambiar idioma',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Debes de intruducir el usuario "user "`
  String get tipUser {
    return Intl.message(
      'Debes de intruducir el usuario "user "',
      name: 'tipUser',
      desc: '',
      args: [],
    );
  }

  /// `Error al cargar los gif`
  String get errorGif {
    return Intl.message(
      'Error al cargar los gif',
      name: 'errorGif',
      desc: '',
      args: [],
    );
  }

  /// `Creado por:`
  String get createdBy {
    return Intl.message(
      'Creado por:',
      name: 'createdBy',
      desc: '',
      args: [],
    );
  }

  /// `Fuente:`
  String get source {
    return Intl.message(
      'Fuente:',
      name: 'source',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Language> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Language> load(Locale locale) => Language.load(locale);
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
