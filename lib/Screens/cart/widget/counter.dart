import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sumash_tech_project/Data/models/user/cart_model.dart';


class Counter extends StatelessWidget {
  final CartModel model;
  const Counter({
    super.key, required this.model,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 13.w, vertical: 8.h),
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(color: Colors.black, width: 0.1.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              height: 1.5.h,
              width: 10.w,
              color: Colors.black,
            ),
          ),
          const Text("1"),
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.add,
              size:19.sp,
            ),
          ),
        ],
      ),
    );
  }
}
