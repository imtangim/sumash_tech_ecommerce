import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/controller/auth_controller.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: context.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.bottomCenter,
                image: AssetImage("assets/logo/background.webp"),
              ),
            ),
          ),
          ListView(
            padding: EdgeInsets.symmetric(vertical: 30.h),
            children: [
              Material(
                shadowColor: Colors.black,
                surfaceTintColor: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                elevation: 8,
                child: Container(
                  width: context.width,
                  // height: 300.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: GetBuilder<AuthController>(builder: (authcontroller) {
                    return Column(
                      children: [
                        const TopDesign(),
                        SizedBox(
                          height: 15.h,
                        ),
                        if (authcontroller.isError)
                          Column(
                            children: [
                              Text(
                                "Check your password and phone number",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontFamily: "popins",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.deepOrange.shade600,
                                    ),
                              ),
                              SizedBox(
                                height: 15.h,
                              )
                            ],
                          ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomAuthTextField(
                              controller: authcontroller.phone,
                              hint: "Type phone number",
                              isFromPhon: true,
                              title: "Phone number",
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            CustomAuthTextField(
                              controller: authcontroller.password,
                              hint: "Type password...",
                              isFromPhon: false,
                              title: "Phone number",
                            ),
                            TextButton(
                              onPressed: () {
                                log(authcontroller.phone.text);
                              },
                              child: Text(
                                "Forgot password?",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontFamily: "popins",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.deepOrange.shade600,
                                    ),
                              ),
                            ),
                            Stack(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.deepOrange.shade400,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                      minimumSize: Size(context.width, 35.h)),
                                  onPressed: () async {
                                    await authcontroller.login(context);
                                  },
                                  child: Center(
                                    child: Text(
                                      "Sign in",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontFamily: "popins",
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                    ),
                                  ),
                                ),
                                if (authcontroller.isLoading)
                                  Container(
                                    width: context.width,
                                    height: 35.h,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(97, 255, 255, 255)),
                                  )
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontFamily: "popins",
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Text(
                                  "Register now",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontFamily: "popins",
                                        fontWeight: FontWeight.w500,
                                        color: Colors.deepOrange.shade600,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 18.w),
                      ],
                    );
                  }),
                ),
              ).paddingSymmetric(
                horizontal: 20.w,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CustomAuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hint;
  final bool isFromPhon;
  const CustomAuthTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.hint,
    required this.isFromPhon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontFamily: "popins",
                  fontWeight: FontWeight.w500,
                ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              keyboardType:
                  isFromPhon ? TextInputType.phone : TextInputType.text,
              maxLines: 1,
              maxLength: 11,
              obscureText: !isFromPhon,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                counterText: "",
                filled: true,
                hintText: hint,
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontFamily: "popins",
                      fontWeight: FontWeight.w500,
                    ),
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 207, 206, 206),
                    width: 0.5.w,
                  ),
                ),
                enabled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 207, 206, 206),
                    width: 0.5.w,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 207, 206, 206),
                    width: 0.5.w,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopDesign extends StatelessWidget {
  const TopDesign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Text(
          "Welcome back.",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontFamily: "popins",
                fontWeight: FontWeight.w500,
              ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                color: Colors.grey, // Adjust color as needed
                height: 1,
              ),
            ),
            Text(
              "Login with your phone",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: 13.sp,
                    color: Colors.grey,
                    fontFamily: "popins",
                  ),
            ).paddingSymmetric(horizontal: 10.w),
            Expanded(
              child: Container(
                color: Colors.grey, // Adjust color as needed
                height: 1,
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 15.w)
      ],
    );
  }
}
