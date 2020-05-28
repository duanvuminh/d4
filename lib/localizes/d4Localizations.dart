import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class D4Localizations {
  D4Localizations(this.locale);

  final Locale locale;

  static D4Localizations of(BuildContext context) {
    return Localizations.of<D4Localizations>(context, D4Localizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'phone_validate': 'ISDN is incorrect format',
      'contact': 'Contact number',
      'login': 'Login',
      'acount': "Don't have an acount?",
      'register': 'Register',
      'next': 'Next',
      'opt_confirm': 'Confirm',
      'opt_hint': 'OPT was send to your phone',
      'balance': 'Balance',
    },
    'vi': {
      'phone_validate': 'ISDN không đúng định dạng',
      'contact': 'Liên hệ',
      'login': 'Đăng nhập',
      'acount': "Chưa có tài khoản",
      'register': 'Đăng kí',
      'next': 'Tiếp',
      'opt_hint': 'Mã OPT gửi tới điện thoại',
      'opt_confirm': 'Xác nhận',
      'balance': 'Số dư tài khoản',
    },
  };
  String get phoneValidate {
    return _localizedValues[locale.languageCode]['phone_validate'];
  }

  String get contact {
    return _localizedValues[locale.languageCode]['contact'];
  }

  String get login {
    return _localizedValues[locale.languageCode]['login'];
  }

  String get acount {
    return _localizedValues[locale.languageCode]['acount'];
  }

  String get register {
    return _localizedValues[locale.languageCode]['register'];
  }

  String get next {
    return _localizedValues[locale.languageCode]['next'];
  }

  String get optConfirm {
    return _localizedValues[locale.languageCode]['opt_confirm'];
  }

  String get optHint {
    return _localizedValues[locale.languageCode]['opt_hint'];
  }

  String get balance {
    return _localizedValues[locale.languageCode]['balance'];
  }
}

class D4LocalizationsDelegate extends LocalizationsDelegate<D4Localizations> {
  const D4LocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'vi'].contains(locale.languageCode);

  @override
  Future<D4Localizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<D4Localizations>(D4Localizations(locale));
  }

  @override
  bool shouldReload(D4LocalizationsDelegate old) => false;
}
