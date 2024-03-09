import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/Data/models/homepage_model/Models/product_model.dart';
import 'package:sumash_tech_project/Screens/offer_screen/widget/filter_bottom_sheet.dart';
import 'package:sumash_tech_project/utils/layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sumash_tech_project/widgets/productcard_with_border.dart';

class ResultScreen extends StatelessWidget {
  final String title;
  final List<ProductModel> modelList;
  const ResultScreen({super.key, required this.title, required this.modelList});

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = AppLayout(context: context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontSize: layout.getHeight(23),
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  showDragHandle: true,
                  builder: (context) {
                    return FilterBottomSheet();
                  },
                );
              },
              child: Container(
                height: 33.h,
                width: 90.w,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: layout.getwidth(1), color: Colors.black),
                  borderRadius: BorderRadius.circular(layout.getHeight(5)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Filter ",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 15.sp,
                          ),
                    ),
                    Icon(
                      Icons.filter_alt_rounded,
                      size: 23.h,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: layout.getHeight(15),
                mainAxisExtent: layout.getwidth(250),
                mainAxisSpacing: layout.getwidth(15),
              ),
              itemCount: modelList.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ProductCardWithBorder(
                  product: modelList[index],
                );
              },
            )
          ],
        ).paddingSymmetric(
          horizontal: 15.w,
          vertical: 15.h,
        ),
      ),
    );
  }
}
