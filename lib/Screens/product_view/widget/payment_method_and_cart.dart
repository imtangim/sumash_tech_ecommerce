import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/Data/models/product_preview/product_preview.dart';
import 'package:sumash_tech_project/Screens/product_view/widget/guidance.dart';
import 'package:sumash_tech_project/controller/cart_controller.dart';
import 'package:sumash_tech_project/controller/shared_preference_controller.dart';
import 'package:sumash_tech_project/widgets/snackabr.dart';

class PaymentMethodAndCart extends StatefulWidget {
  final ProductPreviewModel model;
  const PaymentMethodAndCart({
    super.key,
    required this.model,
  });

  @override
  State<PaymentMethodAndCart> createState() => _PaymentMethodAndCartState();
}

class _PaymentMethodAndCartState extends State<PaymentMethodAndCart> {
  SharedPreferenceController sharedPreferenceController =
      Get.put(SharedPreferenceController());
  bool? isCashDiscountSelected = true;

  bool? isRegularPriceSelected = false;
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    // bool alreadyInCart = sharedPreferenceController.user!.cartData!.any((item) {
    //   log(widget.model.id.toString());
    //   return item.productID == widget.model.id;
    // });
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      width: context.width,
      decoration: BoxDecoration(
        color: const Color.fromARGB(77, 129, 163, 189),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: GetBuilder<CartController>(builder: (cartcontroller) {
        return Column(
          children: [
            Guidance(
              reviewState: widget.model.review.toString(),
              bookingMoney: widget.model.bookingMoney.toString(),
              emi: widget.model.isEMIAvailable,
              point: widget.model.earningPoint.toString(),
            ),
            SizedBox(
              height: 10.h,
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isCashDiscountSelected = true;
                      isRegularPriceSelected = false;
                    });
                  },
                  child: Container(
                    width: context.width,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Colors.black, width: 0.8.w),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          value: true,
                          groupValue: isCashDiscountSelected,
                          onChanged: (value) {
                            setState(() {
                              isCashDiscountSelected = value;
                              isRegularPriceSelected = !value!;
                            });
                          },
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Cash/Discounted Price",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontFamily: "popins",
                                  ),
                            ),
                            Text(
                              "Card / MFS Payment",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontFamily: "popins",
                                  ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                if (widget.model.isEMIAvailable)
                  Column(
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isCashDiscountSelected = false;
                            isRegularPriceSelected = true;
                          });
                        },
                        child: Container(
                          width: context.width,
                          height: 60.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            border:
                                Border.all(color: Colors.black, width: 0.8.w),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Radio(
                                value: true,
                                groupValue: isRegularPriceSelected,
                                onChanged: (value) {
                                  setState(() {
                                    isRegularPriceSelected = value;
                                    isCashDiscountSelected = !value!;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Regular Price: 48,719৳",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                          fontFamily: "popins",
                                        ),
                                  ),
                                  Text(
                                    "EMI begin at 3,832 BDT per month",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                          fontFamily: "popins",
                                        ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
                  width: context.width,
                  height: 35.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red.shade400, width: 1.w),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => decreaseCounter(),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 11.w),
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: Colors.red.shade400,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/logo/minus.png",
                              scale: 1.5,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        _counter.toString(),
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.red.shade400,
                              fontFamily: "popins",
                            ),
                      ),
                      GestureDetector(
                        onTap: () => increaseCounter(),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          // height: 30.h,
                          decoration: BoxDecoration(
                            color: Colors.red.shade400,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: 15.h,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                if (isCashDiscountSelected ?? true)
                  sharedPreferenceController.cartItem.any((item) {
                    log("${item.productID}:${widget.model.id}");
                    return item.productID == widget.model.id;
                  })
                      ? GestureDetector(
                          onTap: () {
                            showSnackMessage(context, "Product already in cart",
                                Colors.orange);
                          },
                          child: Container(
                            height: context.height * 0.055,
                            width: context.width,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 27, 136, 138),
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Center(
                              child: Text(
                                "Already in cart",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontFamily: "popins",
                                    ),
                              ),
                            ),
                          ),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 27, 136, 138),
                            minimumSize:
                                Size(context.width, context.height * 0.055),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                          ),
                          onPressed: () async {
                            await cartcontroller.addToCart(
                              widget.model.id.toString(),
                              widget.model.variantID.toString(),
                              _counter.toString(),
                              context,
                            );
                            setState(() {});
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.shopping_basket_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Text(
                                "Add to cart",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontFamily: "popins",
                                    ),
                              )
                            ],
                          ),
                        ),
                SizedBox(
                  height: 10.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade400,
                    minimumSize: Size(context.width, context.height * 0.055),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "Buy Now",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontFamily: "popins",
                            ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        );
      }),
    );
  }

  decreaseCounter() {
    if (_counter == 1) {
      _counter = 1;
    } else {
      _counter--;
    }
    if (mounted) {
      setState(() {});
    }
  }

  increaseCounter() {
    if (_counter == 15) {
      _counter = 15;
    } else {
      _counter++;
    }
    if (mounted) {
      setState(() {});
    }
  }
}
