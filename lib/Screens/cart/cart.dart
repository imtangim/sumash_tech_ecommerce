import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/controller/cart_controller.dart';
import 'widget/product_card_for_cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final Future cartfinder;
  final CartController cartController = Get.find<CartController>();

  @override
  void initState() {
    super.initState();
    cart();
  }

  Future cart() async {
    cartfinder = cartController.fetchProducts();
  }

  int price = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shopping Cart",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: "popins",
                    ),
              ),
              const Icon(
                Icons.shopping_cart_outlined,
                size: 35,
              )
            ],
          ).paddingOnly(top: 20.h, bottom: 20.h),
          Obx(() {
            return cartController.cartFullItem.isEmpty
                ? SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: Center(
                        child: Text("Do shoping for cart ❤️",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontFamily: "popins",
                                )),
                      ),
                    ),
                  )
                : Column(
                    children: [
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cartController.cartFullItem.length,
                          itemBuilder: (context, index) {
                            return ProductCardForCart(
                              model: cartController.cartFullItem[index],
                            );
                          }),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontFamily: "popins",
                                    ),
                              ).paddingOnly(left: 50.w),
                              Text(
                                "${cartController.price.value} ৳",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "popins",
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 18.sp),
                              )
                            ],
                          ),
                          Divider(indent: 50.w),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(70, 50),
                              alignment: Alignment.center,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 238, 102, 78),
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {},
                            child: const Text("Checkout"),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  );
          })
        ],
      ).paddingSymmetric(horizontal: 20.w),
    );
  }
}
