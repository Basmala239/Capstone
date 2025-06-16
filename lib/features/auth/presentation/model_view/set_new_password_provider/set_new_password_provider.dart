import 'package:flutter/foundation.dart';
class SetNewPassword extends ChangeNotifier{
  // -1 empty, 0 wrong, 1 correct
  int newPassword=1;
  int confirmPassword=1;
  bool isNewPasswordEmpty(){
    return newPassword==-1;
  }
  bool isConfirmPasswordEmpty(){
    return confirmPassword==-1;
  }
  bool equal(){
    return confirmPassword==1;
  }
  void reset(int np,int cp){
    newPassword=np;
    confirmPassword=cp;
    notifyListeners();
  }
  bool hideNewPassword =true;
  bool hideConfirmPassword =true;
  void changeHideNewPassword(){
    hideNewPassword=!hideNewPassword;
    notifyListeners();
  }
  void changeHideConfirmPassword(){
    hideConfirmPassword=!hideConfirmPassword;
    notifyListeners();
  }
  bool isShowNewPassword(){
    return hideNewPassword;
  }
  bool isShowConfirmPassword(){
    return hideConfirmPassword;
  }
}