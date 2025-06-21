import 'package:capstone/features/auth/data/models/supervisor_model/supervisor_model.dart';
import 'package:flutter/foundation.dart';

class SupervisorUserProvider with ChangeNotifier {
  Supervisor? _user;
  String? _token;
  Supervisor? get user => _user;
  String? get token => _token;

  void setSupervisor(Supervisor user,String token) {
    _user = user;
    notifyListeners();
  }

  void changeUserName(String name) {
    _user?.name= name;
    notifyListeners();
  }
  void changeMaxTeamsAllowed(int num) {
    _user?.maxTeamsAllowed= num;
    notifyListeners();
  }
  String? getUserName() {
    return _user?.name;
  }
  int? getMaxTeamsAllowed() {
    return _user?.maxTeamsAllowed;
  }
  void clearUser() {
    _user = null;
    _token=null;
    notifyListeners();
  }
}
