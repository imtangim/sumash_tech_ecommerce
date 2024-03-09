import 'package:get/get.dart';
import 'package:sumash_tech_project/Data/models/homepage_model/Models/feature_catagory.dart';
import 'package:sumash_tech_project/Data/models/homepage_model/Models/homepage_data.dart';
import 'package:sumash_tech_project/Data/models/homepage_model/Models/popup_model.dart';
import 'package:sumash_tech_project/Data/models/homepage_model/Models/product_model.dart';
import 'package:sumash_tech_project/Data/models/homepage_model/Models/singledata.dart';
import 'package:sumash_tech_project/Data/models/homepage_model/Models/slider.dart';
import 'package:sumash_tech_project/Data/models/homepage_model/homepage_model.dart';
import 'package:sumash_tech_project/Data/network_caller/network_caller.dart';
import 'package:sumash_tech_project/Data/network_caller/network_response.dart';
import 'package:sumash_tech_project/Data/utils/urls.dart';

class HomepageController extends GetxController {
  bool isLoading = false;
  HomepageModel? homepageData;

  Future<void> fetchHomePageData() async {
    isLoading = true;
    update();
    try {
      final NetworkResponse networkResponse =
          await NetworkCaller().getRequest(Urls.homepage);
      Map<String, dynamic> data = networkResponse.jsonResponse!;

      List<dynamic> sliderData = data["sliders"] ?? [];
      List<SliderData> sliders =
          sliderData.map((json) => SliderData.fromJson(json)).toList();

      //extracting featureCatagory
      List<dynamic> featureCatagorydata = data["feature_category"] ?? [];
      List<FeatureCatagoryModel> featuresCatagories = featureCatagorydata
          .map((json) => FeatureCatagoryModel.fromJson(json))
          .toList();
      //extracting homepage data
      List<dynamic> homepageModelHolder = data["homepage"] ?? [];
      List<HomepageDataModel> homepage = homepageModelHolder
          .map((json) => HomepageDataModel.fromJson(json))
          .toList();

      //extracting hot deals
      List<dynamic> hotdealsData = data["hot_deal"] ?? [];
      List<ProductModel> hotDeal =
          hotdealsData.map((json) => ProductModel.fromJson(json)).toList();

      //extracting popup data
      Map<String, dynamic> popup = data["popup"] ?? [];
      PopUpModel popupData = PopUpModel.fromJson(popup);

      //extracting single data
      Map<String, dynamic> singleDataValue = data["single_data"] ?? [];
      SingleDataModel singleData = SingleDataModel.fromJson(singleDataValue);

      homepageData = HomepageModel(
        hotDeal: hotDeal,
        sliders: sliders,
        featureCatagory: featuresCatagories,
        homepage: homepage,
        popUp: popupData,
        singleData: singleData,
      );
      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
    }
  }

  Future<List<ProductModel>> fetchSliderViewMore(String sectionSlug) async {
    isLoading = true;
    update();
    try {
      final NetworkResponse networkResponse = await NetworkCaller().getRequest(
          "${Urls.filterSection}section=$sectionSlug&page=1&dynamic_filter=&root=true");
      Map<String, dynamic> data = networkResponse.jsonResponse!;

      List<dynamic> productData = data["results"]["products"] ?? [];
      List<ProductModel> mainData =
          productData.map((json) => ProductModel.fromJson(json)).toList();

      isLoading = false;
      update();
      return mainData;
    } catch (e) {
      isLoading = false;
      update();
      rethrow;
    }
  }

  Future<List<ProductModel>> fetchCateViewMore(String cateslug) async {
    isLoading = true;
    update();
    try {
      final NetworkResponse networkResponse = await NetworkCaller().getRequest(
          "${Urls.filterCate}category=$cateslug&page=1&dynamic_filter=&root=true");
      Map<String, dynamic> data = networkResponse.jsonResponse!;

      List<dynamic> productData = data["results"]["products"] ?? [];
      List<ProductModel> mainData =
          productData.map((json) => ProductModel.fromJson(json)).toList();

      isLoading = false;
      update();
      return mainData;
    } catch (e) {
      isLoading = false;
      update();
      rethrow;
    }
  }

}
