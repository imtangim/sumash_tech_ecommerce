import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/Data/models/product_preview/product_preview.dart';
import 'package:sumash_tech_project/Screens/product_view/widget/small_about.dart';

class Description extends StatelessWidget {
  final ProductPreviewModel model;
  const Description({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
      width: context.width,
      decoration: BoxDecoration(
        color: const Color.fromARGB(77, 129, 163, 189),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "৳${model.mainPrice.toString()}",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 6, 120, 122),
                      fontFamily: "popins",
                    ),
              ),
              SizedBox(
                width: 25.w,
              ),
              Text(
                "৳${model.discountPrice.toString()}",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.5.sp,
                      color: Colors.black,
                      decoration: TextDecoration.lineThrough,
                      fontFamily: "popins",
                    ),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: 18.sp,
                      wordSpacing: 0.8,
                      fontFamily: "popins",
                    ),
              ),
              // SizedBox(
              //   height: 5.h,
              // ),
              // Text(
              //   "Midnight Black | 8/256GB | International",
              //   style: Theme.of(context).textTheme.titleLarge!.copyWith(
              //         fontWeight: FontWeight.w400,
              //         fontSize: 14.sp,
              //         wordSpacing: 1.5,
              //         fontFamily: "popins",
              //       ),
              // )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            model.shortDesciption,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  // fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  color: Colors.black,
                  fontFamily: "popins",
                ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.spaceBetween,
            runSpacing: 10.h,
            spacing: 10.w,
            children: [
              Container(
                height: 34.h,
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(232, 241, 240, 240),
                  borderRadius: BorderRadius.circular(5.r),
                  border: Border.all(
                    color: Colors.red.shade400,
                    width: 1.2,
                  ),
                ),
                child: Text(
                  model.brand,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Colors.red,
                        fontFamily: "popins",
                      ),
                ),
              ),
              Container(
                height: 34.h,
                width: 130.w,
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(232, 241, 240, 240),
                  borderRadius: BorderRadius.circular(5.r),
                  border: Border.all(
                    color: Colors.red.shade400,
                    width: 1.2,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.shuffle_thick,
                      color: Colors.red,
                      size: 20.h,
                    ),
                    SizedBox(
                      width: 8.h,
                    ),
                    Text(
                      "COMPARE",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: Colors.red,
                            fontFamily: "popins",
                          ),
                    )
                  ],
                ),
              ),
              Container(
                height: 34.h,
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(232, 241, 240, 240),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.red.shade400,
                    width: 1.2,
                  ),
                ),
                child: const Icon(
                  Icons.favorite_rounded,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Wrap(
            runSpacing: 10.h,
            spacing: 10.w,
            children: [
              ...List.generate(4, (index) {
                Map<String, dynamic> data = {
                  "Status": model.stockinfo > 0
                      ? "Stock Available"
                      : "Stock Unavailable",
                  "Sku": model.sku,
                  "Regular Price": model.regularPrice.toString(),
                  "Warranty": model.warranty,
                };

                return index == 0
                    ? SmallAbout(
                        title: data.keys.toList()[index],
                        description: data.values.toList()[index],
                        isStatus: true,
                        isStock: true,
                      )
                    : SmallAbout(
                        title: data.keys.toList()[index],
                        description: data.values.toList()[index],
                        isStatus: false,
                        isStock: false,
                      );
              })
            ],
          )
        ],
      ),
    );
  }
}
