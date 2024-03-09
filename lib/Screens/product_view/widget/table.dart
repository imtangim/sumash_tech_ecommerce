import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'custom_table_row.dart';

class CustomTable extends StatelessWidget {
  final String tableTitle;
  final Map<String, dynamic> tableData;
  const CustomTable({
    super.key,
    required this.tableData,
    required this.tableTitle,
  });

  @override
  Widget build(BuildContext context) {
    String stripHtmlTags(String htmlString) {
      // Simple implementation to strip HTML tags
      return htmlString.replaceAll(RegExp(r'<[^>]*>'), '');
    }

    return Column(
      children: [
        Container(
          width: context.width,
          decoration: BoxDecoration(
            color: const Color.fromARGB(226, 223, 237, 235),
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
          child: Text(
            tableTitle,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontFamily: "popins",
                ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: tableData.entries.map((entry) {
            return CustomTableRow(
              title: entry.key,
              description: stripHtmlTags(entry.value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
