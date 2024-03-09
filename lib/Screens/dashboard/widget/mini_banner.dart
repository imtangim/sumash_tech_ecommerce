import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MiniBanner extends StatelessWidget {
  const MiniBanner({
    super.key,
    required this.poster,
  });

  final String poster;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 106.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            poster,
          ),
        ),
      ),
    );
  }
}
