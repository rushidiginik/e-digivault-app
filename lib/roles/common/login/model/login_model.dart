class LoginResponseModel {
  final bool success;
  final String message;
  final String? otp;

  LoginResponseModel({
    required this.success,
    required this.message,
    this.otp,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      otp: json['data']?['otp'], // if API returns OTP or some data
    );
  }
}


class VerifyOtpModel {
  final bool success;
  final String message;
  final String? userId;
  final String? phone;
  final String? role;
  final String? accessToken;
  final String? refreshToken;

  VerifyOtpModel({
    required this.success,
    required this.message,
    this.userId,
    this.phone,
    this.role,
    this.accessToken,
    this.refreshToken,
  });

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    final employee = data['employee'] ?? {};
    return VerifyOtpModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      userId: employee['id']?.toString(),
      phone: employee['phone']?.toString() ?? data['phone']?.toString(),
      role: employee['role']??'',
      accessToken: data['accessToken']?.toString(),
      refreshToken: data['refreshToken']?.toString(),
    );
  }

}




