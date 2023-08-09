import 'package:flutter/foundation.dart';

class AppData extends ChangeNotifier {
  List<String> lang = ['vi', 'VN'];

  void updateLanguage(List<String> newLang) {
    lang = newLang;
    notifyListeners();
  }
}