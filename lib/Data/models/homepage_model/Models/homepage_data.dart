import 'package:sumash_tech_project/Data/models/homepage_model/Models/product_model.dart';

class HomepageDataModel {
  int? id;
  String? model;
  DataModel? data;

  HomepageDataModel({this.id, this.model, this.data});

  HomepageDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    model = json['model'];
    data = json['data'] != null ? DataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['model'] = model;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataModel {
  String? name;
  String? slug;
  List<ProductModel>? products;
  String? photo1;
  String? photo2;
  String? photo;
  String? link1;
  String? link2;
  String? link;

  DataModel(
      {this.name,
      this.slug,
      this.products,
      this.link1,
      this.link2,
      this.photo1,
      this.photo2,
      this.photo,
      this.link});

  DataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    photo1 = json['photo1'];
    photo2 = json['photo2'];
    photo = json['photo'];
    link1 = json['link1'];
    link2 = json['link2'];
    link = json['link'];
    if (json['products'] != null) {
      products = <ProductModel>[];
      json['products'].forEach((v) {
        products!.add(ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['slug'] = slug;
    data['photo1'] = photo1;
    data['photo2'] = photo2;

    data['link1'] = link1;
    data['link2'] = link2;
    data['photo'] = photo;
    data['link'] = link;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
