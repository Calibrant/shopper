// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appbar_title_WS": MessageLookupByLibrary.simpleMessage("Wish Swish"),
        "auth_title": MessageLookupByLibrary.simpleMessage("Авторизация"),
        "button_pay": MessageLookupByLibrary.simpleMessage("Оплатить"),
        "catalog_title": MessageLookupByLibrary.simpleMessage("Каталог"),
        "email_empty": MessageLookupByLibrary.simpleMessage(
            "Электронная почта не может быть пустой"),
        "enter_email": MessageLookupByLibrary.simpleMessage("Введите email"),
        "enter_password":
            MessageLookupByLibrary.simpleMessage("Введите пароль"),
        "invalid_email": MessageLookupByLibrary.simpleMessage(
            "Неверный адрес электронной почты"),
        "logo_title":
            MessageLookupByLibrary.simpleMessage("Сделай жизнь проще"),
            "order_title": MessageLookupByLibrary.simpleMessage("Заказ №"),
        "purchasing_history_title":
            MessageLookupByLibrary.simpleMessage("История покупок"),
        "total_title": MessageLookupByLibrary.simpleMessage("Итого")
      };
}
