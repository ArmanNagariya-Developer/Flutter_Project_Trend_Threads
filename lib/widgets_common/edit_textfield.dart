import 'package:trendthreads/consts/consts.dart';
import 'package:flutter/material.dart';

Widget Edittextfield({String? title, String? hint, controller, IsPass}) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    title!.text.color(Colors.brown).fontFamily(semibold).size(16).make(),
    5.heightBox,
    TextFormField(
      obscureText: IsPass,
      controller: controller,
      decoration: InputDecoration(
          hintStyle: TextStyle(
            fontFamily: semibold,
            color: textfieldGrey,
          ),
          hintText: hint,
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.brown))),
    )
  ]);
}
