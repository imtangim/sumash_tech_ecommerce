import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Guidance extends StatelessWidget {
  final String reviewState;
  final String bookingMoney;
  final bool emi;
  final String point;
  const Guidance({
    super.key,
    required this.reviewState,
    required this.bookingMoney,
    required this.emi,
    required this.point,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 10,
        spacing: 5,
        children: [
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            height: 90.54.h,
            width: 130.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.reviews),
                Text(
                  reviewState,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontFamily: "popins",
                        fontSize: 18.sp,
                      ),
                ),
                Text(
                  "Star Review",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontFamily: "popins",
                        fontSize: 12.sp,
                      ),
                )
              ],
            ),
          ),
          Container(
            height: 90.54.h,
            width: 130.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.attach_money_rounded,
                  size: 25.spMax,
                ),
                Text(
                  bookingMoney,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontFamily: "popins",
                        fontSize: 18.sp,
                      ),
                ),
                Text(
                  "Booking Money",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontFamily: "popins",
                        fontSize: 13.sp,
                      ),
                )
              ],
            ),
          ),
          Container(
            height: 90.54.h,
            width: 130.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.sp),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.gift_fill,
                  size: 25.spMax,
                ),
                Text(
                  point,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontFamily: "popins",
                      ),
                ),
                Text(
                  "Purchase Point",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontFamily: "popins",
                        fontSize: 12.sp,
                      ),
                )
              ],
            ),
          ),
          Container(
            height: 90.54.h,
            width: 130.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.calculate_outlined,
                  size: 25.spMax,
                ),
                Text(
                  "EMI",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontFamily: "popins",
                      ),
                ),
                Text(
                  emi ? "Available" : "Not Available",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontFamily: "popins",
                      ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
