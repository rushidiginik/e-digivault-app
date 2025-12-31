import 'package:flutter/material.dart';
import 'package:e_digivault_org_app/routes/app_routes.dart';

enum UserRole {
  businessDevelopment,
  stateHead,
  regionalManager,
  incharge,
  marketReaserchAnalyst,
  advocate,
  accountant;

  static UserRole? fromApiString(String? apiRole) {
    if (apiRole == null) return null;

    // Convert to lowercase for case-insensitive comparison
    final roleLower = apiRole.toLowerCase();

    switch (roleLower) {
      case 'businessdevelopment':
      case 'businessdev':
        return UserRole.businessDevelopment;

      case 'statehead':
        return UserRole.stateHead;

      case 'regionhead':
      case 'regionalmanager':
        return UserRole.regionalManager;

      case 'incharge':
        return UserRole.incharge;

      case 'marketresearchanalyst':
      case 'mra':
        return UserRole.marketReaserchAnalyst;

      case 'legalHead':
        return UserRole.advocate;

      case 'accountant':
        return UserRole.accountant;

      default:
        debugPrint('Unknown API role: $apiRole');
        return null;
    }
  }
}

class OrgRoleService {
  // Current active role
  UserRole? _currentRole;

  // Set active role (later from API)
  void setRole(UserRole role) {
    _currentRole = role;
  }

  // Get active role
  UserRole? get currentRole => _currentRole;

  // Each role’s independent state
  bool isChannelPartner = false;
  bool isBD = false;
  bool isStateHead = false;
  bool isRegionalManager = false;
  bool isIncharge = false;
  bool isMRA = false;
  bool isDeliveryPartner = false;
  bool isAdvocate = false;
  bool isAccounts = false;

  // Reset and activate one role
  void activateRole(UserRole role) {
    resetRoles();
    switch (role) {
      case UserRole.businessDevelopment:
        isBD = true;
        break;
      case UserRole.stateHead:
        isStateHead = true;
        break;
      case UserRole.regionalManager:
        isRegionalManager = true;
        break;
      case UserRole.incharge:
        isIncharge = true;
        break;
      case UserRole.marketReaserchAnalyst:
        isMRA = true;
        break;

      case UserRole.advocate:
        isAdvocate = true;
        break;
      case UserRole.accountant:
        isAccounts = true;
        break;
    }
    _currentRole = role;
  }

  // Reset all roles to false
  void resetRoles() {
    isChannelPartner = false;
    isBD = false;
    isStateHead = false;
    isRegionalManager = false;
    isIncharge = false;
    isMRA = false;
    isDeliveryPartner = false;
    isAdvocate = false;
    isAccounts = false;
  }
}
