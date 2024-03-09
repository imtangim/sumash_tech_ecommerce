import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/Data/models/homepage_model/Models/feature_catagory.dart';
import 'package:sumash_tech_project/controller/homepage_controller.dart';

import 'catagory_list.dart';

class Catagory extends StatelessWidget {
  const Catagory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.w,
      child: Center(
        child: GetBuilder<HomepageController>(builder: (homepageController) {
          List<FeatureCatagoryModel> catagory =
              homepageController.homepageData!.featureCatagory!;
          return Wrap(
            runSpacing: 10.h,
            spacing: 20.w,
            children: [
              ...List.generate(
                catagory.length,
                (index) => CatagoryList(
                  title: catagory[index].name!,
                  photoUrl: catagory[index].icon!,
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
