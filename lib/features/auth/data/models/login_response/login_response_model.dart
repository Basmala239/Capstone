import '../app_user/app_user_model.dart';

class LoginData {
  final String token;
  final AppUser user;
  final String userType;

  LoginData({
    required this.token,
    required this.user,
    required this.userType,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      token: json['token'],
      userType: json['user_type'],
      user: parseUser(json['user']),
    );
  }
}

class LoginResponse {
  final bool status;
  final String errNum;
  final String msg;
  final LoginData data;

  LoginResponse({
    required this.status,
    required this.errNum,
    required this.msg,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      errNum: json['errNum'],
      msg: json['msg'],
      data: LoginData.fromJson(json['data']),
    );
  }
}