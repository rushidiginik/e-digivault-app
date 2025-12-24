class AppConstants {
  AppConstants._internal();

  // Single instance
  static final AppConstants _instance = AppConstants._internal();

  // Factory constructor returns the same instance every time
  factory AppConstants() => _instance;

  static const appVersionName = "1.0.0";
  static const appName = "DigiVault Business Development";

  // SENTRY DSN KEY
  static const sentryFakeDsnKey =
      'https://12345abcdb19ed323c1f199@o1.ingest.sentry.io/2244';

  static const String baseUrl = 'https://app.edigivault.com/api/';

  // Login
  static const loginUrl = '';

  // static String userId = "";
  // static String phoneNumber = "";

  static String _formatDate(String? isoDate) {
    if (isoDate == null || isoDate.isEmpty) return "-";
    try {
      final date = DateTime.parse(isoDate);
      return "${date.year}-${date.month}-${date.day}";
    } catch (_) {
      return "-";
    }
  }
}