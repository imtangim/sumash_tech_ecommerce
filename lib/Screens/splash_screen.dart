import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/Screens/bottom_nav/bottomnavrbar.dart';
import 'package:sumash_tech_project/controller/homepage_controller.dart';
import 'package:sumash_tech_project/controller/shared_preference_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final HomepageController controller = Get.put(HomepageController());
  late SharedPreferenceController sharedPreferenceController;
  @override
  void initState() {
    super.initState();
    sharedPreferenceController = Get.put(SharedPreferenceController());
     
    checkAuthState(sharedPreferenceController);
    initializePageData();
  }

  void initializePageData() async {
    await controller.fetchHomePageData();
    if (controller.homepageData != null) {
      Get.offAll(() =>  MainBottomNavBar());
    }
  }

  void checkAuthState(SharedPreferenceController controller) async {
    log("Checking auth state...");
    await controller.checkAuthState();
    log("State: ${controller.authState}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.height,
        width: context.width,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: SizedBox(
            width: 200,
            height: 300,
            child: Image.asset(
              "assets/logo/logo.png",
            ),
          ),
        ),
      ),
    );
  }
}
