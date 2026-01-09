import 'package:e_digivault_org_app/roles/BD/Dashboard/bd_dashboard_screen.dart';
import 'package:e_digivault_org_app/roles/BD/HomePageBD/liveTracking/live_tracking_screen_bd.dart';
import 'package:e_digivault_org_app/roles/BD/HomePageBD/serviceDocuments/service_doc_screen_bd.dart';
import 'package:e_digivault_org_app/roles/BD/HomePageBD/videoPromo/video_promo_screen_bd.dart';
import 'package:e_digivault_org_app/roles/BD/Lead/viewleads/view_lead_details_screen.dart';
import 'package:e_digivault_org_app/roles/MRA/dashboard/mra_dashboard_screen.dart';
import 'package:e_digivault_org_app/roles/MRA/lead/add_lead_mra/add_leads_screen_mra.dart';
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
import '../roles/Accountant/GapAc/approved_gap_screen_ac.dart';
import '../roles/Accountant/GapAc/gap_rejected_screen_ac.dart';
import '../roles/Accountant/GapAc/pending_gap_ac/pending_for_estimate_ac/ViewEst_view_screen_ac.dart';
import '../roles/Accountant/GapAc/pending_gap_ac/pending_for_estimate_ac/opinion_view_screen_ac.dart';
import '../roles/Accountant/GapAc/pending_gap_ac/pending_for_estimate_ac/pending_estimate_viewOpinion_screen_ac.dart';
import '../roles/Accountant/GapAc/pending_gap_ac/pending_for_estimate_ac/pending_estimate_viewest_screen_ac.dart';
import '../roles/Accountant/GapAc/pending_gap_ac/pending_for_estimate_ac/pending_for_estimate_screen_ac.dart';
import '../roles/Accountant/GapAc/pending_gap_ac/pending_for_invoice/create_invoice_screen_ac.dart';
import '../roles/Accountant/GapAc/pending_gap_ac/pending_for_invoice/invoice_edit_screen_ac.dart';
import '../roles/Accountant/GapAc/pending_gap_ac/pending_for_invoice/pending_for_invoice_screen_ac.dart';
import '../roles/Accountant/GapAc/pending_gap_ac/pending_for_invoiceVerify_ac/pending_for_invoiceVerify_screen_ac.dart';
import '../roles/Accountant/GapAc/pending_gap_ac/pending_gap_screen_ac.dart';
import '../roles/Accountant/MoreAc/estimate_more_ac/estimate_edit_more_screen_ac.dart';
import '../roles/Accountant/MoreAc/estimate_more_ac/estimate_more_screen_ac.dart';
import '../roles/Accountant/MoreAc/estimate_more_ac/estimate_more_view_ac.dart';
import '../roles/Accountant/MoreAc/invoice_more_ac/invoice_edit_more_screen_ac.dart';
import '../roles/Accountant/MoreAc/invoice_more_ac/invoice_more_screen_ac.dart';
import '../roles/Accountant/MoreAc/invoice_more_ac/invoice_more_view_ac.dart';
import '../roles/Accountant/MoreAc/proposal_more_ac/proposal_edit_more_screen_ac.dart';
import '../roles/Accountant/MoreAc/proposal_more_ac/proposal_more_screen_ac.dart';
import '../roles/Accountant/MoreAc/proposal_more_ac/proposal_more_view_ac.dart';
import '../roles/Accountant/PaymentsAc/expenditure_payment_ac/expenditure_payment_screen_ac.dart';
import '../roles/Accountant/PaymentsAc/expenditure_payment_ac/expenditure_payment_view_screen_ac.dart';
import '../roles/Accountant/PaymentsAc/request_payment_ac/request_payment_screen_ac.dart';
import '../roles/Accountant/PaymentsAc/request_payment_ac/request_payment_view_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/business_ac/business_overview_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/business_ac/business_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/business_ac/estimates_business_ac/estimates_business_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/business_ac/estimates_business_ac/estimates_business_view_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/business_ac/invoice_business_ac/inovice_business_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/business_ac/invoice_business_ac/inovice_business_view_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/business_ac/proposals_business_ac/proposals_business_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/business_ac/proposals_business_ac/proposals_business_view_screen_ac.dart';
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
import '../roles/Accountant/UserAc/browse_users/delivery_partner_ac/estimate_dp_ac/estimate_dp_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/delivery_partner_ac/estimate_dp_ac/estimate_dp_view_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/delivery_partner_ac/expenditure_dp_ac/expenditure_dp_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/delivery_partner_ac/expenditure_dp_ac/expenditure_dp_view_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/delivery_partner_ac/request_dp_ac/request_dp_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/delivery_partner_ac/request_dp_ac/request_dp_view_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/incharge_ac/estimate_incharge_ac/estimate_incharge_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/incharge_ac/estimate_incharge_ac/estimate_incharge_view_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/incharge_ac/expenditure_incharge_ac/expenditure_incharge_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/incharge_ac/expenditure_incharge_ac/expenditure_incharge_view_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/incharge_ac/incharge_overview_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/incharge_ac/incharge_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/incharge_ac/request_inchage_ac/request_incharge_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/incharge_ac/request_inchage_ac/request_incharge_view_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/mra_ac/estimate_mra_screen_ac/estimate_mra_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/mra_ac/estimate_mra_screen_ac/estimate_mra_view_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/mra_ac/expenditure_mra_ac/expenditure_mra_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/mra_ac/expenditure_mra_ac/expenditure_mra_view_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/mra_ac/mra_overview_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/mra_ac/mra_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/mra_ac/request_mra_ac/request_mra_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/mra_ac/request_mra_ac/request_mra_view_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/regional_head_ac/estimate_regionalHead_ac/emtimate_regionalHead_view_ac.dart';
import '../roles/Accountant/UserAc/browse_users/regional_head_ac/estimate_regionalHead_ac/estimate_regionalHead_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/regional_head_ac/expenditure_regionalHead_ac/expenditure_regionalHead_View_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/regional_head_ac/expenditure_regionalHead_ac/expenditure_regionalHead_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/regional_head_ac/regional_head_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/regional_head_ac/regionalhead_overview_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/regional_head_ac/request_regionalHead_ac/request_regionalHead_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/regional_head_ac/request_regionalHead_ac/request_regionalHead_view_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/state_head_ac/stateHead_overView_ac/estimates_stateHead_ac/estimate_stateHead_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/state_head_ac/stateHead_overView_ac/estimates_stateHead_ac/estimate_stateHead_view_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/state_head_ac/stateHead_overView_ac/expenditure_stateHead_ac/exprenditure_stateHead_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/state_head_ac/stateHead_overView_ac/expenditure_stateHead_ac/exprenditure_view_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/state_head_ac/stateHead_overView_ac/flowEstimate_stateHead_ac/flowEstimate_stateHead_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/state_head_ac/stateHead_overView_ac/flowEstimate_stateHead_ac/flowEstimate_view_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/state_head_ac/stateHead_overView_ac/invoce_stateHead_ac/invoce_stateHead_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/state_head_ac/stateHead_overView_ac/invoce_stateHead_ac/invoice_stateHead_view_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/state_head_ac/stateHead_overView_ac/proposals_stateHead_ac/proposals_stateHead_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/state_head_ac/stateHead_overView_ac/proposals_stateHead_ac/proposals_stateHead_view_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/state_head_ac/stateHead_overView_ac/request_stateHead_ac/request_stateHead_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/state_head_ac/stateHead_overView_ac/request_stateHead_ac/request_view_screen_ac.dart';
import '../roles/Accountant/UserAc/browse_users/state_head_ac/stateHead_overView_ac/stateHead_overView_screen_ac.dart';
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
      path: '/add_leads_screen_mra',
      builder: (context, state) => AddLeadsScreenMra(),
    ),

    GoRoute(
      path: '/lead_detail_screen_mra',
      builder: (context, state) => LeadDetailScreenMra(),
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

    GoRoute(
      path: '/ac_Flowestimate_StateHead_screen',
      name: 'acFlowestimateStateHead',
      builder: (context, state) => FlowestimateStateHeadScreenAc(),
    ),

    GoRoute(
      name: 'acFlowEstimateView',
      path: '/ac-flow-estimate-view',
      builder: (context, state) {
        final status = state.extra as String;
        return FlowEstimateViewScreenAc(
          status: status, // Pending / Approved / Rejected
        );
      },
    ),

    GoRoute(
      name: 'acRequestView',
      path: '/ac-Request-view',
      builder: (context, state) {
        final status = state.extra as String;
        return RequestViewScreenAc(
          status: status, // Pending / Approved / Rejected
        );
      },
    ),

    GoRoute(
      name: 'acRequestRegionalheadView',
      path: '/ac-Request-Regionalhead-view',
      builder: (context, state) {
        final status = state.extra as String;
        return RequestRegionalheadViewScreenAc(
          status: status, // Pending / Approved / Rejected
        );
      },
    ),

    GoRoute(
      name: 'acEmtimateRegionalheadView',
      path: '/ac-Emtimate-Regionalhead-view',
      builder: (context, state) {
        final status = state.extra as String;
        return EmtimateRegionalheadViewAc(
          status: status, // Pending / Approved / Rejected
        );
      },
    ),

    GoRoute(
      name: 'acEmtimateInchargeView',
      path: '/ac-Emtimate-Incharge-view',
      builder: (context, state) {
        final status = state.extra as String;
        return EstimateInchargeViewScreenAc(
          status: status, // Pending / Approved / Rejected
        );
      },
    ),

    GoRoute(
      name: 'acRequestInchargeView',
      path: '/ac-Request-Incharge-view',
      builder: (context, state) {
        final status = state.extra as String;
        return RequestInchargeViewScreenAc(
          status: status, // Pending / Approved / Rejected
        );
      },
    ),

    GoRoute(
      name: 'acEstimateMraView',
      path: '/ac-Estimate-Mra-view',
      builder: (context, state) {
        final status = state.extra as String;
        return EstimateMraViewScreenAc(
          status: status, // Pending / Approved / Rejected
        );
      },
    ),

    GoRoute(
      name: 'acRequestMraView',
      path: '/ac-Request-Mra-view',
      builder: (context, state) {
        final status = state.extra as String;
        return RequestMraViewScreenAc(
          status: status, // Pending / Approved / Rejected
        );
      },
    ),

    GoRoute(
      name: 'acEstimateDpView',
      path: '/ac-Estimate-Dp-view',
      builder: (context, state) {
        final status = state.extra as String;
        return EstimateDpViewScreenAc(
          status: status, // Pending / Approved / Rejected
        );
      },
    ),

    GoRoute(
      name: 'acRequestDpView',
      path: '/ac-Request-Dp-view',
      builder: (context, state) {
        final status = state.extra as String;
        return RequestDpViewScreenAc(
          status: status, // Pending / Approved / Rejected
        );
      },
    ),

    GoRoute(
      name: 'acGapDpRejected',
      path: '/ac-Gap-Rejected-screen',
      builder: (context, state) {
        final status = state.extra as String;
        return GapRejectedScreenAc(
          status: status, // Pending / Approved / Rejected
        );
      },
    ),

    GoRoute(
      name: 'acGapDpApproved',
      path: '/ac-Gap-Approved-screen',
      builder: (context, state) {
        final status = state.extra as String;
        return ApprovedGapScreenAc(
          status: status, // Pending / Approved / Rejected
        );
      },
    ),

    GoRoute(
      name: 'acPendingGap',
      path: '/ac-Pending-Gap-screen',
      builder: (context, state) {
        final status = state.extra as String;
        return PendingGapScreenAc(status: status);
      },
    ),

    GoRoute(
      name: 'acRequestPaymentView',
      path: '/ac-Request-Payment-View_screen',
      builder: (context, state) {
        final status = state.extra as String;
        return RequestPaymentViewScreenAc(status: status);
      },
    ),

    GoRoute(
      name: 'acPendingForEstimate',
      path: '/ac_Pending_ForEstimate_screen',
      builder: (context, state) {
        final status = state.extra as String;
        return PendingForEstimateScreenAc(status: status);
      },
    ),

    GoRoute(
      path: '/ac-Pending-For-Invoiceverify',
      name: 'acPendingForInvoiceverify',
      builder: (context, state) {
        final status = state.extra as String;
        return PendingForInvoiceverifyScreenAc(status: status);
      },
    ),

    GoRoute(
      name: 'acViewestView',
      path: '/ac_Viewest_View_screen',
      builder: (context, state) {
        return ViewestViewScreenAc();
      },
    ),

    GoRoute(
      name: 'acPendingEstimateViewopinion',
      path: '/ac_Pending_Estimate_Viewopinion_screen',
      builder: (context, state) {
        return PendingEstimateViewopinionScreenAc();
      },
    ),

    GoRoute(
      name: 'acOpinionView',
      path: '/ac_Opinion_View_screen',
      builder: (context, state) {
        return OpinionViewScreenAc();
      },
    ),

    GoRoute(
      name: 'acPendingForInvoice',
      path: '/ac_Pending_ForInvoice_screen',
      builder: (context, state) {
        return PendingForInvoiceScreenAc();
      },
    ),

    GoRoute(
      name: 'acCreateInvoice',
      path: '/ac_Create_Invoice_screen',
      builder: (context, state) {
        return CreateInvoiceScreenAc();
      },
    ),

    GoRoute(
      name: 'acInvoiceEdit',
      path: '/ac_Invoice_Edit_screen',
      builder: (context, state) {
        return const InvoiceEditScreenAc(status: "pending");
      },
    ),



    GoRoute(
      name: 'acInvoiceEditMore',
      path: '/ac_Invoice_Edit_More_screen',
      builder: (context, state) {
        return const InvoiceEditMoreScreenAc(status: "pending");
      },
    ),


 GoRoute(
      name: 'acEstimateEditMore',
      path: '/ac_Estimate_Edit_More_screen',
      builder: (context, state) {
        return const EstimateEditMoreScreenAc(status: "pending");
      },
    ),


 GoRoute(
      name: 'acProposalEditMore',
      path: '/ac_Proposal_Edit_More_screen',
      builder: (context, state) {
        return const ProposalEditMoreScreenAc(status: "pending");
      },
    ),












    GoRoute(
      path: '/ac-Pending-Estimate-Viewest',
      name: 'acPendingEstimateViewest',
      builder: (context, state) => PendingEstimateViewestScreenAc(),
    ),

    GoRoute(
      path: '/ac-Expenditure-Incharge-view',
      name: 'acExpenditureInchargeView',
      builder: (context, state) => ExpenditureInchargeViewScreenAc(),
    ),

    GoRoute(
      path: '/ac-Request-Payment-Screen',
      name: 'acRequestPayment',
      builder: (context, state) => RequestPaymentScreenAc(),
    ),

    GoRoute(
      path: '/ac_Estimate_Regionalhead_screen',
      name: 'acEstimateRegionalhead',
      builder: (context, state) => EstimateRegionalheadScreenAc(),
    ),

    GoRoute(
      path: '/ac_Estimate_Incharge_screen',
      name: 'acEstimateIncharge',
      builder: (context, state) => EstimateInchargeScreenAc(),
    ),

    GoRoute(
      path: '/ac_Request_Incharge_screen',
      name: 'acRequestIncharge',
      builder: (context, state) => RequestInchargeScreenAc(),
    ),

    GoRoute(
      path: '/ac_Expenditure_Incharge_screen',
      name: 'acExpenditureIncharge',
      builder: (context, state) => ExpenditureInchargeScreenAc(),
    ),

    GoRoute(
      path: '/ac_Estimate_Mra_screen',
      name: 'acEstimateMra',
      builder: (context, state) => EstimateMraScreenAc(),
    ),

    GoRoute(
      path: '/ac_Request_Mra_screen',
      name: 'acRequestMra',
      builder: (context, state) => RequestMraScreenAc(),
    ),

    GoRoute(
      path: '/ac_Expenditure_Mra_screen',
      name: 'acExpenditureMra',
      builder: (context, state) => ExpenditureMraScreenAc(),
    ),

    GoRoute(
      path: '/ac_Expenditure_Mra_View_screen',
      name: 'acExpenditureMraView',
      builder: (context, state) => ExpenditureMraViewScreenAc(),
    ),

    GoRoute(
      path: '/ac_Estimate_Dp_screen',
      name: 'acEstimateDp',
      builder: (context, state) => EstimateDpScreenAc(),
    ),

    GoRoute(
      path: '/ac_Expenditure_Dp_screen',
      name: 'acExpenditureDp',
      builder: (context, state) => ExpenditureDpScreenAc(),
    ),

    GoRoute(
      path: '/ac_Expenditure_Dp_View_screen',
      name: 'acExpenditureDpView',
      builder: (context, state) => ExpenditureDpViewScreenAc(),
    ),

    GoRoute(
      path: '/ac_Request_Dp_screen',
      name: 'acRequestDp',
      builder: (context, state) => RequestDpScreenAc(),
    ),

    GoRoute(
      path: '/ac_Inovice_Business_screen',
      name: 'acInoviceBusiness',
      builder: (context, state) => InoviceBusinessScreenAc(),
    ),

    GoRoute(
      path: '/ac_Inovice_Business_View_screen',
      name: 'acInoviceBusinessView',
      builder: (context, state) => InoviceBusinessViewScreenAc(),
    ),

    GoRoute(
      path: '/ac_Estimates_Business_screen',
      name: 'acEstimatesBusiness',
      builder: (context, state) => EstimatesBusinessScreenAc(),
    ),

    GoRoute(
      path: '/ac_Estimates_Business_View_screen',
      name: 'acEstimatesBusinessView',
      builder: (context, state) => EstimatesBusinessViewScreenAc(),
    ),

    GoRoute(
      path: '/ac_Proposals_Business_screen',
      name: 'acProposalsBusiness',
      builder: (context, state) => ProposalsBusinessScreenAc(),
    ),

    GoRoute(
      path: '/ac_Proposals_Business_View_screen',
      name: 'acProposalsBusinessView',
      builder: (context, state) => ProposalsBusinessViewScreenAc(),
    ),

    GoRoute(
      path: '/ac_Request_StateHead_screen',
      name: 'acRequestStateHead',
      builder: (context, state) => RequestStateHeadScreenAc(),
    ),

    GoRoute(
      path: '/ac_Exprenditure_StateHead_screen',
      name: 'acExprenditureStateHead',
      builder: (context, state) => ExprenditureStateHeadScreenAc(),
    ),

    GoRoute(
      path: '/ac_Exprenditure_View_screen',
      name: 'acExprenditureView',
      builder: (context, state) => ExprenditureViewScreenAc(),
    ),

    GoRoute(
      path: '/ac_Invoce_Statehead_screen',
      name: 'acInvoceStatehead',
      builder: (context, state) => InvoceStateheadScreenAc(),
    ),

    GoRoute(
      path: '/ac_Invoice_Statehead_View_screen',
      name: 'acInvoiceStateheadView',
      builder: (context, state) => InvoiceStateheadViewScreenAc(),
    ),

    GoRoute(
      path: '/ac_Estimate_Statehead_screen',
      name: 'acEstimateStatehead',
      builder: (context, state) => EstimateStateheadScreenAc(),
    ),

    GoRoute(
      path: '/ac_Proposals_Statehead_screen',
      name: 'acProposalsStatehead',
      builder: (context, state) => ProposalsStateheadScreenAc(),
    ),

    GoRoute(
      path: '/ac_Estimate_Statehead_View_screen',
      name: 'acEstimateStateheadView',
      builder: (context, state) => EstimateStateheadViewScreenAc(),
    ),

    GoRoute(
      path: '/ac_Proposals_Statehead_View_screen',
      name: 'acProposalsStateheadView',
      builder: (context, state) => ProposalsStateheadViewScreenAc(),
    ),

    GoRoute(
      path: '/ac_Expenditure_Regionalhead_screen',
      name: 'acExpenditureRegionalhead',
      builder: (context, state) => ExpenditureRegionalheadScreenAc(),
    ),

    GoRoute(
      path: '/ac_Request_Regionalhead_screen',
      name: 'acRequestRegionalhead',
      builder: (context, state) => RequestRegionalheadScreenAc(),
    ),

    GoRoute(
      path: '/ac_Expenditure_Payment_screen',
      name: 'acExpenditurePayment',
      builder: (context, state) => ExpenditurePaymentScreenAc(),
    ),

    GoRoute(
      path: '/ac_Expenditure_Payment_View_screen',
      name: 'acExpenditurePaymentView',
      builder: (context, state) => ExpenditurePaymentViewScreenAc(),
    ),

    GoRoute(
      path: '/ac_Expenditure_Regionalhead_View_screen',
      name: 'acExpenditureRegionalheadView',
      builder: (context, state) => ExpenditureRegionalheadViewScreenAc(),
    ),









    GoRoute(
      path: '/ac_Invoice_More_View',
      name: 'acInvoiceMoreView',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>?;
        return InvoiceMoreViewAc(status: data?['status']);
      },
    ),

    GoRoute(
      path: '/ac_Estimate_More_View',
      name: 'acEstimateMoreView',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>?;
        return EstimateMoreViewAc(status: data?['status']);
      },
    ),


GoRoute(
      path: '/ac_Proposal_More_View',
      name: 'acProposalMoreView',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>?;
        return ProposalMoreViewAc(status: data?['status']);
      },
    ),












    GoRoute(
      path: '/ac_Invoice_More_screen',
      name: 'acInvoiceMore',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return InvoiceMoreScreenAc(
          icon: extra['icon'], // Widget
          title: extra['title'],
        );
      },
    ),


      GoRoute(
      path: '/ac_Estimate_More_screen',
      name: 'acEstimateMore',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return EstimateMoreScreenAc(
          icon: extra['icon'], // Widget
          title: extra['title'],
        );
      },
    ),



 GoRoute(
      path: '/ac_Proposal_More_screen',
      name: 'acProposalMore',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return ProposalMoreScreenAc(
          icon: extra['icon'], // Widget
          title: extra['title'],
        );
      },
    ),










  ],
);
