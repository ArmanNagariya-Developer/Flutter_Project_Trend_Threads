import 'package:flutter/material.dart';
import 'package:trendthreads/consts/consts.dart';
import 'package:trendthreads/widgets_common/bgWidget.dart';
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                  Image.asset(imgProfile2,width: 50,fit: BoxFit.cover,).box.border(color: Colors.white).roundedFull.clip(Clip.antiAlias).make(),
                  Expanded(child: Column(
                    children:[
                      "Arman".text.make(),
                      5.heightBox,
                      "armannagariya@gmail.com".text.make(),
                    ]
                  ))
                  ],

                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
