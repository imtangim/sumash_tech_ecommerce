import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sumash_tech_project/controller/auth_controller.dart';
import 'package:sumash_tech_project/controller/shared_preference_controller.dart';

import 'package:sumash_tech_project/utils/layout.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  
  @override
  Widget build(BuildContext context) {
    final AppLayout layout = AppLayout(context: context);
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<AuthController>(builder: (authcontroller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: layout.getHeight(38),
                    backgroundImage: const NetworkImage(
                      "https://sumashtech.com/_ipx/q_100/images/profile-image.webp",
                      scale: 1.5,
                    ),
                  ),
                  SizedBox(
                    width: layout.getwidth(20),
                  ),
                  GetBuilder<SharedPreferenceController>(builder: (controller) {
                    return RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Hello,",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.grey.shade700,
                                    ),
                          ),
                          TextSpan(
                            text: "\n${controller.user!.name}",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontFamily: "Popins",
                                  fontWeight: FontWeight.w400,
                                  fontSize: layout.getHeight(19),
                                ),
                          )
                        ],
                      ),
                    );
                  })
                ],
              ),
              SizedBox(
                height: layout.getHeight(40),
              ),
              ProfileOptionCard(
                layout: layout,
                icon: CupertinoIcons.person,
                title: "Profile",
                isFromProfile: true,
              ),
              SizedBox(
                height: layout.getHeight(10),
              ),
              SizedBox(
                height: layout.getHeight(400),
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: layout.getwidth(10),
                    mainAxisSpacing: layout.getHeight(10),
                    childAspectRatio: 2.1, // Adjust the aspect ratio as needed
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    List<IconData> icon = [
                      Icons.add_shopping_cart,
                      Icons.map_outlined,
                      Icons.lock_outline,
                      Icons.favorite_rounded,
                      Icons.star_rounded,
                      Icons.wallet_giftcard,
                      CupertinoIcons.square_list,
                      CupertinoIcons.person_3
                    ];
                    List<String> title = [
                      "Orders",
                      "Address",
                      "Password",
                      "Wish List",
                      "Points",
                      "Cupons",
                      "Reviews",
                      "Referral",
                    ];
                    return ProfileOptionCard(
                      layout: layout,
                      icon: icon[index],
                      title: title[index],
                    );
                  },
                ),
              ),
              // SizedBox(
              //   height: layout.getHeight(10),
              // ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  authcontroller.sharedPreferenceController.logout();
                },
                child: const Text("Logout"),
              )
            ],
          ).paddingOnly(
            left: layout.getwidth(20),
            right: layout.getwidth(20),
            top: layout.getHeight(50),
          );
        }),
      ),
    );
  }
}

class ProfileOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool? isFromProfile;
  const ProfileOptionCard({
    super.key,
    required this.layout,
    required this.icon,
    required this.title,
    this.isFromProfile,
  });

  final AppLayout layout;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isFromProfile == true ? context.width : 0,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.4,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(layout.getHeight(8)),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: layout.getwidth(25), vertical: layout.getHeight(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: layout.getHeight(25),
          ),
          SizedBox(
            height: layout.getHeight(2),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontFamily: "Popins",
                  fontWeight: FontWeight.w400,
                  fontSize: layout.getHeight(15),
                ),
          ),
        ],
      ),
    );
  }
}
