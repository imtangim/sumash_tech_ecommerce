import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/utils/layout.dart';

class FilterBottomSheet extends StatelessWidget {
  FilterBottomSheet({super.key});
  final List<String> displayType = [
    "PLS LCD",
    "TFT",
    "IPS",
    "AMOLED",
    "Super Amoled",
    "OLED",
    "Dynamic Amoled"
  ];
  final List<String> ramType = [
    "2GB",
    "3GB",
    "4GB",
    "6GB",
    "8GB",
    "12GB",
    "16GB",
    "18GB",
  ];
  final List<String> internalMemType = [
    "32GB",
    "64GB",
    "128GB",
    "256GB",
    "512GB",
    "1TB",
  ];
  final List<String> chipsetType = [
    "Snapdragon",
    "MediaTek",
    "Exynos",
    "Bionic",
    "Tensor",
    "Kirin",
    "Unisoc",
    "Apple",
  ];
  final List<String> regionType = [
    "Indian",
    "UK",
    "USA",
    "Japan",
    "International",
    "Singapore",
    "China",
    "Vietnam",
    "Canada",
    "Hongkong",
  ];
  final List<String> brandType = [
    "Apple",
    "Xiaomi",
    "Samsung",
    "Oneplus",
    "Realme",
    "Oppo",
    "Vivo",
    "Nokia",
    "IQOO",
    "Asus",
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.7,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomFilterButton(
              title: "Brand",
              type: brandType,
            ).paddingSymmetric(horizontal: 20.w, vertical: 5.h),
            CustomFilterButton(
              title: "Display Type",
              type: displayType,
            ).paddingSymmetric(horizontal: 20.w, vertical: 5.h),
            CustomFilterButton(
              title: "Ram",
              type: ramType,
            ).paddingSymmetric(horizontal: 20.w, vertical: 5.h),
            CustomFilterButton(
              title: "Internal Storage",
              type: internalMemType,
            ).paddingSymmetric(horizontal: 20.w, vertical: 5.h),
            CustomFilterButton(
              title: "Chipset",
              type: chipsetType,
            ).paddingSymmetric(horizontal: 20.w, vertical: 5.h),
            CustomFilterButton(
              title: "Region",
              type: regionType,
            ).paddingSymmetric(horizontal: 20.w, vertical: 5.h),
          ],
        ),
      ),
    );
  }
}

class CustomFilterButton extends StatefulWidget {
  final String title;
  final List<String> type;
  const CustomFilterButton({
    super.key,
    required this.title,
    required this.type,
  });

  @override
  State<CustomFilterButton> createState() => _CustomFilterButtonState();
}

class _CustomFilterButtonState extends State<CustomFilterButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isPlus = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: 0.98,
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = AppLayout(context: context);
    return GestureDetector(
      onTap: () {
        if (_isPlus) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
        _isPlus = !_isPlus;
        setState(() {});
      },
      child: Container(
        // height: _isPlus ? 50 : 200,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red, width: 0.1.w),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: layout.getwidth(50),
                ),
                Stack(
                  children: [
                    Container(
                      width: 16.w,
                      height: 1,
                      color: Colors.black,
                    ),
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _controller.value *
                              0.5 *
                              3.14159, // Rotate 90 degrees

                          child: Container(
                            width: layout.getwidth(16),
                            height: 1,
                            color: Colors.black,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ).paddingSymmetric(horizontal: 26.w, vertical: 14.h),
            if (!_isPlus)
              Divider(
                color: Colors.red,
                height: 5.h,
                thickness: 0.1,
              ).paddingSymmetric(horizontal: 10.w),
            if (!_isPlus)
              Wrap(
                spacing: 10.w, // Spacing between items
                runSpacing: 0,

                children: [
                  ...List.generate(widget.type.length, (index) {
                    return TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(40.w, 10.h),
                        side: const BorderSide(color: Colors.black45, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(layout.getHeight(3)),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        widget.type[index],
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 11.sp),
                      ),
                    );
                  })
                ],
              )
          ],
        ),
      ),
    );
  }
}
