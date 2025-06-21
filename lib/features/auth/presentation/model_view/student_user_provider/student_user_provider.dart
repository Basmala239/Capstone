import 'package:capstone/features/auth/data/models/student_model/student_model.dart';
import 'package:flutter/foundation.dart';

class StudentUserProvider with ChangeNotifier {
  Student? _user;
  String? _token;
  Student? get user => _user;
  String? get token => _token;

  void setStudent(Student user, String token) {
    _user = user;
    notifyListeners();
  }
  void changeUserName(String name) {
    _user?.name= name;
    notifyListeners();
  }
  void changeUserGitHub(String github) {
    _user?.github= github;
    notifyListeners();
  }

  String? getUserName() {
    return _user?.name;
  }

  String? getGitHub() {
    return _user?.github;
  }

  void clearUser() {
    _user = null;
    _token=null;
    notifyListeners();
  }
}
