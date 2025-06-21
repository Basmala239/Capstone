import 'package:capstone/features/auth/data/models/admin_model/admin_model.dart';
import 'package:flutter/foundation.dart';

class AdminUserProvider with ChangeNotifier {
  Admin? _user;
  String? _token;
  Admin? get user => _user;
  String? get token => _token;

  void setAdmin(Admin user,String token) {
    _user = user;
    notifyListeners();
  }

  void changeUserName(String name) {
    _user?.name= name;
    notifyListeners();
  }

  String? getUserName() {
    return _user?.name;
  }

  void clearUser() {
    _user = null;
    _token=null;
    notifyListeners();
  }
}
