import 'package:flutter/cupertino.dart';

class UIProvider extends ChangeNotifier{
  int _index = 0;

  int get curretIndex {
    return _index;
  }
  set setIndex (int idx){
     _index = idx;
     notifyListeners();
  }
}