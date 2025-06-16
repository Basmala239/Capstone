class CodeResponse {
  final bool status;
  final String errNum;
  final String msg;
  final CodeData data;

  CodeResponse({
    required this.status,
    required this.errNum,
    required this.msg,
    required this.data,
  });

  factory CodeResponse.fromJson(Map<String, dynamic> json) {
    return CodeResponse(
      status: json['status'],
      errNum: json['errNum'],
      msg: json['msg'],
      data: CodeData.fromJson(json['data']),
    );
  }
}

class CodeData {
  final String email;
  final String code;

  CodeData({required this.email, required this.code});

  factory CodeData.fromJson(Map<String, dynamic> json) {
    return CodeData(
      email: json['email'],
      code: json['code'],
    );
  }
}
