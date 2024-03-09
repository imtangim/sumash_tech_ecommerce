import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/Data/models/homepage_model/Models/product_model.dart';
import 'package:sumash_tech_project/Data/models/product_preview/product_preview.dart';
import 'package:sumash_tech_project/Screens/product_view/product_view.dart';
import 'package:sumash_tech_project/controller/product_preview_controller.dart';
import 'package:sumash_tech_project/utils/color_scheme.dart';

class ProductCardWithBorder extends StatelessWidget {
  final ProductModel product;
  const ProductCardWithBorder({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductPreviewController>(builder: (cont) {
      return InkWell(
        onTap: () async {
          final ProductPreviewModel data =
              await ProductPreviewController().fetchProductInfo(
            product.slug!,product.variant
          );
          Get.back();
          Get.to(() => ProductView(model: data), arguments: data);
        },
        child: Material(
          elevation: 0.5,
          borderRadius: BorderRadius.circular(10.r),
          borderOnForeground: true,
          child: Container(
            width: context.width * 0.42,
            height: context.height * 0.27,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 0.1, color: Colors.red),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: context.width * 0.3,
                        height: context.height * 0.15,
                        decoration: BoxDecoration(
                          color: lightColorScheme.primaryContainer
                              .withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10.r),
                          image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            image: NetworkImage(product.cardImage!),
                          ),
                        ),
                      ),
                      if (product.discountPrice != 0)
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 8.h),
                          child: Container(
                            width: 65.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 225, 1, 62),
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Center(
                              child: Text(
                                "SAVE ${(((int.parse(product.price.toString()) - int.parse(product.discountPrice.toString())) / int.parse(product.price.toString())) * 100).toInt()}%",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                                overflow: TextOverflow
                                    .ellipsis, // Set overflow property
                                maxLines: 1,
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          product.name!,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                          overflow:
                              TextOverflow.ellipsis, // Set overflow property
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "৳${product.price}",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    fontSize: 14.sp,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            if (product.discountPrice != 0)
                              Text(
                                "৳${product.discountPrice}",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                      ],
                    ),
                  )
                ],
              ).paddingOnly(top: 10.h),
            ),
          ),
        ),
      );
    });
  }
}
