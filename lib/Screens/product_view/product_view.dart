import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sumash_tech_project/Data/models/product_preview/product_preview.dart';
import 'package:sumash_tech_project/controller/cart_controller.dart';
import 'package:sumash_tech_project/controller/product_preview_controller.dart';
import 'package:sumash_tech_project/utils/layout.dart';
import 'widget/description.dart';
import 'widget/image_container.dart';
import 'widget/payment_method_and_cart.dart';
import 'widget/related_product.dart';
import 'widget/specification.dart';

class ProductView extends StatefulWidget {
  final ProductPreviewModel model;
  const ProductView({super.key, required this.model});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    AppLayout layout = AppLayout(context: context);
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          ListView(
            children: [
              ImageContainer(
                listOfImage: widget.model.imageList,
                imageUrl: widget.model.defaultImage,
              ),
              SizedBox(
                height: layout.getHeight(25),
              ),
              Description(
                model: widget.model,
              ),
              // SizedBox(
              //   height: layout.getHeight(25),
              // ),
              // ColorRegionStorage(layout: layout),
              SizedBox(
                height: 25.h,
              ),
              PaymentMethodAndCart(
                model: widget.model,
              ),
              SizedBox(
                height: 25.h,
              ),

              if (widget.model.relatedProduct.isNotEmpty)
                RelatedProduct(
                  model: widget.model,
                ).paddingSymmetric(horizontal: 5.w, vertical: 5.h),
              SizedBox(
                height: 25.h,
              ),
              if (widget.model.specification.isNotEmpty)
                Specification(
                  model: widget.model,
                ),
              if (widget.model.specification.isNotEmpty)
                SizedBox(
                  height: 25.h,
                ),
            ],
          ).paddingSymmetric(horizontal: layout.getwidth(10), vertical: 0),
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
          }),
          GetBuilder<CartController>(builder: (cont) {
            return cont.isloading
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
