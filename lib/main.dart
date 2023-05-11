import 'package:sarathi/bindings/home_binding.dart';
import 'package:sarathi/ui/utils/routes.dart';
import 'package:sarathi/ui/views/splash.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


void main() {
  runApp(DevicePreview(enabled: false, builder: (context) => const MyApp()));
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
        initialBinding: HomeBinding(),
        // routes: ,
        getPages: getPages,
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.green,
            accentColor: Colors.purple[300],
            scaffoldBackgroundColor: Colors.grey[100],
            colorScheme: ColorScheme.light(
              primary: Colors.green,
              secondary: Colors.green.shade100,
            ),
            inputDecorationTheme: const InputDecorationTheme(
              fillColor: Colors.black12,
              labelStyle: TextStyle(color: Colors.black87),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Colors.black45, width: 2.0),
              ),
            )),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
      designSize: const Size(375, 812),
    );
  }
}
