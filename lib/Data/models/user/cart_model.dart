import 'dart:ffi';

class CartModel {
  int? id;
  int? quantity;
  int? product;
  int? variant;
  String? productName;
  bool? isVariantAvailable;
  String? productImage;
  String? slug;
  int? bookingMoney;
  bool? isOnlineChargeApplicable;
  int? price;
  String? variantText;
  int? stock;
  Int? eventId;

  CartModel(
      {this.id,
      this.quantity,
      this.product,
      this.variant,
      this.productName,
      this.isVariantAvailable,
      this.productImage,
      this.slug,
      this.bookingMoney,
      this.isOnlineChargeApplicable,
      this.price,
      this.variantText,
      this.stock,
      this.eventId});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product = json['product'];
    variant = json['variant'];
    productName = json['product_name'];
    isVariantAvailable = json['is_variant_available'];
    productImage = json['product_image'];
    slug = json['slug'];
    bookingMoney = json['booking_money'];
    isOnlineChargeApplicable = json['is_online_charge_applicable'];
    price = json['price'];
    variantText = json['variant_text'];
    stock = json['stock'];
    eventId = json['event_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['product'] = product;
    data['variant'] = variant;
    data['product_name'] = productName;
    data['is_variant_available'] = isVariantAvailable;
    data['product_image'] = productImage;
    data['slug'] = slug;
    data['booking_money'] = bookingMoney;
    data['is_online_charge_applicable'] = isOnlineChargeApplicable;
    data['price'] = price;
    data['variant_text'] = variantText;
    data['stock'] = stock;
    data['event_id'] = eventId;
    return data;
  }
}
