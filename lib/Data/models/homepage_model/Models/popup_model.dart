class PopUpModel {
  int? id;
  String? name;
  String? link;
  String? image;
  bool? isActive;

  PopUpModel({this.id, this.name, this.link, this.image, this.isActive});

  PopUpModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    link = json['link'];
    image = json['image'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['link'] = link;
    data['image'] = image;
    data['is_active'] = isActive;
    return data;
  }
}
