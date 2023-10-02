import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trendthreads/consts/consts.dart';
import 'package:trendthreads/views/main_pages/item_details.dart';
import 'package:trendthreads/widgets_common/bgWidget.dart';
class CategoryDetails extends StatelessWidget {
  final String? titel;

  const CategoryDetails({super.key,required this.titel});

  @override
  Widget build(BuildContext context) {
    return bgWidget(

      child: Scaffold(
        appBar: AppBar(
          title: titel!.text.white.make(),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children:[
              //10.heightBox,
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),

                scrollDirection: Axis.horizontal,

                child:Row(
                  children:List.generate(6, (index) => "Cloths".text.size(12).color(bgColor).makeCentered().box.rounded.white.size(120, 60).margin(const EdgeInsets.symmetric(horizontal: 4)).make()),
                ) ,
              ),
              20.heightBox,
              Expanded(child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 250,mainAxisSpacing: 8,crossAxisSpacing: 8),

                    itemBuilder: (context,index)
                {

                     return Column(

                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Image.asset(imgP7,width: 200,height: 150,fit: BoxFit.fill),
                          10.heightBox,
                          "Men's Pants".text.color(Colors.black).make(),
                          10.heightBox,
                          "₹299".text.color(bgColor).size(16).make(),

                        ],
                      ).box.white.border(color: bgColor).margin(const EdgeInsets.symmetric(horizontal: 6)).rounded.padding(EdgeInsets.all(20)).make().onTap(() {
                        Get.to(()=>ItemDetails(Titel: "Cloths"));
                     });
                })),
            ],
          ),
        ),
      ),
    );
  }
}
