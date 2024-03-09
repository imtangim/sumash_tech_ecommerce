class ProductModel {
  int? id;
  String? slug;
  String? name;
  bool? isVariantAvailable;
  String? cardImage;
  int? bookingMoney;
  bool? preOrder;
  bool? isOfficial;
  bool? isAppleWarranty;
  bool? isOnlineChargeApplicable;
  int? price;
  int? stock;
  int? variant;
  int? discountPrice;
 

  ProductModel({
    this.id,
    this.slug,
    this.name,
    this.isVariantAvailable,
    this.cardImage,
    this.bookingMoney,
    this.preOrder,
    this.isOfficial,
    this.isAppleWarranty,
    this.isOnlineChargeApplicable,
    this.price,
    this.stock,
    this.variant,
    this.discountPrice,
   
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    isVariantAvailable = json['is_variant_available'];
    cardImage = json['card_image'];
    bookingMoney = json['booking_money'];
    preOrder = json['pre_order'];
    isOfficial = json['is_official'];
    isAppleWarranty = json['is_apple_warranty'];
    isOnlineChargeApplicable = json['is_online_charge_applicable'];
    price = json['price'];
    stock = json['stock'];
    variant = json['variant'];
    discountPrice = json['discount_price'];
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['name'] = name;
    data['is_variant_available'] = isVariantAvailable;
    data['card_image'] = cardImage;
    data['booking_money'] = bookingMoney;
    data['pre_order'] = preOrder;
    data['is_official'] = isOfficial;
    data['is_apple_warranty'] = isAppleWarranty;
    data['is_online_charge_applicable'] = isOnlineChargeApplicable;
    data['price'] = price;
    data['stock'] = stock;
    data['variant'] = variant;
    data['discount_price'] = discountPrice;
    return data;
  }
}
