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
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../roles/Accountant/DashBoardAc/ac_dashboard_screen.dart';
import '../roles/Accountant/UserAc/browse_users/business_ac/business_overview_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/business_ac/business_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/client_ac/client_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/client_ac/overView_ac/estimates_client_ac/estimates_client_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/client_ac/overView_ac/estimates_client_ac/eye_view_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/client_ac/overView_ac/invoice_client_ac/invoice_client_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/client_ac/overView_ac/invoice_client_ac/invoice_view_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/client_ac/overView_ac/overview_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/client_ac/overView_ac/proposals_client_ac/proposals_client_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/client_ac/overView_ac/proposals_client_ac/proposals_view_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/client_ac/overView_ac/services_client_ac/services_client_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/delivery_partner_ac/delivery_partner_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/delivery_partner_ac/dp_overview_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/incharge_ac/incharge_overview_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/incharge_ac/incharge_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/mra_ac/mra_overview_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/mra_ac/mra_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/regional_head_ac/regional_head_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/regional_head_ac/regionalhead_overview_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/state_head_ac/stateHead_overView_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/state_head_ac/state_head_screen_ac.dart';
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

    //////////////////////////////////////  accountant //////////////////////////////////////
    GoRoute(
      path: '/ac_dashboard_screen',
      builder: (context, state) => AcDashboardScreen(),
    ),
    GoRoute(
      path: '/ac_client_screen',
      name: 'acClient',
      builder: (context, state) => ClientScreenAc(),
    ),
    GoRoute(
      path: '/ac_stateHead_screen',
      name: 'acStateHead',
      builder: (context, state) => StateHeadScreenAc(),
    ),
    GoRoute(
      path: '/ac_regionalHead_screen',
      name: 'acRegionalHead',
      builder: (context, state) => RegionalHeadScreenAc(),
    ),
    GoRoute(
      path: '/ac_incharge_screen',
      name: 'acIncharge',
      builder: (context, state) => InchargeScreenAc(),
    ),
    GoRoute(
      path: '/ac_mra_screen',
      name: 'acMra',
      builder: (context, state) => MraScreenAc(),
    ),
    GoRoute(
      path: '/ac_deliveryPartner_screen',
      name: 'acDeliveryPartner',
      builder: (context, state) => DeliveryPartnerScreenAc(),
    ),
    GoRoute(
      path: '/ac_business_screen',
      name: 'acBusiness',
      builder: (context, state) => BusinessScreenAc(),
    ),
    GoRoute(
      path: '/ac_overview_screen',
      name: 'acOverview',
      builder: (context, state) => OverviewScreenAc(),
    ),

    GoRoute(
      path: '/ac_StateHead_Overview_screen',
      name: 'acStateHeadOverview',
      builder: (context, state) => StateheadOverviewScreenAc(),
    ),

    GoRoute(
      path: '/ac_RegionalHead_Overview_screen',
      name: 'acRegionalHeadOverview',
      builder: (context, state) => RegionalheadOverviewScreenAc(),
    ),

    GoRoute(
      path: '/ac_Incharge_Overview_screen',
      name: 'acInchargeOverview',
      builder: (context, state) => InchargeOverviewScreenAc(),
    ),

    GoRoute(
      path: '/ac_Mra_Overview_screen',
      name: 'acMraOverview',
      builder: (context, state) => MraOverviewScreenAc(),
    ),
    GoRoute(
      path: '/ac_Dp_Overview_screen',
      name: 'acDpOverview',
      builder: (context, state) => DpOverviewScreenAc(),
    ),
    GoRoute(
      path: '/ac_Business_Overview_screen',
      name: 'acBusinessOverview',
      builder: (context, state) => BusinessOverviewScreenAc(),
    ),

    GoRoute(
      path: '/ac_Estimates_Client_screen',
      name: 'acEstimatesClient',
      builder: (context, state) => EstimatesClientScreenAc(),
    ),

    GoRoute(
      path: '/ac_Eye_View_screen',
      name: 'acEyeView',
      builder: (context, state) {
        final status = state.extra as String?;
        return EyeViewScreenAc(status: status);
      },
    ),
    GoRoute(
      path: '/ac_Proposals_View_screen',
      name: 'acProposalsView',
      builder: (context, state) {
        final status = state.extra as String?;
        return ProposalsViewScreenAc(status: status);
      },
    ),
    GoRoute(
      path: '/ac_Proposals_Client_screen',
      name: 'acProposalsClient',
      builder: (context, state) => ProposalsClientScreenAc(),
    ),

    GoRoute(
      path: '/ac_Invoice_Client_screen',
      name: 'acInvoiceClient',
      builder: (context, state) => InvoiceClientScreenAc(),
    ),
    GoRoute(
      path: '/ac_Services_Client_screen',
      name: 'acServicesClient',
      builder: (context, state) => ServicesClientScreenAc(),
    ),

    GoRoute(
      path: '/ac_Invoice_View_screen',
      name: 'acInvoiceView',
      builder: (context, state) {
        final status = state.extra as String?;
        return InvoiceViewScreenAc(status: status);
      },
    ),
  ],
);
