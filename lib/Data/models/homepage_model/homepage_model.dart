// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sumash_tech_project/Data/models/homepage_model/Models/feature_catagory.dart';
import 'package:sumash_tech_project/Data/models/homepage_model/Models/homepage_data.dart';
import 'package:sumash_tech_project/Data/models/homepage_model/Models/popup_model.dart';
import 'package:sumash_tech_project/Data/models/homepage_model/Models/product_model.dart';
import 'package:sumash_tech_project/Data/models/homepage_model/Models/singledata.dart';
import 'package:sumash_tech_project/Data/models/homepage_model/Models/slider.dart';

class HomepageModel {
  List<SliderData>? sliders;
  SingleDataModel? singleData;
  List<FeatureCatagoryModel>? featureCatagory;
  PopUpModel? popUp;
  List<HomepageDataModel>? homepage;
  List<ProductModel>? hotDeal;
  HomepageModel({
    this.sliders,
    this.singleData,
    this.featureCatagory,
    this.popUp,
    this.homepage,
    this.hotDeal,
  });
}
