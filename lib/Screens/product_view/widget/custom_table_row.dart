import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/utils/layout.dart';

class CustomTableRow extends StatelessWidget {
  final String title;
  final String description;
  const CustomTableRow({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = AppLayout(context: context);
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: "popins",
                    ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  description,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: layout.getHeight(12),
                        color: Colors.black,
                        fontFamily: "popins",
                      ),
                ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: layout.getwidth(10)),
         Divider(
          color: Colors.black,
          thickness: layout.getHeight(0.09),
        )
      ],
    );
  }
}
