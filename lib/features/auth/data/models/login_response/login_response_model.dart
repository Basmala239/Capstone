import '../app_user/app_user_model.dart';

class LoginResponse {
  final bool status;
  final String errNum;
  final String msg;
  final LoginUserData userData;

  LoginResponse({
    required this.status,
    required this.errNum,
    required this.msg,
    required this.userData,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      errNum: json['errNum'],
      msg: json['msg'],
      userData: LoginUserData.fromJson(json['user']),
    );
  }
}

class LoginUserData {
  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final AppUser user;

  LoginUserData({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.user,
  });

  factory LoginUserData.fromJson(Map<String, dynamic> json) {
    return LoginUserData(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      expiresIn: json['expires_in'],
      user: AppUser.fromJson(json['user']),
    );
  }
}
