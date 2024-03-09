import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  final List<String> catargory = [
    "Phone",
    "Tablet",
    "Laptop",
    "Smart Watch",
    "Gadget",
    "Sound Appliance",
    "Accessories",
    "Feature Phones",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset("assets/logo/sumashtech-logo.webp")
            .paddingSymmetric(horizontal: 40.w, vertical: 20.h),
        ...List.generate(
          catargory.length,
          (index) => Catargory(title: catargory[index]),
        ),
      ],
    );
  }
}

class Catargory extends StatefulWidget {
  final String title;
  const Catargory({super.key, required this.title});

  @override
  State<Catargory> createState() => _CatargoryState();
}

class _CatargoryState extends State<Catargory>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      value: 00,
      duration: const Duration(milliseconds: 200),
    );
  }

  bool _isDown = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        if (!_isDown) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
        _isDown = !_isDown;
        setState(() {});
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.normal,
                    ),
              ),
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  log(_controller.value.toString());
                  return Transform.rotate(
                    angle: _controller.value * 3.141592,
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                    ),
                  );
                },
              )
            ],
          ),
          SizedBox(
            height: 11.h,
          ),
          const Divider(
            color: Colors.red,
            thickness: 0.1,
          )
        ],
      ).paddingSymmetric(
        horizontal: 18.w,
        vertical: 10.h,
      ),
    );
  }
}
