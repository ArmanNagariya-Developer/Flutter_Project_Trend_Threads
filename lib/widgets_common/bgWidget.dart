import 'package:trendthreads/consts/consts.dart';
import 'package:flutter/material.dart';

Widget bgWidget({Widget? child}) {
  return Container(
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(Allcate),fit:BoxFit.fill)),
      child: child
  );
}