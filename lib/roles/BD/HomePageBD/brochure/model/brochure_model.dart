class BrochureResponse {
  final bool? success;
  final String? message;
  final List<BrochureData>? data;

  BrochureResponse({this.success, this.message, this.data});

  factory BrochureResponse.fromJson(Map<String, dynamic> json) {
    return BrochureResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] != null
          ? (json['data'] is List
                ? (json['data'] as List)
                      .map((item) => BrochureData.fromJson(item))
                      .toList()
                : [BrochureData.fromJson(json['data'])])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data?.map((item) => item.toJson()).toList(),
    };
  }
}

class BrochureData {
  final String? id;
  final String? title;
  final String? description;
  final String? fileUrl;
  final bool? isActive;
  final String? uploadedBy;
  final String? uploadedByRole;
  final int? viewCount;
  final int? downloadCount;
  final String? createdAt;
  final String? updatedAt;

  BrochureData({
    this.id,
    this.title,
    this.description,
    this.fileUrl,
    this.isActive,
    this.uploadedBy,
    this.uploadedByRole,
    this.viewCount,
    this.downloadCount,
    this.createdAt,
    this.updatedAt,
  });

  factory BrochureData.fromJson(Map<String, dynamic> json) {
    return BrochureData(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      fileUrl: json['fileUrl'] as String?,
      isActive: json['isActive'] as bool?,
      uploadedBy: json['uploadedBy'] as String?,
      uploadedByRole: json['uploadedByRole'] as String?,
      viewCount: json['viewCount'] as int?,
      downloadCount: json['downloadCount'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'fileUrl': fileUrl,
      'isActive': isActive,
      'uploadedBy': uploadedBy,
      'uploadedByRole': uploadedByRole,
      'viewCount': viewCount,
      'downloadCount': downloadCount,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
