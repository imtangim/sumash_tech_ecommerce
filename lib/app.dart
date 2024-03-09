import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/Screens/splash_screen.dart';
import 'package:sumash_tech_project/controller/binder.dart';
import 'package:sumash_tech_project/utils/color_scheme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      builder: (_, child) {
        return GetMaterialApp(
          
          initialBinding: GetxDependencyBinder(),
          theme: ThemeData(
            colorScheme: lightColorScheme,
            appBarTheme: AppBarTheme(
              backgroundColor: lightColorScheme.primary,
              foregroundColor: Colors.white,
              elevation: 5,
            ),
            useMaterial3: true,
            textTheme: const TextTheme(
              titleLarge: TextStyle(
                fontFamily: "poppins",
                fontWeight: FontWeight.w900,
              ),
              labelLarge: TextStyle(
                fontFamily: "poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: const SplashScreen(),
        );
      },
    );
  }
}
