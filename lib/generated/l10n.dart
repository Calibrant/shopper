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

  /// `Сделай жизнь проще`
  String get logo_title {
    return Intl.message(
      'Сделай жизнь проще',
      name: 'logo_title',
      desc: '',
      args: [],
    );
  }

  /// `Электронная почта не может быть пустой`
  String get email_empty {
    return Intl.message(
      'Электронная почта не может быть пустой',
      name: 'email_empty',
      desc: '',
      args: [],
    );
  }

  /// `Неверный адрес электронной почты`
  String get invalid_email {
    return Intl.message(
      'Неверный адрес электронной почты',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Авторизация`
  String get auth_title {
    return Intl.message(
      'Авторизация',
      name: 'auth_title',
      desc: '',
      args: [],
    );
  }

  /// `Введите email`
  String get enter_email {
    return Intl.message(
      'Введите email',
      name: 'enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Введите пароль`
  String get enter_password {
    return Intl.message(
      'Введите пароль',
      name: 'enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Wish Swish`
  String get appbar_title_WS {
    return Intl.message(
      'Wish Swish',
      name: 'appbar_title_WS',
      desc: '',
      args: [],
    );
  }

  /// `Каталог`
  String get catalog_title {
    return Intl.message(
      'Каталог',
      name: 'catalog_title',
      desc: '',
      args: [],
    );
  }

  /// `Оплатить`
  String get button_pay {
    return Intl.message(
      'Оплатить',
      name: 'button_pay',
      desc: '',
      args: [],
    );
  }

  /// `Итого`
  String get total_title {
    return Intl.message(
      'Итого',
      name: 'total_title',
      desc: '',
      args: [],
    );
  }

  /// `История покупок`
  String get purchasing_history_title {
    return Intl.message(
      'История покупок',
      name: 'purchasing_history_title',
      desc: '',
      args: [],
    );
  }

  /// `Заказ`
  String get order_title {
    return Intl.message(
      'Заказ №',
      name: 'order_title',
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
      Locale.fromSubtags(languageCode: 'ru'),
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
