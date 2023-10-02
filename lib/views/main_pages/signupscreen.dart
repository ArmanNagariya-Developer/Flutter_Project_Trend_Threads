import 'package:flutter/material.dart';
import 'package:trendthreads/consts/consts.dart';

import '../../widgets_common/backgroundfile.dart';
import '../../widgets_common/edit_buttonwidget.dart';
import '../../widgets_common/edit_textfield.dart';
import 'package:get/get.dart';

import 'loginscreen.dart';
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BackgroundWidget(child: Scaffold(
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            120.heightBox,
            "Sign Up to $appname".text.fontFamily(bold).white.size(15).make(),
            20.heightBox,
    Expanded(child:
    SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child:
            Column(

              children: [
                Edittextfield(hint: Name, title: Name),
                20.heightBox,
                Edittextfield(hint: Emailhint, title: Email),
                20.heightBox,
                Edittextfield(hint: Passwordhint, title: Password),
                20.heightBox,
                Edittextfield(hint: Confirmpasswordhint, title: Confirmpassword),
                15.heightBox,

                //editbutton()
                editbutton(onPress:(){},color:bgColor, textColor:whiteColor, title:signup).box.width(120).make(),
            Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed:(){ Get.to(()=> const LoginScreen()); },
                     child:alreadyaccount.text.color(bgColor).bold.make(), ),
                  ),

                15.heightBox,
              /*  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(

                      radius: 20,
                      backgroundColor: lightgrown,
                      child: Image.asset(socialIconList[index],width: 30,),
                    ),
                  )),

                ),*/
              ],
            ).box.white.rounded.padding(EdgeInsets.all(16)).border(color:Colors.brown).width(context.screenWidth - 70).shadowSm.make(),
    ),
    ),
          ],
        ),
      ),
    ));
  }
}
