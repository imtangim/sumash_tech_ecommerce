import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/Data/models/homepage_model/Models/product_model.dart';
import 'package:sumash_tech_project/Data/models/homepage_model/Models/singledata.dart';
import 'package:sumash_tech_project/Data/models/product_preview/product_preview.dart';
import 'package:sumash_tech_project/Screens/offer_screen/result_screen.dart';
import 'package:sumash_tech_project/Screens/product_view/product_view.dart';
import 'package:sumash_tech_project/controller/homepage_controller.dart';
import 'package:sumash_tech_project/controller/product_preview_controller.dart';

import 'mini_banner.dart';

class OfferPoster extends StatelessWidget {
  const OfferPoster({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomepageController>(builder: (homepageController) {
      SingleDataModel data = homepageController.homepageData!.singleData!;
      return Column(
        children: [
          GestureDetector(
            onTap: () async {
              final String link =
                  data.highlightSmallImageLink!.replaceFirst("/category/", "");
              log(link);
              final List<ProductModel> model =
                  await homepageController.fetchCateViewMore(link);
              Get.to(() => ResultScreen(
                    modelList: model,
                    title: "",
                  ));
              log(data.highlightSmallImageLink.toString());
            },
            child: Container(
              height: 190.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(data.highlightSmallImage!),
                ),
              ),
            ).paddingAll(8.r),
          ),
          GetBuilder<ProductPreviewController>(
              builder: (productPreviewController) {
            return GestureDetector(
              onTap: () async {
                final String link =
                    data.highlightLargeImageLink!.replaceFirst("/product/", "");

                final ProductPreviewModel data1 =
                    await productPreviewController.fetchProductInfo(link, null);
                Get.to(() => ProductView(model: data1), arguments: data1);
              },
              child:
                  MiniBanner(poster: data.highlightLargeImage!).paddingAll(8.r),
            );
          }),
        ],
      );
    });
  }
}
