class FeatureCatagoryModel {
  String? name;
  String? slug;
  String? icon;

  FeatureCatagoryModel({this.name, this.slug, this.icon});

  FeatureCatagoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['slug'] = slug;
    data['icon'] = icon;
    return data;
  }
}