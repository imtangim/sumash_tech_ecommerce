import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/Screens/bottom_nav/delegates/delegates.dart';
import 'package:sumash_tech_project/Screens/bottom_nav/drawer/drawer.dart';
import 'package:sumash_tech_project/controller/bottomnav_controller.dart';
import 'package:sumash_tech_project/controller/shared_preference_controller.dart';
import 'package:sumash_tech_project/utils/color_scheme.dart';

class MainBottomNavBar extends StatelessWidget {
  final SharedPreferenceController sharedPreferenceController =
      Get.find<SharedPreferenceController>();
  final BottomNavBarController bottombarCOntroller =
      Get.find<BottomNavBarController>();
  MainBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: lightColorScheme.primary,
          foregroundColor: Colors.white,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchProductDelegates(),
                  
                );
              },
              icon: const Icon(Icons.search),
            ),
          ]),
      drawer: SafeArea(
          child: Drawer(
        child: CustomDrawer(),
      )),
      body: Obx(() => IndexedStack(
            index: bottombarCOntroller.currentIndex.value,
            children: sharedPreferenceController.authState!
                ? bottombarCOntroller.withLoginbody
                : bottombarCOntroller.withoutLoginbody,
          )),
      bottomNavigationBar:
          GetBuilder<BottomNavBarController>(builder: (controller) {
        return GetBuilder<SharedPreferenceController>(builder: (cachememory) {
          return BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (value) {
              controller.changeTab(value);
            },
            backgroundColor: Theme.of(context).colorScheme.primary,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            currentIndex: controller.currentIndex.value,
            elevation: 2,
            unselectedFontSize: 0,
            iconSize: 30,
            selectedFontSize: 0,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 65.w,
                  height: 40.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Icon(Icons.shopping_basket_outlined),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: EdgeInsets.all(4.h),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Obx(
                            () => Text(
                              sharedPreferenceController.count.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    fontSize: 11.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ).paddingOnly(top: 5.h),
                label: "",
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "",
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.earbuds),
                label: "",
              ),
            ],
          );
        });
      }),
    );
  }
}
