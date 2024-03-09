import 'package:flutter/material.dart';
import 'package:sumash_tech_project/utils/layout.dart';

class SmallAbout extends StatelessWidget {
  final String title;
  final String description;
  final bool isStatus;
  final bool? isStock;
  const SmallAbout({
    super.key,
    required this.title,
    required this.description,
    required this.isStatus,
    this.isStock,
  });

  @override
  Widget build(BuildContext context) {
    final AppLayout layout =AppLayout(context: context);
    return IntrinsicWidth(
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: layout.getwidth(10), vertical: layout.getHeight(10)),
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(layout.getHeight(5)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$title: ",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: layout.getHeight(14),
                    color: Colors.black,
                    fontFamily: "popins",
                  ),
            ),
            Flexible(
              child: Text(
                description,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: layout.getHeight(15),
                      color: !isStatus
                          ? Colors.black
                          : isStock == true
                              ? const Color.fromARGB(255, 15, 163, 20)
                              : Colors.red,
                      // fontFamily: "popins",
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
