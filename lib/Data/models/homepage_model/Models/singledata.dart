class SingleDataModel {
  int? id;
  String? highlightSmallImage;
  String? highlightSmallImageLink;
  String? highlightLargeImage;
  String? highlightLargeImageLink;
  String? deliveryPersonNumber;
  String? seoTitle;
  String? seoDescription;
  bool? isOnline;
  bool? isCashOnDelivery;
  bool? isPreOrder;
  String? preOrderImage;

  SingleDataModel(
      {this.id,
      this.highlightSmallImage,
      this.highlightSmallImageLink,
      this.highlightLargeImage,
      this.highlightLargeImageLink,
      this.deliveryPersonNumber,
      this.seoTitle,
      this.seoDescription,
      this.isOnline,
      this.isCashOnDelivery,
      this.isPreOrder,
      this.preOrderImage});

  SingleDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    highlightSmallImage = json['highlight_small_image'];
    highlightSmallImageLink = json['highlight_small_image_link'];
    highlightLargeImage = json['highlight_large_image'];
    highlightLargeImageLink = json['highlight_large_image_link'];
    deliveryPersonNumber = json['delivery_person_number'];
    seoTitle = json['seo_title'];
    seoDescription = json['seo_description'];
    isOnline = json['is_online'];
    isCashOnDelivery = json['is_cash_on_delivery'];
    isPreOrder = json['is_pre_order'];
    preOrderImage = json['pre_order_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['highlight_small_image'] = highlightSmallImage;
    data['highlight_small_image_link'] = highlightSmallImageLink;
    data['highlight_large_image'] = highlightLargeImage;
    data['highlight_large_image_link'] = highlightLargeImageLink;
    data['delivery_person_number'] = deliveryPersonNumber;
    data['seo_title'] = seoTitle;
    data['seo_description'] = seoDescription;
    data['is_online'] = isOnline;
    data['is_cash_on_delivery'] = isCashOnDelivery;
    data['is_pre_order'] = isPreOrder;
    data['pre_order_image'] = preOrderImage;
    return data;
  }
}
