class PendingLeadsResponse {
  final bool? success;
  final String? message;
  final PendingLeadsData? data;

  PendingLeadsResponse({this.success, this.message, this.data});

  factory PendingLeadsResponse.fromJson(Map<String, dynamic> json) {
    return PendingLeadsResponse(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null
          ? PendingLeadsData.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message, 'data': data?.toJson()};
  }
}

class PendingLeadsData {
  final int? totalLeads;
  final int? totalPages;
  final int? currentPage;
  final String? processStatus;
  final List<PendingLead>? leads;

  PendingLeadsData({
    this.totalLeads,
    this.totalPages,
    this.currentPage,
    this.processStatus,
    this.leads,
  });

  factory PendingLeadsData.fromJson(Map<String, dynamic> json) {
    return PendingLeadsData(
      totalLeads: json['totalLeads'],
      totalPages: json['totalPages'],
      currentPage: json['currentPage'],
      processStatus: json['processStatus'],
      leads: json['leads'] != null
          ? (json['leads'] as List).map((e) => PendingLead.fromJson(e)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalLeads': totalLeads,
      'totalPages': totalPages,
      'currentPage': currentPage,
      'processStatus': processStatus,
      'leads': leads?.map((e) => e.toJson()).toList(),
    };
  }
}

class PendingLead {
  final Organization? organization;
  final ServiceDetails? serviceDetails;
  final String? id;
  final CreatedByUser? createdBy; // Changed to object
  final String? processStatus;
  final String? leadId;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final String? updatedBy; // This remains string (just ID)

  PendingLead({
    this.organization,
    this.serviceDetails,
    this.id,
    this.createdBy,
    this.processStatus,
    this.leadId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.updatedBy,
  });

  factory PendingLead.fromJson(Map<String, dynamic> json) {
    return PendingLead(
      organization: json['organization'] != null
          ? Organization.fromJson(json['organization'])
          : null,
      serviceDetails: json['serviceDetails'] != null
          ? ServiceDetails.fromJson(json['serviceDetails'])
          : null,
      id: json['_id'],
      createdBy: json['createdBy'] != null
          ? CreatedByUser.fromJson(json['createdBy'])
          : null,
      processStatus: json['processStatus'],
      leadId: json['leadId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
      updatedBy: json['updatedBy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'organization': organization?.toJson(),
      'serviceDetails': serviceDetails?.toJson(),
      '_id': id,
      'createdBy': createdBy?.toJson(),
      'processStatus': processStatus,
      'leadId': leadId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
      'updatedBy': updatedBy,
    };
  }
}

class CreatedByUser {
  final String? id;
  final String? name;
  final String? email;
  final String? role;

  CreatedByUser({this.id, this.name, this.email, this.role});

  factory CreatedByUser.fromJson(Map<String, dynamic> json) {
    return CreatedByUser(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'_id': id, 'name': name, 'email': email, 'role': role};
  }
}

class Organization {
  final String? dateOfEstablishment;
  final String? registeredAddress;
  final String? nameOfOwner;
  final String? orgName;
  final String? ownershipStatus;
  final String? typeOfOrganization;

  Organization({
    this.dateOfEstablishment,
    this.registeredAddress,
    this.nameOfOwner,
    this.orgName,
    this.ownershipStatus,
    this.typeOfOrganization,
  });

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      dateOfEstablishment: json['DateOfEstablishment'],
      registeredAddress: json['RegisteredAddress'],
      nameOfOwner: json['nameOfOwner'],
      orgName: json['orgName'],
      ownershipStatus: json['ownershipStatus'],
      typeOfOrganization: json['typeOfOrganization'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'DateOfEstablishment': dateOfEstablishment,
      'RegisteredAddress': registeredAddress,
      'nameOfOwner': nameOfOwner,
      'orgName': orgName,
      'ownershipStatus': ownershipStatus,
      'typeOfOrganization': typeOfOrganization,
    };
  }
}

class ServiceDetails {
  final List<String>? selectedServices;

  ServiceDetails({this.selectedServices});

  factory ServiceDetails.fromJson(Map<String, dynamic> json) {
    return ServiceDetails(
      selectedServices: json['selectedServices'] != null
          ? List<String>.from(json['selectedServices'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'selectedServices': selectedServices};
  }
}
