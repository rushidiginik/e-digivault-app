class LoginResponseModel {
  final bool success;
  final String message;
  final LoginUserData? data;

  LoginResponseModel({required this.success, required this.message, this.data});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? LoginUserData.fromJson(json['data']) : null,
    );
  }
}

class LoginUserData {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String role;
  final String otp;
  final DateTime expiry;
  final bool isNewUser;

  LoginUserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.otp,
    required this.expiry,
    required this.isNewUser,
  });

  factory LoginUserData.fromJson(Map<String, dynamic> json) {
    return LoginUserData(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      role: json['role'] ?? '',
      otp: json['otp'] ?? '',
      expiry: DateTime.parse(json['expiry']),
      isNewUser: json['isNewUser'] ?? false,
    );
  }
}

class VerifyOtpModel {
  final bool success;
  final String message;
  final VerifyOtpData? data;

  VerifyOtpModel({required this.success, required this.message, this.data});

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    return VerifyOtpModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? VerifyOtpData.fromJson(json['data']) : null,
    );
  }
}

class VerifyOtpData {
  final Employee employee;
  final String accessToken;
  final String refreshToken;

  VerifyOtpData({
    required this.employee,
    required this.accessToken,
    required this.refreshToken,
  });

  factory VerifyOtpData.fromJson(Map<String, dynamic> json) {
    return VerifyOtpData(
      employee: Employee.fromJson(json['employee']),
      accessToken: json['accessToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
    );
  }
}

class Employee {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String role;

  Employee({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      role: json['role'] ?? '',
    );
  }
}
