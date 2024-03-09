class SliderData {
  int? id;
  String? name;
  String? link;
  int? priority;
  String? image;
  bool? isActive;

  SliderData({
    this.id,
    this.name,
    this.link,
    this.priority,
    this.image,
    this.isActive,
  });

  SliderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    link = json['link'];
    priority = json['priority'];
    image = json['image'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['link'] = link;
    data['priority'] = priority;
    data['image'] = image;
    data['is_active'] = isActive;
    return data;
  }
}
