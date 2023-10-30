import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trendthreads/consts/consts.dart';
import 'package:trendthreads/controllers/auth_controllers.dart';
import 'package:trendthreads/views/main_pages/homescreen.dart';
import 'package:trendthreads/views/main_pages/signupscreen.dart';

import 'package:trendthreads/widgets_common/edit_textfield.dart';
import 'package:trendthreads/widgets_common/edit_buttonwidget.dart';
import 'package:trendthreads/widgets_common/backgroundfile.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const socialIconList = [icFacebookLogo, icGoogleLogo, icTwitterLogo];

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return BackgroundWidget(
        child: Scaffold(
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            120.heightBox,
            "Log in  to $appname".text.fontFamily(bold).white.size(15).make(),
            20.heightBox,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Edittextfield(
                        hint: Emailhint,
                        title: Email,
                        IsPass: false,
                        controller: controller.emailcontroller),
                    20.heightBox,
                    Edittextfield(
                        hint: Passwordhint,
                        title: Password,
                        IsPass: true,
                        controller: controller.passwordcontroller),
                    5.heightBox,
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: forgetpassword.text.color(bgColor).make()),
                    ),
                    //editbutton()
                    editbutton(
                            onPress: () async {
                              await controller.Login(context: context)
                                  .then((value) {
                                if (value != null) {
                                  VxToast.show(context,
                                      msg: "Login Successfully");
                                  Get.offAll(() => const HomeScreen());
                                }
                              });
                            },
                            color: bgColor,
                            textColor: whiteColor,
                            title: login)
                        .box
                        .width(120)
                        .make(),
                    5.heightBox,
                    createnewAccount.text.color(Colors.brown).make(),
                    5.heightBox,
                    editbutton(
                            onPress: () {
                              Get.to(() => const SignupScreen());
                            },
                            color: lightgrown,
                            textColor: bgColor,
                            title: signup)
                        .box
                        .width(120)
                        .make(), //sign up button
                    15.heightBox,
                    loginwith.text.color(bgColor).make(),
                    15.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          3,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: lightgrown,
                                  child: Image.asset(
                                    socialIconList[index],
                                    width: 30,
                                  ),
                                ),
                              )),
                    ),
                  ],
                )
                    .box
                    .white
                    .rounded
                    .padding(EdgeInsets.all(16))
                    .border(color: Colors.brown)
                    .width(context.screenWidth - 70)
                    .shadowSm
                    .make(),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
