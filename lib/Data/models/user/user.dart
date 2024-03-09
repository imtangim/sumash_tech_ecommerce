import 'package:sumash_tech_project/Data/models/user/cartdata_model.dart';

class UserModel {
  int? status;
  int? customerId;
  String? name;
  String? referralCode;
  String? phoneNumber;
  String? profilePhoto;
  int? point;
  String? genderText;
  bool? dateOfBirthUpdated;
  String? district;
  String? dateOfBirth;
  List<CartDataModel>? cartData;

  UserModel(
      {this.status,
      this.customerId,
      this.name,
      this.referralCode,
      this.phoneNumber,
      this.profilePhoto,
      this.point,
      this.genderText,
      this.dateOfBirthUpdated,
      this.district,
      this.dateOfBirth,
      this.cartData});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    customerId = json['customer_id'];
    name = json['name'];
    referralCode = json['referral_Code'];
    phoneNumber = json['phone_number'];
    profilePhoto = json['profile_photo'];
    point = json['point'];
    genderText = json['gender_text'];
    dateOfBirthUpdated = json['date_of_birth_updated'];
    district = json['district'];
    dateOfBirth = json['date_of_birth'];
    if (json['cart_data'] != null) {
      cartData = <CartDataModel>[];
      json['cart_data'].forEach((v) {
        cartData!.add(CartDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['customer_id'] = customerId;
    data['name'] = name;
    data['referral_Code'] = referralCode;
    data['phone_number'] = phoneNumber;
    data['profile_photo'] = profilePhoto;
    data['point'] = point;
    data['gender_text'] = genderText;
    data['date_of_birth_updated'] = dateOfBirthUpdated;
    data['district'] = district;
    data['date_of_birth'] = dateOfBirth;
    if (cartData != null) {
      data['cart_data'] = cartData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
