import 'package:flutter/cupertino.dart';
import 'package:trendthreads/consts/consts.dart';

Widget featurebutton({String? titel,icon})
{
  return Row(
    children: [
    Image.asset(icon,width: 60,height:50,fit: BoxFit.fill,),
    10.heightBox,
      titel!.text.fontFamily(semibold).color(bgColor).make(),
    ],
  ).box.width(200).margin(const EdgeInsets.symmetric(horizontal: 4)).white.padding(EdgeInsets.all(4)).roundedSM.outerShadowSm.make();
}