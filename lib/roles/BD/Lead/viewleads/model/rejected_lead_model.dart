class RejectedLeadsResponse {
  final bool? success;
  final String? message;
  final RejectedLeadsData? data;

  RejectedLeadsResponse({this.success, this.message, this.data});

  factory RejectedLeadsResponse.fromJson(Map<String, dynamic> json) {
    return RejectedLeadsResponse(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null
          ? RejectedLeadsData.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message, 'data': data?.toJson()};
  }
}

class RejectedLeadsData {
  final int? totalLeads;
  final int? totalPages;
  final int? currentPage;
  final String? processStatus;
  final List<RejectedLead>? leads;

  RejectedLeadsData({
    this.totalLeads,
    this.totalPages,
    this.currentPage,
    this.processStatus,
    this.leads,
  });

  factory RejectedLeadsData.fromJson(Map<String, dynamic> json) {
    return RejectedLeadsData(
      totalLeads: json['totalLeads'],
      totalPages: json['totalPages'],
      currentPage: json['currentPage'],
      processStatus: json['processStatus'],
      leads: json['leads'] != null
          ? (json['leads'] as List)
                .map((e) => RejectedLead.fromJson(e))
                .toList()
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

class RejectedLead {
  final PersonalDetails? personalDetails;
  final Organization? organization;
  final ServiceDetails? serviceDetails;
  final String? id;
  final String? createdBy; // String/null for rejected
  final String? processStatus;
  final String? leadId;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final String? updatedBy;

  RejectedLead({
    this.personalDetails,
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

  factory RejectedLead.fromJson(Map<String, dynamic> json) {
    return RejectedLead(
      personalDetails: json['personalDetails'] != null
          ? PersonalDetails.fromJson(json['personalDetails'])
          : null,
      organization: json['organization'] != null
          ? Organization.fromJson(json['organization'])
          : null,
      serviceDetails: json['serviceDetails'] != null
          ? ServiceDetails.fromJson(json['serviceDetails'])
          : null,
      id: json['_id'],
      createdBy: json['createdBy'],
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
      'personalDetails': personalDetails?.toJson(),
      'organization': organization?.toJson(),
      'serviceDetails': serviceDetails?.toJson(),
      '_id': id,
      'createdBy': createdBy,
      'processStatus': processStatus,
      'leadId': leadId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
      'updatedBy': updatedBy,
    };
  }
}

class PersonalDetails {
  final String? name;
  final String? email;
  final String? phone;
  final String? whatsappNumber;
  final String? address;
  final String? state;
  final String? district;
  final String? city;
  final String? pincode;
  final String? adharNumber;
  final String? panNumber;

  PersonalDetails({
    this.name,
    this.email,
    this.phone,
    this.whatsappNumber,
    this.address,
    this.state,
    this.district,
    this.city,
    this.pincode,
    this.adharNumber,
    this.panNumber,
  });

  factory PersonalDetails.fromJson(Map<String, dynamic> json) {
    return PersonalDetails(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      whatsappNumber: json['whatsappNumber'],
      address: json['address'],
      state: json['state'],
      district: json['district'],
      city: json['city'],
      pincode: json['pincode'],
      adharNumber: json['adharNumber'],
      panNumber: json['panNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'whatsappNumber': whatsappNumber,
      'address': address,
      'state': state,
      'district': district,
      'city': city,
      'pincode': pincode,
      'adharNumber': adharNumber,
      'panNumber': panNumber,
    };
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
