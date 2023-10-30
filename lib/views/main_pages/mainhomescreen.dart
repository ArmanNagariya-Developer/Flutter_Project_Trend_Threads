import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendthreads/consts/consts.dart';
import 'package:trendthreads/consts/list.dart';
import 'package:trendthreads/services/firebase_services.dart';
import 'package:trendthreads/views/main_pages/categoryscreen.dart';
import 'package:trendthreads/views/main_pages/featured_button.dart';
import 'package:trendthreads/views/main_pages/item_details.dart';
import 'package:trendthreads/widgets_common/loading_in.dart';

import '../../widgets_common/home_button.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      color: Colors.white,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 100,
              color: Colors.white,
              alignment: Alignment.center,
              //search Box
              child: TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search, color: Colors.white),
                  filled: true,
                  fillColor: Colors.brown,
                  hintText: searchbox,
                  hintStyle: TextStyle(
                    color: textfieldGrey,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: false,
                        height: 170,
                        enlargeCenterPage: true,
                        itemCount: brandsList.length,
                        itemBuilder: (context, index) {
                          return Image.asset(brandsList[index],
                                  fit: BoxFit.fill)
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(EdgeInsets.symmetric(horizontal: 8))
                              .make();
                        }),

                    10.heightBox,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          2,
                          (index) => homeButton(
                                height: context.screenHeight * 0.1,
                                width: context.screenWidth / 2.5,
                                icon: index == 0 ? icTodaysDeal : ictreanding,
                                titel: index == 0 ? offer : Trending,
                              )),
                    ),
                    20.heightBox,
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: false,
                        height: 170,
                        enlargeCenterPage: true,
                        itemCount: secondlist.length,
                        itemBuilder: (context, index) {
                          return Image.asset(secondlist[index],
                                  fit: BoxFit.fill)
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(EdgeInsets.symmetric(horizontal: 8))
                              .make();
                        }),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          3,
                          (index) => homeButton(
                                height: context.screenWidth * 0.20,
                                width: context.screenWidth / 2.5,
                                icon: index == 0
                                    ? icBrands
                                    : index == 1
                                        ? icTopCategories
                                        : icTopSeller,
                                titel: index == 0
                                    ? Brand
                                    : index == 1
                                        ? TopCategories
                                        : TopSell,
                              )),
                    ),
                    25.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FeaturedCategories.text
                          .color(bgColor)
                          .size(18)
                          .fontFamily(semibold)
                          .make(),
                    ),
                    20.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            3,
                            (index) => Column(
                                  children: [
                                    featurebutton(
                                        icon: featuredimg1[index],
                                        titel: featuredtitel1[index]),
                                    10.heightBox,
                                    featurebutton(
                                        icon: featuredimg2[index],
                                        titel: featuredtitel2[index]),
                                  ],
                                )),
                      ),
                    ),
                    20.heightBox,
// featured products
                    Container(
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: const BoxDecoration(color: bgColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ("Featured Product").text.white.size(18).make(),
                          10.heightBox,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: StreamBuilder(
                                stream: FireStoreServices.allProduct(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (!snapshot.hasData) {
                                    return Loagin();
                                  } else {
                                    var allproduct = snapshot.data!.docs;
                                    return SizedBox(
                                      height: 250,
                                      child: Row(
                                        children: List.generate(
                                            allproduct.length,
                                            (index) => Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Image.network(
                                                      allproduct[index]
                                                          ['p_image'][0],
                                                      width: 150,
                                                      height: 150,
                                                      fit: BoxFit.fill,
                                                    ),
                                                    10.heightBox,
                                                    "${allproduct[index]['p_name']}"
                                                        .text
                                                        .color(Colors.black)
                                                        .make(),
                                                    10.heightBox,
                                                    "${allproduct[index]['p_price']}"
                                                        .numCurrencyWithLocale(
                                                            locale: "HI")
                                                        .text
                                                        .color(bgColor)
                                                        .size(16)
                                                        .make(),
                                                  ],
                                                )
                                                    .box
                                                    .white
                                                    .margin(const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 6))
                                                    .rounded
                                                    .padding(EdgeInsets.all(8))
                                                    .make()
                                                    .onTap(() {
                                                  Get.to(
                                                      () => CategoryScreen());
                                                })),
                                      ),
                                    );
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),

                    20.heightBox,
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: false,
                        height: 170,
                        enlargeCenterPage: true,
                        itemCount: secondlist.length,
                        itemBuilder: (context, index) {
                          return Image.asset(thirdlist[index], fit: BoxFit.fill)
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(EdgeInsets.symmetric(horizontal: 8))
                              .make();
                        }),
                    20.heightBox,

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          "All Products"
                              .text
                              .size(17)
                              .fontFamily(bold)
                              .color(bgColor)
                              .make(),
                        ],
                      ),
                    ),
                    //all products

                    20.heightBox,

                    StreamBuilder(
                      stream: FireStoreServices.allProduct(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Loagin();
                        } else {
                          var allproduct = snapshot.data!.docs;
                          return GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: allproduct.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 8,
                                      crossAxisSpacing: 8,
                                      mainAxisExtent: 300),
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                        allproduct[index]['p_image'][0],
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.fill),
                                    10.heightBox,
                                    "${allproduct[index]['p_name']}"
                                        .text
                                        .color(Colors.black)
                                        .make(),
                                    10.heightBox,
                                    "${allproduct[index]['p_price']}"
                                        .numCurrencyWithLocale(locale: "HI")
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
                                    .padding(EdgeInsets.all(20))
                                    .make()
                                    .onTap(() {
                                  Get.to(() => CategoryScreen());
                                });
                              });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
