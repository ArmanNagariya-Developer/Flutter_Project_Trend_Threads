import 'package:flutter/cupertino.dart';
import 'package:trendthreads/consts/consts.dart';

Widget details_Button_cart({width, String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.color(bgColor).bold.make(),
      5.heightBox,
      title!.text.color(bgColor).bold.make(),
    ],
  )
      .box
      .white
      .rounded
      .width(width)
      .height(62)
      .padding(const EdgeInsets.all(4))
      .make();
}
