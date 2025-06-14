import 'package:flutter/foundation.dart';
class ResetPassword extends ChangeNotifier{
  // -1 empty, 0 wrong, 1 correct
  int email=1;

  bool isEmailEmpty(){
    return email==-1;
  }
  bool isEmailWrong(){
    return email==0;
  }
  void reset(int e){
    email=e;
    notifyListeners();
  }
}