import 'package:flutter/material.dart';
import 'package:weather/core/Provider/pref_helper.dart';

class MyProvider extends ChangeNotifier{
  String search="Cairo";

  void init()async{
    String? newLang= PrefsHelper.getSearch();
    changeSearched(newLang ?? "Cairo");
  }

  void changeSearched(String searched){
    search=searched;
    PrefsHelper.saveSearch(searched);
    notifyListeners();
  }
}