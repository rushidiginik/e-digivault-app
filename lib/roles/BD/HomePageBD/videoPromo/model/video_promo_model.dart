class VideoPromoResponse {
  final bool? success;
  final String? message;
  final VideoPromoData? data;

  VideoPromoResponse({this.success, this.message, this.data});

  factory VideoPromoResponse.fromJson(Map<String, dynamic> json) {
    return VideoPromoResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] != null ? VideoPromoData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message, 'data': data?.toJson()};
  }
}

class VideoPromoData {
  final String? id;
  final String? title;
  final String? videoUrl;
  final bool? isActive;
  final String? createdBy;
  final String? createdRole;
  final int? viewCount;
  final String? createdAt;
  final String? updatedAt;

  VideoPromoData({
    this.id,
    this.title,
    this.videoUrl,
    this.isActive,
    this.createdBy,
    this.createdRole,
    this.viewCount,
    this.createdAt,
    this.updatedAt,
  });

  factory VideoPromoData.fromJson(Map<String, dynamic> json) {
    return VideoPromoData(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      videoUrl: json['videoUrl'] as String?,
      isActive: json['isActive'] as bool?,
      createdBy: json['createdBy'] as String?,
      createdRole: json['createdRole'] as String?,
      viewCount: json['viewCount'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'videoUrl': videoUrl,
      'isActive': isActive,
      'createdBy': createdBy,
      'createdRole': createdRole,
      'viewCount': viewCount,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
