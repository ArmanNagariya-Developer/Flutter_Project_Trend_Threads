import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendthreads/consts/consts.dart';
import 'package:trendthreads/services/firebase_services.dart';
import 'package:trendthreads/views/main_pages/item_details.dart';
import 'package:trendthreads/widgets_common/bgWidget.dart';

import '../../controllers/product_controllers.dart';
import '../../widgets_common/loading_in.dart';

class CategoryDetails extends StatelessWidget {
  final String? titel;

  const CategoryDetails({super.key, required this.titel});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductsController>();
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: titel!.text.white.make(),
        ),
        body: StreamBuilder(
            stream: FireStoreServices.getProducts(titel),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Loagin(),
                );
              } else if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: "No Product Founded".text.color(bgColor).make(),
                );
              } else {
                var data = snapshot.data!.docs;
                return Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //10.heightBox,
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              controller.subcate.length,
                              (index) => "${controller.subcate[index]}"
                                  .text
                                  .size(12)
                                  .color(bgColor)
                                  .makeCentered()
                                  .box
                                  .rounded
                                  .white
                                  .size(120, 60)
                                  .margin(
                                      const EdgeInsets.symmetric(horizontal: 4))
                                  .make()),
                        ),
                      ),
                      20.heightBox,
                      Expanded(
                          child: GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisExtent: 250,
                                      mainAxisSpacing: 8,
                                      crossAxisSpacing: 8),
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(data[index]['p_image'][0],
                                        width: 200,
                                        height: 150,
                                        fit: BoxFit.fill),
                                    10.heightBox,
                                    "${data[index]['p_name']}"
                                        .text
                                        .color(Colors.black)
                                        .make(),
                                    10.heightBox,
                                    " ${data[index]['p_price']}"
                                        .numCurrencyWithLocale(
                                          locale: 'HI',
                                        )
                                        .text
                                        .color(bgColor)
                                        .size(16)
                                        .make(),
                                  ],
                                )
                                    .box
                                    .white
                                    .border(color: bgColor)
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 6))
                                    .rounded
                                    .padding(const EdgeInsets.all(20))
                                    .make()
                                    .onTap(() {
                                  Get.to(() => ItemDetails(
                                      Titel: "${data[index]['p_name']}",
                                      data: data[index]));
                                });
                              })),
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
