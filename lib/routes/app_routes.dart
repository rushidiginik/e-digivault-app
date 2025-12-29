import 'package:e_digivault_org_app/roles/BD/Dashboard/bd_dashboard_screen.dart';
import 'package:e_digivault_org_app/roles/BD/HomePageBD/liveTracking/live_tracking_screen_bd.dart';
import 'package:e_digivault_org_app/roles/BD/HomePageBD/serviceDocuments/service_doc_screen_bd.dart';
import 'package:e_digivault_org_app/roles/BD/HomePageBD/videoPromo/video_promo_screen_bd.dart';
import 'package:e_digivault_org_app/roles/BD/Lead/viewleads/view_lead_details_screen.dart';
import 'package:e_digivault_org_app/roles/MRA/dashboard/mra_dashboard_screen.dart';
import 'package:e_digivault_org_app/roles/MRA/lead/lead_detail_mra/lead_detail_screen.dart';
import 'package:e_digivault_org_app/roles/common/login/login_screen.dart';
import 'package:e_digivault_org_app/roles/common/onboarding/onboarding_screen.dart';
import 'package:e_digivault_org_app/roles/common/settings/common_settings/contact_support_screen.dart';
import 'package:e_digivault_org_app/roles/common/settings/common_settings/faq_help_screen.dart';
import 'package:e_digivault_org_app/roles/common/settings/common_settings/language_preference_screen.dart';
import 'package:e_digivault_org_app/roles/common/settings/common_settings/notification_setting_screen.dart';
import 'package:e_digivault_org_app/roles/common/settings/common_settings/privacy_setting_screen.dart';
import 'package:e_digivault_org_app/roles/common/settings/common_settings/settings/settings_screen.dart';
import 'package:e_digivault_org_app/roles/common/settings/common_settings/user_manual/user_manual_doc_screen.dart';
import 'package:e_digivault_org_app/roles/common/settings/common_settings/user_manual/user_manual_screen.dart';
import 'package:e_digivault_org_app/roles/common/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../roles/Accountant/DashBoardAc/ac_dashboard_screen.dart';
import '../roles/BD/HomePageBD/brochure/brochure_screen_bd.dart';
import '../roles/BD/HomePageBD/liveTracking/live_tracking_actions_screen.dart';
import '../roles/BD/HomePageBD/rateChart/rate_chart_screen_bd.dart';
import '../roles/BD/HomePageBD/rateChart/rate_chart_time_line_screen.dart';
import '../roles/BD/HomePageBD/serviceDocuments/document_list_screen_bd.dart';
import '../roles/BD/HomePageBD/serviceDocuments/sub_service_screen_bd.dart';
import '../roles/BD/Lead/viewleads/view_leads_screen_bd.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash_screen',
  routes: [
    GoRoute(
      path: '/splash_screen',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/digivault_text_screen',
      builder: (context, state) => DigiVaultTextScreen(),
    ),
    GoRoute(
      path: '/sub_text_screen',
      builder: (context, state) => SubTextScreen(),
    ),
    GoRoute(
      path: '/onboarding_screen',
      builder: (context, state) => OnboardingScreen(),
    ),
    GoRoute(path: '/login_screen', builder: (context, state) => LoginScreen()),

    // BD Role:....
    GoRoute(
      path: '/bd_dashboard_screen',
      builder: (context, state) => DashboardBDScreen(),
    ),
    GoRoute(
      path: '/bd_brochure_screen',
      builder: (context, state) => BrochureScreen(),
    ),

    GoRoute(
      path: '/bd_ratechart_screen',
      builder: (context, state) => RateChartScreen(),
    ),

    GoRoute(
      path: '/bd_ratechart_timeline_screen',
      builder: (context, state) => RateChartTimeLineScreen(),
    ),
    GoRoute(
      path: '/bd_servicedocuments_screen',
      builder: (context, state) => ServiceDocumentsScreen(),
    ),
    GoRoute(
      path: '/bd_subservice_screen',
      name: 'bdSubService',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;

        return SubServiceScreen(
          mainServiceName: data['mainServiceName'] as String,
          mainServiceId: data['mainServiceId'] as String,
        );
      },
    ),

    GoRoute(
      path: '/bd_document_list',
      name: 'bdDocumentList',
      builder: (context, state) {
        final data = state.extra as Map<String, String>;

        return DocumentListScreen(
          mainServiceName: data['mainServiceName']!,
          subServiceName: data['subServiceName']!,
          subServiceId: data['subServiceId']!,
        );
      },
    ),
    GoRoute(
      path: '/bd_videopromo_screen',
      builder: (context, state) => VideoPlayerScreen(),
    ),

    GoRoute(
      path: '/bd_livetracking_screen',
      builder: (context, state) => LiveTrackingScreen(),
    ),

    GoRoute(
      path: '/bd_livetracking_actions_screen',
      name: 'bdLiveTrackingActions',
      builder: (context, state) {
        final data = state.extra as Map<String, String>;
        return LiveTrackingActionsScreen(
          title: data['title']!,
          status: data['status']!,
        );
      },
    ),
    GoRoute(
      path: '/add_leads_screen_bd',
      builder: (context, state) => DashboardBDScreen(),
    ),

    GoRoute(
      path: '/add_leads_screen_bd',
      builder: (context, state) => DashboardBDScreen(),
    ),
    GoRoute(
      path: '/view_leads_screen',
      builder: (context, state) => ViewLeadsScreen(),
    ),

    GoRoute(
      path: '/view_leads_details_screen',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        final isPending = extra?['isPending'] ?? false;
        return ViewLeadDetailsScreen(isPending: isPending);
      },
    ),
    //........
    GoRoute(
      path: '/home_page_mra_screen',
      builder: (context, state) => MraDashboardScreen(),
    ),
    GoRoute(
      path: '/settings_screen',
      builder: (context, state) => SettingScreen(),
    ),

    // Settings Sub-screens
    GoRoute(
      path: '/notification_setting_screen',
      builder: (context, state) => NotificationSettingScreen(),
    ),
    GoRoute(
      path: '/language_preference_screen',
      builder: (context, state) => LanguagePreferenceScreen(),
    ),
    GoRoute(
      path: '/privacy_setting_screen',
      builder: (context, state) => PrivacySettingScreen(),
    ),
    GoRoute(
      path: '/contact_support_screen',
      builder: (context, state) => ContactSupportScreen(),
    ),
    GoRoute(
      path: '/faq_help_screen',
      builder: (context, state) => FaqHelpScreen(),
    ),
    GoRoute(
      path: '/user_manual_screen',
      builder: (context, state) => UserManualScreen(),
    ),

    GoRoute(
      path: '/user_manual_doc',
      name: 'userManualDoc',
      builder: (context, state) {
        final isFromDoc = state.extra as bool? ?? true;
        return UserManualDocScreen(isFromDoc: isFromDoc);
      },
    ),

    // accountant
    GoRoute(
      path: '/ac_dashboard_screen',
      builder: (context, state) => AcDashboardScreen(),
    ),

  ],
);
