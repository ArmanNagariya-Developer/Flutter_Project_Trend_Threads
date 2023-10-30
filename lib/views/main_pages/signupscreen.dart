import 'package:flutter/material.dart';
import 'package:trendthreads/consts/consts.dart';
import 'package:trendthreads/consts/firebase_consts_variable.dart';
import 'package:trendthreads/views/main_pages/mainhomescreen.dart';

import '../../controllers/auth_controllers.dart';
import '../../widgets_common/backgroundfile.dart';
import '../../widgets_common/edit_buttonwidget.dart';
import '../../widgets_common/edit_textfield.dart';
import 'package:get/get.dart';

import 'homescreen.dart';
import 'loginscreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var controller = Get.put(AuthController());

  // text Controller
  var nameControllter = TextEditingController();
  var emailControllter = TextEditingController();
  var passwordControllter = TextEditingController();
  var confirmpasswordControllter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        child: Scaffold(
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            120.heightBox,
            "Sign Up to $appname".text.fontFamily(bold).white.size(15).make(),
            20.heightBox,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Edittextfield(
                        hint: Name,
                        title: Name,
                        controller: nameControllter,
                        IsPass: false),
                    20.heightBox,
                    Edittextfield(
                        hint: Emailhint,
                        title: Email,
                        controller: emailControllter,
                        IsPass: false),
                    20.heightBox,
                    Edittextfield(
                        hint: Passwordhint,
                        title: Password,
                        controller: passwordControllter,
                        IsPass: true),
                    20.heightBox,
                    Edittextfield(
                        hint: Confirmpasswordhint,
                        title: Confirmpassword,
                        controller: confirmpasswordControllter,
                        IsPass: true),
                    15.heightBox,

                    //editbutton()
                    editbutton(
                            onPress: () async {
                              try {
                                await controller.SignUp(
                                        context: context,
                                        email: emailControllter.text,
                                        password: passwordControllter.text)
                                    .then((value) {
                                  return controller.storeUserData(
                                    email: emailControllter.text,
                                    password: passwordControllter.text,
                                    name: nameControllter.text,
                                  );
                                }).then((value) {
                                  VxToast.show(context,
                                      msg: "Login Successfully");
                                  Get.offAll(() => const HomeScreen());
                                });
                              } catch (e) {
                                auth.signOut();
                                VxToast.show(context, msg: e.toString());
                              }
                            },
                            color: bgColor,
                            textColor: whiteColor,
                            title: signup)
                        .box
                        .width(120)
                        .make(),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => const LoginScreen());
                        },
                        child: alreadyaccount.text.color(bgColor).bold.make(),
                      ),
                    ),

                    15.heightBox,
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
