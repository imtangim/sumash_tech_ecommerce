import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/Screens/cart/cart.dart';
import 'package:sumash_tech_project/Screens/compare/compare.dart';
import 'package:sumash_tech_project/Screens/dashboard/dashboard.dart';
import 'package:sumash_tech_project/Screens/login_screen/login_screen.dart';
import 'package:sumash_tech_project/Screens/profile/profile.dart';

class BottomNavBarController extends GetxController {
  RxInt currentIndex = 0.obs;
  List<Widget> withLoginbody = [
    DashBoard(),
    const CartScreen(),
    const ProfileScreen(),
    const CompareScreen(),
  ].obs;
  List<Widget> withoutLoginbody = [
    DashBoard(),
    const AuthScreen(),
    const AuthScreen(),
    const CompareScreen(),
  ].obs;
  void changeTab(int index) {
    currentIndex.value = index;
  }
}