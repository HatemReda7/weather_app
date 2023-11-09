import 'package:flutter/material.dart';
import 'package:weather/core/Provider/pref_helper.dart';

class MyProvider extends ChangeNotifier{
  String search="Cairo";

  void init()async{
  }

  void changeSearched(String searched){
    search=searched;
    notifyListeners();
  }
}