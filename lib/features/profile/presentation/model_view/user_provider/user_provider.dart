import 'package:flutter/foundation.dart';
class UserProfileProvider extends ChangeNotifier{
  // -1 empty, 0 wrong, 1 correct
  int currentPassword=1;
  int newPassword=1;
  int confirmPassword=1;
  bool isCurrentPasswordEmpty(){
    return newPassword==-1;
  }
  bool isNewPasswordEmpty(){
    return newPassword==-1;
  }
  bool isConfirmPasswordEmpty(){
    return confirmPassword==-1;
  }

  bool equal(){
    return confirmPassword==1;
  }

  void reset(int curPass,int newPass,int conPass){
    currentPassword=curPass;
    newPassword=newPass;
    confirmPassword=conPass;
    notifyListeners();
  }

}