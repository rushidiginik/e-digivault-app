import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:flutter/material.dart';

class CommonDivider extends StatelessWidget {
  const CommonDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: AppStyles.greyDE, // greyish divider line
    );
  }
}
