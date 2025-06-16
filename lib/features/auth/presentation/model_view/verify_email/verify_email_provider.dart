import 'package:flutter/foundation.dart';
class VerifyEmailProvider extends ChangeNotifier{
  int code=1;

  bool isCodeEmpty(){
    return code==-1;
  }
  bool isCodeWrong(){
    return code==0;
  }
  void reset(int e){
    code=e;
    notifyListeners();
  }
}