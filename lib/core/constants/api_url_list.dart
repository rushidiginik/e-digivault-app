import 'package:e_digivault_org_app/core/constants/app_constant.dart';



class ApiUrlList {
  static const String userRegister =
      "${AppConstants.baseUrl}user_state_head/registerUser";
  static const String loginUser =
      "${AppConstants.baseUrl}employees/employeeSendOtp";

  static const String verifyUserOtp =
      "${AppConstants.baseUrl}employees/employeeVerifyOtp";

  static const String createUserSetting =
      "${AppConstants.baseUrl}settings/createSetting";

  static const String getSettingAll =
      "${AppConstants.baseUrl}settings/getSettingByUser";

  static const String updateSettings =
      "${AppConstants.baseUrl}settings/updateSettingById";

  ///////////////////////////   CP Apis..///////////////////////////////////////////////////////////////////////
  static const String cpPersonalDetails =
      "${AppConstants.baseUrl}employees/channelPartner/cpPersonalDetails";
  static const String cpCompanyDetails =
      "${AppConstants.baseUrl}employees/channelPartner/cpCompanyDetails";
  static const String cpWorkExperience =
      "${AppConstants.baseUrl}employees/channelPartner/cpWorkExperience";
  static const String getCpPersonalDetails =
      "${AppConstants.baseUrl}employees/channelPartner/getCpPersonalDetails";

  static String getBrochureCp(String id) =>
      "${AppConstants.baseUrl}brochure/getBrochureById/$id";

  static String getVideoPromoCp(String id) =>
      "${AppConstants.baseUrl}promoVideo/getPromoVideoById/$id";
  static const String getProfileCp = "${AppConstants.baseUrl}auth/me";

  //CD Apis..
  static const String cdPersonalDetails =
      "${AppConstants.baseUrl}employees/channelDelivery/cdPersonalDetails";
  static const String cdCompanyDetails =
      "${AppConstants.baseUrl}employees/channelDelivery/cdCompanyDetails";
  static const String cdWorkExperience =
      "${AppConstants.baseUrl}employees/channelDelivery/cdWorkExperience";
  static const String getCdPersonalDetails =
      "${AppConstants.baseUrl}employees/channelDelivery/getCdPersonalDetails";

  static const String getCDDashboard =
      "${AppConstants.baseUrl}employees/channelDelivery/getCDDashboard";

  //sign And Vedio Upload..

  static const String uploadFile =
      "${AppConstants.baseUrl}newDocuments/uploadFile";

  static const String cpESignUpload =
      "${AppConstants.baseUrl}employees/channelPartner/uploadCPESign";

  static const String cdESignUpload =
      "${AppConstants.baseUrl}employees/channelDelivery/uploadCDESign";

  static const String uploadCPVideoRecord =
      "${AppConstants.baseUrl}employees/channelPartner/uploadCPVideoRecord";

  static const String uploadCDVideoRecord =
      "${AppConstants.baseUrl}employees/channelDelivery/uploadCDVideoRecord";
   
  static const String initSettings =
      "${AppConstants.baseUrl}settings/createSetting";

  static const String getUserSettings =
      "${AppConstants.baseUrl}settings/getSettingByUser/";

  static String userManualDoc =
      "${AppConstants.baseUrl}settings/getUserManualDocumentUrl/";
  static String userManualVideo =
      "${AppConstants.baseUrl}settings/getUserManualVideoUrl/";
}