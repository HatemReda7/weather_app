import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper{
  static late SharedPreferences prefs;

  static String? getSearch(){
    return prefs.getString("Search");
  }

  static saveSearch(String lang)async{
    await prefs.setString("Search", lang);
  }
}