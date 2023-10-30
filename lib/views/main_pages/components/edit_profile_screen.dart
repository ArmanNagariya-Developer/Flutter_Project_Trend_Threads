import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trendthreads/consts/consts.dart';
import 'package:trendthreads/controllers/profile_controllers.dart';

import '../../../consts/images.dart';
import '../../../widgets_common/bgWidget.dart';
import '../../../widgets_common/edit_buttonwidget.dart';
import '../../../widgets_common/edit_textfield.dart';

class EditProfileScreeen extends StatelessWidget {
  final dynamic data;

  const EditProfileScreeen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(
        child: Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: Center(
        child: Obx(
          () => Column(children: [
            25.heightBox,
            controller.profileImagePath.isEmpty
                ? Image.asset(
                    imgB1,
                    width: 100,
                    fit: BoxFit.cover,
                  )
                    .box
                    .border(color: Colors.white)
                    .roundedFull
                    .clip(Clip.antiAlias)
                    .make()
                : Image.file(
                    File(controller.profileImagePath.value),
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            editbutton(
                color: bgColor,
                onPress: () {
                  controller.ChangeImage(context);
                },
                textColor: whiteColor,
                title: "Change"),
            Divider(),
            20.heightBox,
            Edittextfield(
                controller: controller.nameController,
                hint: Name,
                title: Name,
                IsPass: false),
            Edittextfield(
                controller: controller.passwordController,
                hint: Passwordhint,
                title: Password,
                IsPass: true),
            20.heightBox,
            controller.IsLoading.value
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(bgColor),
                  )
                : editbutton(
                    color: bgColor,
                    onPress: () async {
                      controller.IsLoading(true);
                      await controller.uploadimagedb();
                      await controller.updateProfile(
                        image: controller.profileImageLink,
                        name: controller.nameController.text,
                        password: controller.passwordController.text,
                      );
                      VxToast.show(context, msg: "Updated");
                    },
                    textColor: whiteColor,
                    title: "Save")
          ])
              .box
              .padding(const EdgeInsets.all(16))
              .margin(const EdgeInsets.only(top: 50))
              .make(),
        ),
      ),
    ));
  }
}
