import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/Data/models/user/cartdata_model.dart';
import 'package:sumash_tech_project/Data/models/user/user.dart';
import 'package:sumash_tech_project/Data/network_caller/network_caller.dart';
import 'package:sumash_tech_project/Data/network_caller/network_response.dart';
import 'package:sumash_tech_project/Data/utils/urls.dart';
import 'package:sumash_tech_project/controller/bottomnav_controller.dart';
import 'package:sumash_tech_project/controller/shared_preference_controller.dart';
import 'package:sumash_tech_project/widgets/snackabr.dart';

class AuthController extends GetxController {
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();

  SharedPreferenceController sharedPreferenceController =
      Get.put(SharedPreferenceController());
  BottomNavBarController bottomNavBarController =
      Get.put(BottomNavBarController());
  bool isLoading = false;
  bool isError = false;
  Future<void> login(BuildContext context) async {
    log("Trying to log you in...");
    try {
      isLoading = true;

      update();

      final NetworkResponse tokenResponse = await NetworkCaller().postRequest(
        Urls.token,
        body: {"username": phone.text.trim(), "password": password.text},
        islogin: true,
      );
      log(tokenResponse.jsonResponse.toString());
      if (tokenResponse.isSuccess) {
        await sharedPreferenceController.saveUserToken(
          tokenResponse.jsonResponse!['access'],
        );

        try {
          final NetworkResponse profileResponse =
              await NetworkCaller().getRequest(
            Urls.profile,
          );
          List<dynamic> cartData =
              profileResponse.jsonResponse!["cart_data"] ?? [];
          List<CartDataModel> cartFilteredData =
              cartData.map((json) => CartDataModel.fromJson(json)).toList();
          await sharedPreferenceController.saveUserInformation(
            UserModel(
              status: profileResponse.jsonResponse!["status"],
              cartData: cartFilteredData,
              customerId: profileResponse.jsonResponse!["customer_id"],
              dateOfBirth: profileResponse.jsonResponse!["date_of_birth"],
              dateOfBirthUpdated:
                  profileResponse.jsonResponse!["date_of_birth_updated"],
              district: profileResponse.jsonResponse!["district"],
              genderText: profileResponse.jsonResponse!["gender_text"],
              name: profileResponse.jsonResponse!["name"],
              phoneNumber: profileResponse.jsonResponse!["phone_number"],
              point: profileResponse.jsonResponse!["point"],
              profilePhoto: profileResponse.jsonResponse!["profile_photo"],
              referralCode: profileResponse.jsonResponse!["referral_Code"],
            ),
          );
          bottomNavBarController.changeTab(0);

          // ignore: use_build_context_synchronously
          showSnackMessage(context,
              "HI ${sharedPreferenceController.user!.name}.", Colors.green);
          isLoading = false;
          isError = false;
          signinClear();
          update();
        } catch (e) {
          log(e.toString());
        }
      } else {
        if (tokenResponse.statusCode == 401 || tokenResponse.statusCode == -1) {
          password.clear();
          isError = true;

          update();
        } else {
          signinClear();
          log(tokenResponse.statusCode.toString());
          // showSnackMessage(
          //   context,
          //   "Something went wrong. Try again latter.",
          //   Colors.red,
          // );
        }
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<UserModel> getProfileInfo() async {
    try {
      final NetworkResponse profileResponse = await NetworkCaller().getRequest(
        Urls.profile,
      );
      List<dynamic> cartData = profileResponse.jsonResponse!["cart_data"] ?? [];
      List<CartDataModel> cartFilteredData =
          cartData.map((json) => CartDataModel.fromJson(json)).toList();

      return UserModel(
        status: profileResponse.jsonResponse!["status"],
        cartData: cartFilteredData,
        customerId: profileResponse.jsonResponse!["customer_id"],
        dateOfBirth: profileResponse.jsonResponse!["date_of_birth"],
        dateOfBirthUpdated:
            profileResponse.jsonResponse!["date_of_birth_updated"],
        district: profileResponse.jsonResponse!["district"],
        genderText: profileResponse.jsonResponse!["gender_text"],
        name: profileResponse.jsonResponse!["name"],
        phoneNumber: profileResponse.jsonResponse!["phone_number"],
        point: profileResponse.jsonResponse!["point"],
        profilePhoto: profileResponse.jsonResponse!["profile_photo"],
        referralCode: profileResponse.jsonResponse!["referral_Code"],
      );
    } catch (e) {
      return UserModel();
    }
  }

  void signinClear() {
    phone.clear();
    password.clear();
  }

  @override
  void dispose() {
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
