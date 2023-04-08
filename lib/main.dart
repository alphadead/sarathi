import 'package:sarathi/controllers/user_controller.dart';
import 'package:sarathi/ui/utils/colors.dart';
import 'package:sarathi/ui/utils/routes.dart';
import 'package:sarathi/ui/views/splash.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controllers/auth_controller.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        initialBinding: BindingsBuilder(() {
          Get.put(AuthController(), permanent: true);
          Get.put(UserController(), permanent: true);
        }),
        // routes: ,
        getPages: getPages, // ro
        theme: ThemeData(
            inputDecorationTheme: const InputDecorationTheme(
          fillColor: Colors.black12,
          labelStyle: TextStyle(color: Colors.black87),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.black45, width: 2.0),
          ),
        )),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
      designSize: const Size(375, 812),
    );
  }
}
