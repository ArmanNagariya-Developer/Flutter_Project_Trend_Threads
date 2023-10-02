import 'package:trendthreads/consts/consts.dart';
import 'package:trendthreads/views/main_pages/loginscreen.dart';
import 'package:trendthreads/widgets_common/applogofile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  changeScreen()
  {
    Future.delayed(Duration(seconds: 3),(){
      Get.to(()=>const LoginScreen());
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
            Image.asset(icSplashBg,width: 300),
            applogofile(),
            //"$credits".text.fontFamily(bold).white.size(15).make(),

            SizedBox(
              width: 200,
             child:
            LinearProgressIndicator(
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
