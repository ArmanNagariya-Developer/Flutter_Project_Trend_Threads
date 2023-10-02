import 'package:flutter/cupertino.dart';
import 'package:trendthreads/consts/consts.dart';
Widget homeButton({width,height,icon, String ? titel,onPress})
{
  return Container(

      child: Expanded(

      child: Column(
        children: [

          15.heightBox,
          Image.asset(icon,width: 26,),
          15.heightBox,
          titel!.text.fontFamily(semibold).color(bgColor).make(),

        ],
      ).box.rounded.white.size(width, height).shadowSm.make(),
    )
  );
}