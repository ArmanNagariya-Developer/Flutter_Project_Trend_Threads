import 'package:trendthreads/consts/consts.dart';
import 'package:flutter/material.dart';

Widget BackgroundWidget({Widget? child}) {
  return Container(
    decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(imgBackground),fit:BoxFit.fill)),
      child: child
  );
}