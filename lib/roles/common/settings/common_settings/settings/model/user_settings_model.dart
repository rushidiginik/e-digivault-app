class UserInitSettingsModel {
  final bool? success;
  final String? message;
  final String? errorType;
  final SettingsDetails? details;

  UserInitSettingsModel({
    this.success,
    this.message,
    this.errorType,
    this.details,
  });

  factory UserInitSettingsModel.fromJson(Map<String, dynamic> json) {
    return UserInitSettingsModel(
      success: json['success'],
      message: json['message'],
      errorType: json['errorType'],
      details:
          json['details'] != null
              ? SettingsDetails.fromJson(json['details'])
              : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'errorType': errorType,
    'details': details?.toJson(),
  };
}

class SettingsDetails {
  final String? id;
  final bool? notifications;
  final String? languagePreference;
  final String? contactSupport;
  final String? faqHelp;
  final PrivacySettings? privacySettings;
  final UserManual? userManual;
  final String? userId;
  final String? userIdModel;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  SettingsDetails({
    this.id,
    this.notifications,
    this.languagePreference,
    this.contactSupport,
    this.faqHelp,
    this.privacySettings,
    this.userManual,
    this.userId,
    this.userIdModel,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory SettingsDetails.fromJson(Map<String, dynamic> json) {
    return SettingsDetails(
      id: json['_id'],
      notifications: json['notifications'],
      languagePreference: json['languagePreference'],
      contactSupport: json['contactSupport'],
      faqHelp: json['faqHelp'],
      privacySettings:
          json['privacySettings'] != null
              ? PrivacySettings.fromJson(json['privacySettings'])
              : null,
      userManual:
          json['userManual'] != null
              ? UserManual.fromJson(json['userManual'])
              : null,
      userId: json['userId'],
      userIdModel: json['userIdModel'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'notifications': notifications,
    'languagePreference': languagePreference,
    'contactSupport': contactSupport,
    'faqHelp': faqHelp,
    'privacySettings': privacySettings?.toJson(),
    'userManual': userManual?.toJson(),
    'userId': userId,
    'userIdModel': userIdModel,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    '__v': v,
  };
}

class PrivacySettings {
  final String? id;
  final bool? dataSharing;
  final bool? visibilityControl;
  final bool? accessPermissions;
  final bool? documentControl;
  final bool? accountHistory;
  final bool? notificationsPrivacy;

  PrivacySettings({
    this.id,
    this.dataSharing,
    this.visibilityControl,
    this.accessPermissions,
    this.documentControl,
    this.accountHistory,
    this.notificationsPrivacy,
  });

  factory PrivacySettings.fromJson(Map<String, dynamic> json) {
    return PrivacySettings(
      id: json['_id'],
      dataSharing: json['dataSharing'],
      visibilityControl: json['visibilityControl'],
      accessPermissions: json['accessPermissions'],
      documentControl: json['documentControl'],
      accountHistory: json['accountHistory'],
      notificationsPrivacy: json['notificationsPrivacy'],
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'dataSharing': dataSharing,
    'visibilityControl': visibilityControl,
    'accessPermissions': accessPermissions,
    'documentControl': documentControl,
    'accountHistory': accountHistory,
    'notificationsPrivacy': notificationsPrivacy,
  };
}

class UserManual {
  final String? id;
  final bool? documentEnabled;
  final bool? videoEnabled;
  final String? preferredFormat;
  final String? userId;
  final String? userIdModel;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  UserManual({
    this.id,
    this.documentEnabled,
    this.videoEnabled,
    this.preferredFormat,
    this.userId,
    this.userIdModel,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory UserManual.fromJson(Map<String, dynamic> json) {
    return UserManual(
      id: json['_id'],
      documentEnabled: json['documentEnabled'],
      videoEnabled: json['videoEnabled'],
      preferredFormat: json['preferredFormat'],
      userId: json['userId'],
      userIdModel: json['userIdModel'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'documentEnabled': documentEnabled,
    'videoEnabled': videoEnabled,
    'preferredFormat': preferredFormat,
    'userId': userId,
    'userIdModel': userIdModel,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    '__v': v,
  };
}

class GetSettingsResponse {
  final bool? success;
  final String? message;
  final SettingsData? data;

  GetSettingsResponse({this.success, this.message, this.data});

  factory GetSettingsResponse.fromJson(Map<String, dynamic> json) {
    return GetSettingsResponse(
      success: json["success"],
      message: json["message"],
      data: json["data"] != null ? SettingsData.fromJson(json["data"]) : null,
    );
  }
}

class SettingsData {
  final PrivacySettings? privacySettings;
  final bool? notifications;
  final String? languagePreference;
  final String? contactSupport;
  final String? faqHelp;
  final String? id;
  final String? userId;
  final String? userIdModel;
  final dynamic userManual; // It can be String or Model depending on API
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  SettingsData({
    this.privacySettings,
    this.notifications,
    this.languagePreference,
    this.contactSupport,
    this.faqHelp,
    this.id,
    this.userId,
    this.userIdModel,
    this.userManual,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory SettingsData.fromJson(Map<String, dynamic> json) {
    return SettingsData(
      privacySettings:
          json["privacySettings"] != null
              ? PrivacySettings.fromJson(json["privacySettings"])
              : null,
      notifications: json["notifications"],
      languagePreference: json["languagePreference"],
      contactSupport: json["contactSupport"],
      faqHelp: json["faqHelp"],
      id: json["_id"],
      userId: json["userId"],
      userIdModel: json["userIdModel"],
      userManual: json["userManual"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
      v: json["__v"],
    );
  }
}

class PrivacySettingsModel {
  final bool? dataSharing;
  final bool? visibilityControl;
  final bool? accessPermissions;
  final bool? documentControl;
  final bool? accountHistory;
  final bool? notificationsPrivacy;

  PrivacySettingsModel({
    this.dataSharing,
    this.visibilityControl,
    this.accessPermissions,
    this.documentControl,
    this.accountHistory,
    this.notificationsPrivacy,
  });

  factory PrivacySettingsModel.fromJson(Map<String, dynamic> json) {
    return PrivacySettingsModel(
      dataSharing: json["dataSharing"],
      visibilityControl: json["visibilityControl"],
      accessPermissions: json["accessPermissions"],
      documentControl: json["documentControl"],
      accountHistory: json["accountHistory"],
      notificationsPrivacy: json["notificationsPrivacy"],
    );
  }
}

class FaqResponse {
  final String message;
  final List<FaqItem> data;

  FaqResponse({required this.message, required this.data});

  factory FaqResponse.fromJson(Map<String, dynamic> json) {
    return FaqResponse(
      message: json['message'] ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => FaqItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'data': data.map((e) => e.toJson()).toList()};
  }
}

class FaqItem {
  final String title;
  final String description;
  final String id;

  FaqItem({required this.title, required this.description, required this.id});

  factory FaqItem.fromJson(Map<String, dynamic> json) {
    return FaqItem(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      id: json['_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'description': description, '_id': id};
  }
}
