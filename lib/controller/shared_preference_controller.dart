import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sumash_tech_project/Data/models/user/cartdata_model.dart';
import 'package:sumash_tech_project/Data/models/user/user.dart';
import 'package:sumash_tech_project/controller/auth_controller.dart';
import 'package:sumash_tech_project/controller/bottomnav_controller.dart';

class SharedPreferenceController extends GetxController {
  BottomNavBarController bottomNavBarController =
      Get.put(BottomNavBarController());
  String? token;
  UserModel? user;
  SharedPreferences? _sharedPreferences;
  bool? authState;
  List<CartDataModel> cartItem = <CartDataModel>[].obs;
  RxInt count = <CartDataModel>[].length.obs;

  Future<void> initializePreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveUserInformation(UserModel userModel) async {
    if (_sharedPreferences == null) {
      // Initialize preferences if not already initialized
      await initializePreferences();
    }
    await _sharedPreferences?.setString('user', jsonEncode(userModel.toJson()));
    user = userModel;
    if (cartItem.isEmpty) {
      for (var item in user!.cartData!) {
        cartItem.add(item);
      }
    }

    authState = true;
    update();
  }

  Future<void> saveUserToken(String userToken) async {
    if (_sharedPreferences == null) {
      // Initialize preferences if not already initialized
      await initializePreferences();
    }
    await _sharedPreferences?.setString("token", userToken);
    token = userToken;
    update();
  }

  Future<void> initializeUserCache() async {
    if (_sharedPreferences == null) {
      // Initialize preferences if not already initialized
      await initializePreferences();
    }
    AuthController authController = Get.put(AuthController());
    token = _sharedPreferences?.getString("token");
    UserModel tempModel = await authController.getProfileInfo();

    user = UserModel.fromJson(
      jsonDecode(_sharedPreferences?.getString('user') ?? "{}"),
    );
    if (tempModel.status == 1) {
      if (tempModel.cartData!.length != user!.cartData!.length) {
        user = tempModel;
      }
      for (var item in user!.cartData!) {
        cartItem.add(item);
      }
      count.value = cartItem.length;
      authState = true;
      update();
    } else {
      authState = false;
      logout();
      update();
    }
  }

  Future<void> checkAuthState() async {
    if (_sharedPreferences == null) {
      // Initialize preferences if not already initialized
      await initializePreferences();
    }
    token = _sharedPreferences?.getString('token');

    if (token != null) {
      await initializeUserCache();

      update();
    } else {
      authState = false;
      update();
    }
  }

  Future<void> logout() async {
    if (_sharedPreferences == null) {
      // Initialize preferences if not already initialized
      await initializePreferences();
    }
    _sharedPreferences?.clear();
    authState = false;
    token = null;
    user = null;
    bottomNavBarController.changeTab(0);
    cartItem.clear();
    count.value = 0;
    update();
  }

  Future<void> removeItem(String cartID) async {
    cartItem.removeWhere((element) {
      log("${element.productID}:$cartID");
      return element.productID == int.parse(cartID);
    });
    count.value = cartItem.length;

    update();
    log("Item removed from local");
  }
}
