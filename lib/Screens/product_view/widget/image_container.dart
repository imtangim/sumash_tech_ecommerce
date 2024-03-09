import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/Screens/product_view/widget/large_image_container.dart';
import 'package:sumash_tech_project/Screens/product_view/widget/mini_image_container.dart';
import 'package:sumash_tech_project/utils/layout.dart';

class ImageContainer extends StatefulWidget {
  final String imageUrl;
  final List<dynamic> listOfImage;

  const ImageContainer(
      {super.key, required this.imageUrl, required this.listOfImage});

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  late String tempUrl;
  @override
  void initState() {
    tempUrl = widget.imageUrl;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLayout layout = AppLayout(context: context);

    return Column(
      children: [
        SizedBox(
          height: layout.getHeight(15),
        ),
        LargeImageContainer(layout: layout, tempUrl: tempUrl),
        SizedBox(
          height: layout.getHeight(15),
        ),
        Material(
          shadowColor: Colors.black,
          elevation: 1,
          borderRadius: BorderRadius.circular(layout.getHeight(5)),
          child: Container(
            height: 90.h,
            decoration: BoxDecoration(
              color: const Color.fromARGB(77, 240, 238, 238),
              // color: Colors.black,
              borderRadius: BorderRadius.circular(layout.getHeight(5)),
            ),
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              scrollDirection: Axis.horizontal,
              children: [
                ...List.generate(widget.listOfImage.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      tempUrl = widget.listOfImage[index]["image_url"];
                      setState(() {});
                    },
                    child: MiniImageContainer(
                      url: widget.listOfImage[index]["image_url"],
                    ).paddingSymmetric(
                        vertical: layout.getwidth(3),
                        horizontal: layout.getHeight(5)),
                  );
                })
              ],
            ),
          ),
        ),
      ],
    );
  }
}
