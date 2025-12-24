class LogoutResponseModel {
  final bool success;
  final String message;
  final LogoutUserData? data;

  LogoutResponseModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory LogoutResponseModel.fromJson(Map<String, dynamic> json) {
    return LogoutResponseModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? LogoutUserData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message, 'data': data?.toJson()};
  }
}

class LogoutUserData {
  final bool isVerified;
  final bool isActive;
  final bool isLoggedIn;
  final String role;
  final String userType;
  final bool acceptedTerms;
  final String id;
  final String phone;
  final String createdAt;
  final String updatedAt;
  final int v;
  final String? lastLogin;

  LogoutUserData({
    required this.isVerified,
    required this.isActive,
    required this.isLoggedIn,
    required this.role,
    required this.userType,
    required this.acceptedTerms,
    required this.id,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.lastLogin,
  });

  factory LogoutUserData.fromJson(Map<String, dynamic> json) {
    return LogoutUserData(
      isVerified: json['isVerified'] ?? false,
      isActive: json['isActive'] ?? false,
      isLoggedIn: json['isLoggedIn'] ?? false,
      role: json['role'] ?? '',
      userType: json['userType'] ?? '',
      acceptedTerms: json['acceptedTerms'] ?? false,
      id: json['_id'] ?? '',
      phone: json['phone'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
      lastLogin: json['lastLogin'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isVerified': isVerified,
      'isActive': isActive,
      'isLoggedIn': isLoggedIn,
      'role': role,
      'userType': userType,
      'acceptedTerms': acceptedTerms,
      '_id': id,
      'phone': phone,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
      'lastLogin': lastLogin,
    };
  }
}
