import 'package:trendthreads/consts/consts.dart';
import 'package:flutter/material.dart';

Widget editbutton({onPress, color,textColor,title})
{
  return
    ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
        ),
        onPressed:onPress,
         child:title.toString().text.color(textColor).fontFamily(bold).make());
}