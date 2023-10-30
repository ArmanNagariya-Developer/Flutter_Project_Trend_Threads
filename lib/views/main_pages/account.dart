import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendthreads/consts/consts.dart';
import 'package:trendthreads/consts/list.dart';
import 'package:trendthreads/controllers/auth_controllers.dart';
import 'package:trendthreads/services/firebase_services.dart';
import 'package:trendthreads/views/main_pages/components/details_button.dart';
import 'package:trendthreads/views/main_pages/components/edit_profile_screen.dart';
import 'package:trendthreads/views/main_pages/signupscreen.dart';
import 'package:trendthreads/widgets_common/bgWidget.dart';

import '../../consts/firebase_consts_variable.dart';
import '../../controllers/profile_controllers.dart';
import '../../widgets_common/loading_in.dart';
import 'loginscreen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return bgWidget(
        child: Scaffold(
            body: StreamBuilder(
      stream: FireStoreServices.getUser(currentUser!.uid),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(bgColor)),
          );
        } else {
          // var data = snapshot.data!.docs[0];
          return SafeArea(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: () async {
                          await Get.put(AuthController())
                              .signOutMethod(context);
                          Get.offAll(() => const SignupScreen());
                        },
                        child: "Logout".text.white.bold.make(),
                      ),
                    ],
                  ),
                  35.heightBox,
                  FutureBuilder(
                    future: FireStoreServices.getCount(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: Loagin(),
                        );
                      } else {
                        var countdata = snapshot.data;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            details_Button_cart(
                                count: countdata[0].toString(),
                                title: "Your Cart",
                                width: context.screenWidth / 3.5),
                            details_Button_cart(
                                count: countdata[1].toString(),
                                title: "Your Wishlist",
                                width: context.screenWidth / 3.5),
                            details_Button_cart(
                                count: countdata[2].toString(),
                                title: "Your Orders",
                                width: context.screenWidth / 3.5),
                          ],
                        );
                      }
                    },
                  ),
                  30.heightBox,
                  ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return const Divider(color: bgColor);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: iconslist[index],
                              title: profileButtonlist[index]
                                  .text
                                  .color(bgColor)
                                  .make(),
                            );
                          },
                          itemCount: iconslist.length)
                      .box
                      .white
                      .border(color: bgColor)
                      .padding(EdgeInsets.symmetric(horizontal: 16))
                      .shadowSm
                      .shadowOutline(outlineColor: bgColor)
                      .rounded
                      .make()
                ],
              ),
            ),
          );
        }
      },
    )));
  }
}
