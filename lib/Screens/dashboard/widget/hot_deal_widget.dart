import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/Data/models/homepage_model/Models/product_model.dart';
import 'package:sumash_tech_project/Data/models/product_preview/product_preview.dart';
import 'package:sumash_tech_project/Screens/product_view/product_view.dart';
import 'package:sumash_tech_project/controller/homepage_controller.dart';
import 'package:sumash_tech_project/controller/product_preview_controller.dart';

import '../../../widgets/horizontal_product_card.dart';

class HotDealWidget extends StatelessWidget {
  const HotDealWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: Container(
        width: context.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/logo/bg1.png"),
          ),
        ),
        child: GetBuilder<HomepageController>(builder: (homepageController) {
          final List<ProductModel> hotdeals =
              homepageController.homepageData!.hotDeal!;
          return Column(
            children: [
              Text(
                "🔥${("hot deal of the day").toUpperCase()} 🔥",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ).paddingAll(10.r),
              ...List.generate(
                hotdeals.length,
                (index) => Column(
                  children: [
                    GetBuilder<ProductPreviewController>(
                        builder: (previewController) {
                      return HorizontalProductCard(
                        onTap: () async {
                          final ProductPreviewModel data1 =
                              await previewController
                                  .fetchProductInfo(hotdeals[index].slug!,hotdeals[index].variant);
                          Get.to(() => ProductView(model: data1),
                              arguments: data1);
                        },
                        photourl: hotdeals[index].cardImage!,
                        title: hotdeals[index].name!,
                        price: hotdeals[index].price.toString(),
                        offerPrice: hotdeals[index].discountPrice.toString(),
                      );
                    }),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
