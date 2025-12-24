import 'package:e_digivault_org_app/routes/app_routes.dart';
import 'package:e_digivault_org_app/utils/app_storage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
          theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
