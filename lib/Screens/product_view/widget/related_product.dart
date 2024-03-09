import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/Data/models/product_preview/product_preview.dart';
import 'package:sumash_tech_project/controller/product_preview_controller.dart';
import 'package:sumash_tech_project/widgets/productcard_with_border.dart';

class RelatedProduct extends StatelessWidget {
  final ProductPreviewModel model;
  const RelatedProduct({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Related Products",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontFamily: "popins",
              ),
        ),
        SizedBox(
          height: 15.h,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: model.relatedProduct.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.55.h,
            crossAxisSpacing: 10.h,
            mainAxisSpacing: 10.w,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return GetBuilder<ProductPreviewController>(builder: (cont) {
              return ProductCardWithBorder(
                product: model.relatedProduct[index],
              );
            });
          },
        )
      ],
    );
  }
}
