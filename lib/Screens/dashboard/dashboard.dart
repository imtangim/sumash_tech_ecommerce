import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/Data/models/homepage_model/Models/homepage_data.dart';
import 'package:sumash_tech_project/Data/models/homepage_model/Models/product_model.dart';
import 'package:sumash_tech_project/Data/models/product_preview/product_preview.dart';
import 'package:sumash_tech_project/Screens/offer_screen/result_screen.dart';
import 'package:sumash_tech_project/Screens/product_view/product_view.dart';
import 'package:sumash_tech_project/controller/homepage_controller.dart';
import 'package:sumash_tech_project/controller/product_preview_controller.dart';
import 'widget/catagory.dart';
import 'widget/custom_carosol.dart';
import 'widget/extra_mini_banner.dart';
import 'widget/hot_deal_widget.dart';
import 'widget/mini_banner.dart';
import 'widget/offer_poster.dart';
import 'widget/offer_slider.dart';

class DashBoard extends StatelessWidget {
  final ProductPreviewController cont = Get.put(ProductPreviewController());
  DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const CustomCarosol(),
                SizedBox(
                  height: 15.h,
                ),
                const HotDealWidget(),
                SizedBox(
                  height: 10.h,
                ),
                const OfferPoster(),
                SizedBox(
                  height: 15.h,
                ),
                const Catagory(),
                GetBuilder<HomepageController>(builder: (homepageController) {
                  final List<HomepageDataModel> data =
                      homepageController.homepageData!.homepage!;
                  return Column(
                    children: [
                      ...List.generate(data.length, (index) {
                        if (data[index].model == "section") {
                          return OfferSlider(
                            productList: data[index].data!.products!,
                            onTap: () async {
                              final List<ProductModel> model =
                                  await homepageController.fetchSliderViewMore(
                                      data[index].data!.slug!);
                              Get.to(() => ResultScreen(
                                    modelList: model,
                                    title: data[index].data!.name!,
                                  ));
                            },
                            offername: data[index].data!.name!,
                          ).paddingAll(12.r);
                        } else {
                          if (data[index].data?.photo == null) {
                            return GetBuilder<ProductPreviewController>(
                                builder: (productPreviewController) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      final String link = data[index]
                                          .data!
                                          .link1!
                                          .replaceFirst("/product/", "");

                                      final ProductPreviewModel data1 =
                                          await productPreviewController
                                              .fetchProductInfo(link, null);
                                      Get.to(() => ProductView(model: data1),
                                          arguments: data1);
                                    },
                                    child: MiniBanner(
                                            poster: data[index]
                                                .data!
                                                .photo1
                                                .toString())
                                        .paddingAll(15.r),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      final String link = data[index]
                                          .data!
                                          .link2!
                                          .replaceFirst("/product/", "");

                                      final ProductPreviewModel data1 =
                                          await productPreviewController
                                              .fetchProductInfo(link, null);
                                      Get.to(() => ProductView(model: data1),
                                          arguments: data1);
                                    },
                                    child: MiniBanner(
                                      poster:
                                          data[index].data!.photo2.toString(),
                                    ).paddingAll(15.r),
                                  )
                                ],
                              );
                            });
                          } else {
                            return ExtraMiniBanner(
                              poster: data[index].data!.photo!,
                            ).paddingAll(15.r);
                          }
                        }
                      })
                    ],
                  );
                }),
              ],
            ),
          ),
          GetBuilder<ProductPreviewController>(builder: (cont) {
            return cont.loading
                ? Container(
                    width: context.width,
                    height: context.height,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(131, 255, 255, 255)),
                    child: Center(
                      child: LoadingAnimationWidget.prograssiveDots(
                        color: Theme.of(context).colorScheme.primary,
                        // leftDotColor: const Color(0xFF1A1A3F),
                        // rightDotColor: const Color(0xFFEA3799),
                        size: 80.w,
                      ),
                    ),
                  )
                : Container();
          })
        ],
      ),
    );
  }
}
