import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static late SharedPreferences _prefs;

  // Keys
  static const _accessToken = 'auth_token';
  static const _refreshToken = 'refresh_token';
  static const _userId = "userId";
  static const _phoneNumber = "";
  static const _role = "";
  static const _channelPartnerId = "channelPartnerId";
  static const _channelDeliveryId = "channelDeliveryId"; // Add this
  static const _brochureCpId = "brochureCpId";
  static const _promoVideoId = "promoVideoId";
  static const userName = "userName";
  static const profileImage = "profileImage";


  // Add this

  /// Call this once in main() before runApp()
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Set tokens
  static Future<void> setAuthToken(String token) async =>
      _prefs.setString(_accessToken, token);

  static Future<void> setRefreshToken(String token) async =>
      _prefs.setString(_refreshToken, token);

  static Future<void> setUserId(String userId) async =>
      _prefs.setString(_userId, userId);

  static Future<void> setPhoneNumber(String phoneNumber) async =>
      _prefs.setString(_phoneNumber, phoneNumber);

  static Future<void> setRole(String role) async =>
      _prefs.setString(_role, role);

  static Future<void> setChannelPartnerId(String channelPartnerId) async =>
      _prefs.setString(_channelPartnerId, channelPartnerId);

  static Future<void> setChannelDeliveryId(String channelDeliveryId) async =>
      _prefs.setString(_channelDeliveryId, channelDeliveryId);

  static Future<void> setBrochureCpId(String brochureCpId) async =>
      _prefs.setString(_brochureCpId, brochureCpId);

  static Future<void> setPromoVideoId(String promoVideoId) async =>
      _prefs.setString(_promoVideoId, promoVideoId);

  // Add this

  /// Get tokens
  static String? get authToken => _prefs.getString(_accessToken);

  static String? get refreshToken => _prefs.getString(_refreshToken);

  static String? get userId => _prefs.getString(_userId);

  static String? get phoneNumber => _prefs.getString(_phoneNumber);

  static String? get role => _prefs.getString(_role);

  static String? get channelPartnerId => _prefs.getString(_channelPartnerId);

  static String? get channelDeliveryId => _prefs.getString(_channelDeliveryId);

  static String? get brochureCpId =>
      _prefs.getString(_brochureCpId); // Add this
  static String? get promoVideoId => _prefs.getString(_promoVideoId);

  /// Delete tokens
  static Future<void> deleteAuthToken() async => _prefs.remove(_accessToken);

  static Future<void> deleteRefreshToken() async =>
      _prefs.remove(_refreshToken);

  static Future<void> deleteChannelPartnerId() async =>
      _prefs.remove(_channelPartnerId);

  static Future<void> deleteChannelDeliveryId() async =>
      _prefs.remove(_channelDeliveryId);

  static Future<void> deleteBrochureCpId() async =>
      _prefs.remove(_brochureCpId);

  static Future<void> deletePromoVideoId() async =>
      _prefs.remove(_promoVideoId);

  // Add this

  /// Clear all stored values (use on logout)
  static Future<void> clearAll() async => _prefs.clear();
}