import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/utils/layout.dart';

class ColorRegionStorage extends StatelessWidget {
  const ColorRegionStorage({
    super.key,
    required this.layout,
  });

  final AppLayout layout;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(layout.getHeight(25)),
      width: context.width,
      decoration: BoxDecoration(
        color: const Color.fromARGB(77, 129, 163, 189),
        borderRadius: BorderRadius.circular(layout.getHeight(5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Storage:",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: "popins",
                    ),
              ),
              SizedBox(
                height: layout.getHeight(9),
              ),
              Wrap(
                runSpacing: layout.getHeight(5),
                spacing: layout.getwidth(10),
                children: [
                  ...List.generate(3, (index) {
                    List<String> ram = ["6/128", "8/128", "8/256"];
                    return Container(
                      height: layout.getHeight(34),
                      padding: EdgeInsets.symmetric(
                        horizontal: layout.getwidth(5),
                        vertical: layout.getHeight(5),
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(232, 241, 240, 240),
                        borderRadius:
                            BorderRadius.circular(layout.getHeight(5)),
                        border: Border.all(
                          color: Colors.red.shade400,
                          width: layout.getwidth(1.2),
                        ),
                      ),
                      child: Text(
                        "${ram[index]}GB",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: layout.getHeight(14),
                              color: Colors.red,
                              fontFamily: "popins",
                            ),
                      ),
                    );
                  })
                ],
              )
            ],
          ),
           SizedBox(
            height: layout.getHeight(15),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Color:",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: "popins",
                    ),
              ),
               SizedBox(
                height: layout.getHeight(9),
              ),
              Wrap(
                runSpacing: layout.getHeight(5),
                direction: Axis.horizontal,
                spacing: layout.getwidth(10),
                children: [
                  ...List.generate(3, (index) {
                    List<Color> color = [
                      Colors.black,
                      Colors.green.shade100,
                      Colors.amberAccent.shade100
                    ];
                    return IntrinsicHeight(
                      child: Container(
                        height: context.height * 0.045,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: color[index] == Colors.black
                                ? Colors.black
                                : Colors.grey,
                            width: layout.getwidth(2.5),
                          ),
                        ),
                        child: Container(
                          width: layout.getwidth(30),
                          height: context.height * 0.03,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: color[index],
                          ),
                        ),
                      ),
                    );
                  })
                ],
              )
            ],
          ),
           SizedBox(
            height: layout.getHeight(15),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Region:",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: "popins",
                    ),
              ),
               SizedBox(
                height: layout.getHeight(9),
              ),
              Wrap(
                runSpacing: layout.getHeight(5),
                direction: Axis.horizontal,
                spacing: layout.getwidth(10),
                children: [
                  ...List.generate(3, (index) {
                    List<String> region = [
                      "China Global",
                      "International",
                      "Indian"
                    ];
                    return Container(
                      height: layout.getHeight(34),
                      padding:  EdgeInsets.symmetric(
                          horizontal: layout.getwidth(6), vertical: layout.getHeight(5)),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(232, 241, 240, 240),
                        borderRadius: BorderRadius.circular(layout.getHeight(5)),
                        border: Border.all(
                          color: Colors.red.shade400,
                          width: layout.getwidth(1.2),
                        ),
                      ),
                      child: Text(
                        region[index].toUpperCase(),
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: layout.getHeight(14),
                              color: Colors.red,
                              fontFamily: "popins",
                            ),
                      ),
                    );
                  })
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
