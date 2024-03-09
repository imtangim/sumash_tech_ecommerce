class CartDataModel {
  int? quantity;
  int? productID;
  int? variantID;

  CartDataModel(
      {required this.quantity,
      required this.productID,
      required this.variantID});

  CartDataModel.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    productID = json['product'];
    variantID = json['variant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quantity'] = quantity;
    data['product'] = productID;
    data['variant'] = variantID;
    return data;
  }
}
