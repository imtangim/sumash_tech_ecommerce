import 'package:get/get.dart';
import 'package:sumash_tech_project/Data/models/homepage_model/Models/product_model.dart';
import 'package:sumash_tech_project/Data/models/product_preview/product_preview.dart';
import 'package:sumash_tech_project/Data/network_caller/network_caller.dart';
import 'package:sumash_tech_project/Data/network_caller/network_response.dart';
import 'package:sumash_tech_project/Data/utils/urls.dart';

class ProductPreviewController extends GetxController {
  bool loading = false;
  Future<ProductPreviewModel> fetchProductInfo(
      String slug, int? variantID) async {
    loading = true;
    update();

    ProductPreviewModel? model;
    NetworkResponse response =
        await NetworkCaller().getRequest("${Urls.product}/$slug");
    final data = response.jsonResponse;
    List<dynamic> relatedProduct = data!["related_products"];
    List<ProductModel> relatedProductData =
        relatedProduct.map((json) => ProductModel.fromJson(json)).toList();

    model = ProductPreviewModel(
      variantID: variantID,
      id: data["product"]["id"],
      title: data["product"]["name"],
      shortDesciption: data["product"]["short_description"],
      sku: data["product"]["sku"],
      defaultImage: data["product"]["card_image"],
      isAvailable: data["product"]["is_variant_available"],
      regularPrice: data["product"]["emi_regular"],
      warranty: data["product"]["warranty"],
      mainPrice: data["product"]["price"],
      discountPrice: data["product"]["discount_price"],
      stockinfo: data["product"]["stock"],
      isEMIAvailable: data["product"]["is_emi_available"],
      isOfficial: data["product"]["is_official"],
      isAppleWarranty: data["product"]["is_apple_warranty"],
      earningPoint: data["product"]["earning_point"],
      isOnlineChargeApplicable: data["product"]["is_online_charge_applicable"],
      brand: data["product"]["brand"]["brand_name"],
      brandSlug: data["product"]["brand"]["brand_slug"],
      bookingMoney: data["product"]["booking_money"],
      imageList: data["product"]["images_response"]["image_list"],
      review: data["reviews_count"],
      specification: data["product"]["specification"],
      relatedProduct: relatedProductData,
    );

    loading = false;
    update();
    return model;
  }
}
