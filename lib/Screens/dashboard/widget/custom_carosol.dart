import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/Data/models/homepage_model/Models/slider.dart';
import 'package:sumash_tech_project/controller/homepage_controller.dart';

class CustomCarosol extends StatelessWidget {
  const CustomCarosol({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 8.0.w, right: 8.w, top: 25.h, bottom: 10.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: GetBuilder<HomepageController>(builder: (homepageController) {
          List<SliderData>? slider = homepageController.homepageData!.sliders;
          return FlutterCarousel(
            options: CarouselOptions(
              floatingIndicator: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              disableCenter: true,
              viewportFraction: context.width > 800.0 ? 0.8 : 1.0,
              height: 172.h,
              enableInfiniteScroll: true,
              slideIndicator: CircularSlideIndicator(
                indicatorBackgroundColor: Theme.of(context).colorScheme.primary,
                alignment: Alignment.bottomCenter,
                indicatorBorderColor: Colors.red,
                indicatorBorderWidth: BorderSide.strokeAlignOutside,
              ),
            ),
            items: <Widget>[
              ...List.generate(
                slider!.length,
                (index) => GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(slider[index].image!),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
