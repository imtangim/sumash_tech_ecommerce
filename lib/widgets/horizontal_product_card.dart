import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/utils/color_scheme.dart';

class HorizontalProductCard extends StatelessWidget {
  final String photourl;
  final String title;
  final String price;
  final String? offerPrice;
  final Function() onTap;
  const HorizontalProductCard({
    super.key,
    required this.photourl,
    required this.title,
    required this.price,
    this.offerPrice,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        width: 337.w,
        // height: 112.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 78.w,
              height: 78.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: lightColorScheme.primaryContainer,
                image: DecorationImage(
                  image: NetworkImage(photourl),
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis, // Set overflow property
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "৳$price",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 16.sp,
                              color: Colors.red,
                            ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "৳${offerPrice ?? ""}",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 14.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                ],
              ).paddingSymmetric(vertical: 10.h),
            )
          ],
        ).paddingSymmetric(horizontal: 20.sp),
      ),
    );
  }
}
