import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class D4Localizations {
  D4Localizations(this.locale);

  final Locale locale;

  static D4Localizations of(BuildContext context) {
    return Localizations.of<D4Localizations>(context, D4Localizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'phone_validate': 'ISDN in en'
    },
    'vn': {
      'phone_validate': 'ISDN không đúng định dạng'
    },
  };
  String get phoneValidate {
    return _localizedValues[locale.languageCode]['phone_validate'];
  }
}

class D4LocalizationsDelegate extends LocalizationsDelegate<D4Localizations> {
  const D4LocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'vn'].contains(locale.languageCode);

  @override
  Future<D4Localizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<D4Localizations>(D4Localizations(locale));
  }

  @override
  bool shouldReload(D4LocalizationsDelegate old) => false;
}
