import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/Data/models/homepage_model/Models/product_model.dart';
import 'package:sumash_tech_project/Data/models/product_preview/product_preview.dart';
import 'package:sumash_tech_project/Screens/product_view/product_view.dart';
import 'package:sumash_tech_project/controller/product_preview_controller.dart';
import 'package:sumash_tech_project/utils/color_scheme.dart';

import '../../../widgets/vertical_product_card.dart';

class OfferSlider extends StatelessWidget {
  final String offername;
  final Function() onTap;
  final List<ProductModel> productList;
  const OfferSlider({
    super.key,
    required this.offername,
    required this.onTap,
    required this.productList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.sp),
        width: 351.43.w,
        decoration: BoxDecoration(
          color: lightColorScheme.primaryContainer.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  offername,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                GestureDetector(
                  child: Container(
                    height: 33.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5.w, color: Colors.red),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: GestureDetector(
                      onTap: onTap,
                      child: Center(
                        child: Text(
                          "VIEW MORE",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 230, 40, 26),
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            FlutterCarousel(
              options: CarouselOptions(
                showIndicator: false,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 5),
                disableCenter: true,
                viewportFraction: context.width > 800.0 ? 0.8 : 1.0,
                height: 220.h,
                enableInfiniteScroll: false,
              ),
              items: <Widget>[
                ...List.generate(3, (index) {
                  int tempIndex = index * 2;
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GetBuilder<ProductPreviewController>(
                          builder: (controlleer) {
                        return VerticalProductCard(
                          title: productList[tempIndex].name!,
                          price: productList[tempIndex].price!.toString(),
                          url: productList[tempIndex].cardImage!,
                          discountPrice:
                              productList[tempIndex].discountPrice!.toString(),
                          onTap: () async {
                            final ProductPreviewModel data =
                                await controlleer.fetchProductInfo(
                                    productList[tempIndex].slug.toString(),
                                    productList[tempIndex].variant);

                            Get.to(() => ProductView(model: data),
                                arguments: data);
                          },
                        );
                      }),
                      SizedBox(
                        width: 10.w,
                      ),
                      GetBuilder<ProductPreviewController>(
                          builder: (controlleer) {
                        return VerticalProductCard(
                          title: productList[tempIndex + 1].name!,
                          price: productList[tempIndex + 1].price!.toString(),
                          url: productList[tempIndex + 1].cardImage!,
                          discountPrice: productList[tempIndex + 1]
                              .discountPrice!
                              .toString(),
                          onTap: () async {
                            final ProductPreviewModel data =
                                await controlleer.fetchProductInfo(
                                    productList[tempIndex + 1].slug.toString(),
                                    productList[tempIndex + 1].variant);

                            Get.to(() => ProductView(model: data),
                                arguments: data);
                          },
                        );
                      }),
                    ],
                  );
                })
              ],
            ),
          ],
        ));
  }
}
