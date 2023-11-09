import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
  String search="Cairo";

  void init()async{
  }

  void changeSearched(String searched){
    search=searched;
    notifyListeners();
  }
}