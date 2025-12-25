import 'package:e_digivault_org_app/roles/common/login/controller/login_controller.dart';
import 'package:e_digivault_org_app/routes/app_routes.dart';
import 'package:e_digivault_org_app/utils/app_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize  controller
  Get.put(AuthController());
  await AppStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          title: 'ORG APP',
          theme: ThemeData(
            colorScheme: .fromSeed(seedColor: Colors.deepPurple),
          ),
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
