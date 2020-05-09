import 'package:flutter/widgets.dart';

class LocaleModel with ChangeNotifier {
  Locale locale;

  LocaleModel() {
    this.locale = new Locale("vn", "");
  }

  void changeLocale(Locale locale) {
    this.locale = locale;
    notifyListeners();
  }
}
