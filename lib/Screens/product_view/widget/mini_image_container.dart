import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MiniImageContainer extends StatelessWidget {
 final String url;
  const MiniImageContainer({
    super.key,
   
    required this.url,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: 90.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: const Color.fromARGB(77, 240, 238, 238),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(url),
        ),
      ),
    );
  }
}
