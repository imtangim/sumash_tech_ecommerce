import 'package:get/get.dart';
import 'package:sumash_tech_project/Data/models/homepage_model/Models/product_model.dart';

class SearchProductController extends GetxController {
  final searchProductProvider = Rx<List<ProductModel>>([]);

  void setSearchResults(List<ProductModel> results) {
    searchProductProvider.value = results;
  }
}
