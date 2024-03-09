import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sumash_tech_project/Data/models/product_preview/product_preview.dart';
import 'package:sumash_tech_project/Screens/product_view/widget/table.dart';

class Specification extends StatelessWidget {
  final ProductPreviewModel model;
  const Specification({
    super.key,
    required this.model,
  });
  

  @override
  Widget build(BuildContext context) {
    List<CustomTable> customTables = [];
    
    for (var item in model.specification) {
      customTables.add(CustomTable(
        tableTitle: item['sector'],
        tableData: (item['key_value']),
      ));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Specification",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontFamily: "popins",
              ),
        ),
        SizedBox(
          height: 15.h,
        ),
        ...List.generate(customTables.length, (index) => customTables[index]),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}
