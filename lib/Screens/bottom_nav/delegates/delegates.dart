import 'dart:async';
import 'dart:convert'; // Add this import
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sumash_tech_project/Data/models/product_preview/product_preview.dart';
import 'package:sumash_tech_project/Screens/product_view/product_view.dart';
import 'package:sumash_tech_project/controller/product_preview_controller.dart';

class SearchProductDelegates extends SearchDelegate {
  SearchProductDelegates();

  final String apiUrl = 'https://api.sumashtech.com/api/suggestion?keyword=';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _fetchSuggestions(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No Suggestions'));
        } else {
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              indent: 10.w,
              endIndent: 10.w,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final suggestion = snapshot.data![index];
              return GetBuilder<ProductPreviewController>(
                  builder: (controlleer) {
                return InkWell(
                  onTap: () async {
                    final ProductPreviewModel data =
                        await controlleer.fetchProductInfo(
                      suggestion["slug"].toString(),
                      suggestion["variant"],
                    );

                    Get.to(() => ProductView(model: data), arguments: data);
                  },
                  child: SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100.w,
                          height: 70.h,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(238, 218, 228, 236),
                            borderRadius: BorderRadius.circular(10.r),
                            image: DecorationImage(
                              image: NetworkImage(suggestion["card_image"]),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                              width: 200.w,
                              child: Text(
                                suggestion["name"],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              children: [
                                Text("৳${suggestion["price"].toString()}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          fontSize: 15.sp,
                                          color: Colors.deepOrange,
                                          fontWeight: FontWeight.w500,
                                        )),
                                SizedBox(
                                  width: 20.w,
                                ),
                                if (suggestion["discount_price"] != 0)
                                  Text(
                                    "৳${suggestion["discount_price"].toString()}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: 13.sp,
                                          color: Colors.deepOrange,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ).paddingSymmetric(horizontal: 10.w, vertical: 5.h),
                );
              });
            },
          );
        }
      },
    );
  }

  Future<List<Map<String, dynamic>>> _fetchSuggestions(String keyword) async {
    if (keyword == "") {
      return [];
    }
    final response = await http.get(Uri.parse('$apiUrl$keyword'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load suggestions');
    }
  }

  @override
  String get searchFieldLabel => 'Search for product';

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      primaryColor: Theme.of(context).colorScheme.primary,
      hintColor: Colors.white,
      brightness: Brightness.light,
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Theme.of(context).primaryTextTheme.titleLarge!.color,
        ),
      ),
      indicatorColor: Colors.white,
      textSelectionTheme: const TextSelectionThemeData(
        selectionHandleColor: Colors.black,
        cursorColor: Colors.white,
      ),
      textTheme: Theme.of(context).textTheme.copyWith(
            titleLarge: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
          ),
    );
  }
}
