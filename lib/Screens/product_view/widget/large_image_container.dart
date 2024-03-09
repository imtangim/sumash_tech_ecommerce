import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/utils/layout.dart';

class LargeImageContainer extends StatelessWidget {
  const LargeImageContainer({
    super.key,
    required this.layout,
    required this.tempUrl,
  });

  final AppLayout layout;
  final String tempUrl;

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.black,
      elevation: 1,
      borderRadius: BorderRadius.circular(layout.getHeight(5)),
      child: Container(
        height: 350.h,
        width: context.width,
        decoration: BoxDecoration(
          color: const Color.fromARGB(77, 240, 238, 238),
          borderRadius: BorderRadius.circular(layout.getHeight(5)),
          image: DecorationImage(
            image: NetworkImage(tempUrl),
          ),
        ),
      ),
    );
  }
}
