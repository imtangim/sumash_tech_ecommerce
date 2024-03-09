import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/Data/models/user/cart_model.dart';
import 'package:sumash_tech_project/Screens/cart/widget/counter.dart';
import 'package:sumash_tech_project/controller/cart_controller.dart';

class ProductCardForCart extends StatefulWidget {
  final CartModel model;
  const ProductCardForCart({
    super.key,
    required this.model,
  });

  @override
  State<ProductCardForCart> createState() => _ProductCardForCartState();
}

class _ProductCardForCartState extends State<ProductCardForCart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      width: context.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120.h,
                width: 120.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: const Color.fromARGB(255, 223, 237, 235),
                  image: DecorationImage(
                    image: NetworkImage(widget.model.productImage!),
                    fit: BoxFit.cover, // Adjust the fit property
                  ),
                ),
              ),
              SizedBox(width: 10.w), // Add some spacing
              Expanded(
                // Ensure this column takes available space
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.model.productName!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 14.sp,
                          ),
                    ),
                    SizedBox(height: 5.h), // Add some spacing
                    Text(
                      widget.model.variantText!,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontFamily: "popins",
                            color: const Color.fromARGB(255, 184, 182, 182),
                            fontSize: 13.sp,
                          ),
                    ),
                  ],
                ).paddingOnly(top: 10.h),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          GetBuilder<CartController>(builder: (controller) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Counter(
                      model: widget.model,
                    ),
                    SizedBox(width: 30.w),
                    GestureDetector(
                      onTap: () async {
                        // log("CartItem lenght before${controller.sharedPreferenceController.cartItem.length.toString()}");
                        await controller.deleteCartItem(
                            widget.model.id.toString(), context,widget.model.product.toString());
                        controller.sharedPreferenceController
                            .removeItem(widget.model.product.toString());
                        setState(() {});
                        // log("CartItem lenght after${controller.sharedPreferenceController.cartItem.length.toString()}");
                      },
                      child: Container(
                        width: 28.w,
                        height: 28.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(
                            color: Colors.red,
                            width: 0.5.w,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.delete,
                            size: 20.sp,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(width: 10.w), // Add some spacing
                Text(
                  "${widget.model.price}৳",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontFamily: "popins",
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18.sp,
                      ),
                )
              ],
            ).paddingSymmetric(horizontal: 3.w);
          })
        ],
      ),
    );
  }
}
