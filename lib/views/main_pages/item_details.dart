import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendthreads/consts/consts.dart';
import 'package:trendthreads/controllers/product_controllers.dart';
import 'package:share_plus/share_plus.dart';

import '../../consts/colors.dart';
import '../../consts/list.dart';
import '../../widgets_common/edit_buttonwidget.dart';

class ItemDetails extends StatelessWidget {
  final String? Titel;
  final dynamic data;
  const ItemDetails({Key? key, required this.Titel, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductsController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              controller.resetValues();
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: bgColor,
        title: Titel!.text.white.make(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: Colors.white,
              )),
          // IconButton(
          //     onPressed: () {},
          //     icon: const Icon(
          //       Icons.favorite_border_outlined,
          //       color: Colors.white,
          //     )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VxSwiper.builder(
                      autoPlay: true,
                      height: 350,
                      aspectRatio: 16 / 9,
                      itemCount: data['p_image'].length,
                      viewportFraction: 1.0,
                      itemBuilder: (context, index) {
                        return Image.network(
                          data['p_image'][index],
                          width: double.infinity,
                          fit: BoxFit.fill,
                        );
                      }),

                  10.heightBox,

                  Titel!.text.size(16).color(bgColor).make(),

                  10.heightBox,

                  VxRating(
                    value: double.parse(data['p_rating']),
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    maxRating: 5,
                    size: 25,
                    stepInt: true,
                  ),
                  10.heightBox,
                  "${data['p_price']}"
                      .numCurrencyWithLocale(
                        locale: 'HI',
                      )
                      .text
                      .color(bgColor)
                      .make(),
                  10.heightBox,

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Seller".text.white.make(),
                            5.heightBox,
                            "${data['p_seller']}".text.white.make(),
                          ],
                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: bgColor,
                        child: Icon(
                          Icons.message_rounded,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                      .box
                      .height(56)
                      .padding(EdgeInsets.symmetric(horizontal: 16))
                      .color(bgColor)
                      .make(),
                  20.heightBox,
                  Obx(
                    () => Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Color:".text.color(bgColor).make(),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: List.generate(
                                  data["p_colors"].length,
                                  (index) => Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          VxBox()
                                              .size(25, 25)
                                              .roundedFull
                                              .color(
                                                  Color(data['p_colors'][index])
                                                      .withOpacity(1.0))
                                              .margin(EdgeInsets.symmetric(
                                                  horizontal: 4))
                                              .make()
                                              .onTap(() {
                                            controller.changecolor(index);
                                          }),
                                          Visibility(
                                            visible: index ==
                                                controller.colorIndex.value,
                                            child: Icon(
                                              Icons.done,
                                              color: whiteColor,
                                            ),
                                          )
                                        ],
                                      )),
                            ),
                          ],
                        ).box.padding(EdgeInsets.all(8)).make(),

                        // quantity row
                        Obx(
                          () => Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: "Quantity:".text.color(bgColor).make(),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      controller.decreaseQuantity();
                                      controller.caltotalprice(
                                          int.parse(data['p_price']));
                                    },
                                    icon: Icon(Icons.remove),
                                    color: bgColor,
                                  ),
                                  controller.quantityCount.value.text
                                      .size(14)
                                      .color(bgColor)
                                      .make(),
                                  IconButton(
                                    onPressed: () {
                                      controller.increaseQuantity(
                                          int.parse(data['p_quantity']));
                                      controller.caltotalprice(
                                          int.parse(data['p_price']));
                                    },
                                    icon: Icon(Icons.add),
                                    color: bgColor,
                                  ),
                                  10.widthBox,
                                  "(${data['p_quantity']} Available)"
                                      .text
                                      .color(bgColor)
                                      .size(14)
                                      .make()
                                ],
                              ),
                            ],
                          ).box.padding(EdgeInsets.all(8)).make(),
                        ),
                        // total price

                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Total:".text.color(bgColor).make(),
                            ),
                            Row(
                              children: [
                                "${controller.totalprice.value}"
                                    .numCurrencyWithLocale(
                                      locale: 'HI',
                                    )
                                    .text
                                    .color(bgColor)
                                    .center
                                    .make(),
                              ],
                            ),
                          ],
                        ).box.padding(EdgeInsets.all(8)).make(),
                      ],
                    ).box.white.shadowSm.make(),
                  ),
                  10.heightBox,
                  "Description".text.color(bgColor).size(16).make(),
                  10.heightBox,
                  "${data['p_desc']}".text.color(Colors.grey).make(),

                  // button selection
                  10.heightBox,
                  ListView(
                    shrinkWrap: true,
                    children: List.generate(
                        ButtonListCate.length,
                        (index) => ListTile(
                              title: ButtonListCate[index]
                                  .text
                                  .color(bgColor)
                                  .make(),
                              trailing: Icon(
                                Icons.arrow_circle_right_sharp,
                                color: bgColor,
                              ),
                            )),
                  )
                ],
              ),
            ),
          )),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: editbutton(
                color: bgColor,
                onPress: () {
                  controller.addToCart(
                      title: data['p_name'],
                      img: data['p_image'][0],
                      sellername: data['p_seller'],
                      color: data['p_colors'][controller.colorIndex.value],
                      qty: controller.quantityCount.value,
                      price: controller.totalprice.value,
                      context: context);
                  VxToast.show(context, msg: "Added Into Cart");
                },
                textColor: Colors.white,
                title: "Add to Cart"),
          )
        ],
      ),
    );
  }
}
