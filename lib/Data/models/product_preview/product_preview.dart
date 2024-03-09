import 'package:sumash_tech_project/Data/models/homepage_model/Models/product_model.dart';

class ProductPreviewModel {
  final int id;
  final String title;
  final String shortDesciption;
  final String sku;
  final String defaultImage;
  final bool isAvailable;
  final int regularPrice;
  final String warranty;
  final int mainPrice;
  final int discountPrice;
  final int stockinfo;
  final bool isEMIAvailable;
  final bool isOfficial;
  final bool isAppleWarranty;
  final int earningPoint;
  final bool isOnlineChargeApplicable;
  final String brand;
  final String brandSlug;
  final int bookingMoney;
  final List<dynamic> imageList;
  final int review;
  final int? variantID;
  final List<ProductModel> relatedProduct;
  final List<dynamic> specification;

  ProductPreviewModel({
    required this.variantID,
    required this.id,
    required this.title,
    required this.shortDesciption,
    required this.sku,
    required this.defaultImage,
    required this.isAvailable,
    required this.regularPrice,
    required this.warranty,
    required this.mainPrice,
    required this.discountPrice,
    required this.stockinfo,
    required this.isEMIAvailable,
    required this.isOfficial,
    required this.isAppleWarranty,
    required this.earningPoint,
    required this.isOnlineChargeApplicable,
    required this.brand,
    required this.brandSlug,
    required this.bookingMoney,
    required this.imageList,
    required this.review,
    required this.relatedProduct,
    required this.specification,
  });
}
