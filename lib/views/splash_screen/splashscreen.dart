import 'package:firebase_auth/firebase_auth.dart';
import 'package:trendthreads/consts/consts.dart';
import 'package:trendthreads/views/main_pages/homescreen.dart';
import 'package:trendthreads/views/main_pages/loginscreen.dart';
import 'package:trendthreads/widgets_common/applogofile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/firebase_consts_variable.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen() {
    Future.delayed(Duration(seconds: 3), () {
      //Get.off(() => const LoginScreen());

      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.off(() => const LoginScreen());
        } else {
          Get.off(() => const HomeScreen());
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(119, 66, 45, 1.0),
      body: Center(
        child: Column(
          children: [
            Image.asset(icSplashBg, width: 300),
            applogofile(),
            //"$credits".text.fontFamily(bold).white.size(15).make(),

            SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                value: 0.8,
                color: barcolor, //<-- SEE HERE
                backgroundColor: Colors.grey, //<-- SEE HERE
              ),
            ),
          ],
        ),
      ),
    );
  }
}
