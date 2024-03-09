import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/utils/color_scheme.dart';

class VerticalProductCard extends StatelessWidget {
  final Function() onTap;
  final String url;
  final String title;
  final String price;
  final String? discountPrice;
  const VerticalProductCard({
    super.key,
    required this.onTap,
    required this.url,
    required this.title,
    required this.price,
    this.discountPrice,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 156.86.w,
        height: 210.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: 120.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                      color: lightColorScheme.primaryContainer.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10.r),
                      image: DecorationImage(
                        fit: BoxFit.scaleDown,
                        image: NetworkImage(url),
                      ),
                    ),
                  ),
                  if (discountPrice != "0")
                    Padding(
                      padding: EdgeInsets.all(8.sp),
                      child: Container(
                        width: 65.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 225, 1, 62),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Center(
                          child: Text(
                            "SAVE ${(((int.parse(price) - int.parse(discountPrice!)) / int.parse(price)) * 100).toInt()}%",
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                    overflow: TextOverflow.ellipsis, // Set overflow property
                    maxLines: 1,
                  ).paddingSymmetric(horizontal: 8.w),
                  SizedBox(
                    height: 6.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "৳$price",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 14.sp,
                              color: Colors.red,
                              fontWeight: FontWeight.w400,
                            ),
                        overflow:
                            TextOverflow.ellipsis, // Set overflow property
                        maxLines: 1,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      if (discountPrice != "0")
                        Text(
                          "৳${discountPrice!}",
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w400,
                                  ),
                          overflow:
                              TextOverflow.ellipsis, // Set overflow property
                          maxLines: 1,
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                ],
              )
            ],
          ).paddingOnly(top: 10.sp),
        ),
      ),
    );
  }
}
