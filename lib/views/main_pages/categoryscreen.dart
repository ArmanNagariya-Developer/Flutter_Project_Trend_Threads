import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trendthreads/consts/consts.dart';
import 'package:trendthreads/consts/list.dart';
import 'package:trendthreads/views/main_pages/sub_categorydetails.dart';

import '../../widgets_common/backgroundfile.dart';
import '../../widgets_common/bgWidget.dart';
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: "Categories".text.white.make(),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: GridView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: 9,
    gridDelegate:
    const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 200),
    itemBuilder: (context,index)
    {
      return Column(
        children: [
          10.heightBox,
          Image.asset(
              categoriesImg[index],
              height: 100,
              width: 200,
              fit: BoxFit.contain,

          ),
          10.heightBox,
          categoriesTitel[index].text.color(bgColor).center.make(),
        ],
      ).box.white.rounded.border(color: bgColor).roundedSM.make().onTap(() {
        Get.to(()=>CategoryDetails(titel: categoriesTitel[index]));

      });
    }
        ),
      ),
      ),
    );
  }
}
