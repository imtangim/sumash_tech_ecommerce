import 'package:get/get.dart';
import 'package:sumash_tech_project/controller/auth_controller.dart';
import 'package:sumash_tech_project/controller/bottomnav_controller.dart';
import 'package:sumash_tech_project/controller/cart_controller.dart';
import 'package:sumash_tech_project/controller/counter_controller.dart';
import 'package:sumash_tech_project/controller/homepage_controller.dart';
import 'package:sumash_tech_project/controller/product_preview_controller.dart';
import 'package:sumash_tech_project/controller/shared_preference_controller.dart';

class GetxDependencyBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavBarController());
    Get.put(CounterController());
    Get.put(HomepageController());
    Get.put(ProductPreviewController());
    Get.put(SharedPreferenceController());
    Get.put(AuthController());
    Get.put(CartController());
  }
}
