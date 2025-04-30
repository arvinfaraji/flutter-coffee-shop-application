import 'package:coffee_app/Core/I18n/en.dart';
import 'package:coffee_app/Core/I18n/fa.dart';
import 'package:get/route_manager.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': EnglishLanguage().keys,
    'fa': PersianLanguage().keys
  };
}

abstract class AppTranslationsKeys {
  Map<String, String> get keys;
}