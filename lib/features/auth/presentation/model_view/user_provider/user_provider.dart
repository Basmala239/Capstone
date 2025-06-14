import 'package:flutter/foundation.dart';

import '../../../data/models/app_user/app_user_model.dart';

class UserProvider with ChangeNotifier {
  AppUser? _user;
  String? _token;
  AppUser? get user => _user;
  String? get token => _token;

  void setUser(AppUser user,String token) {
    _user = user;
    _token=token;
    notifyListeners();
  }

  void clearUser() {
    _user = null;
    _token=null;
    notifyListeners();
  }
}
