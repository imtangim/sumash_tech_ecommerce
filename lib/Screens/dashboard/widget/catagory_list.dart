import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/utils/color_scheme.dart';

class CatagoryList extends StatelessWidget {
  final String title;
  final String photoUrl;
  const CatagoryList({
    super.key,
    required this.title,
    required this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: lightColorScheme.primaryContainer,
              width: 2.w,
            ),
          ),
          child: CircleAvatar(
            maxRadius: 40.r,
            backgroundColor: Colors.white,
            child: SizedBox(
              child: Image.network(photoUrl),
            ).paddingAll(15.r),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
