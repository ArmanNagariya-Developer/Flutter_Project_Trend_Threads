import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trendthreads/consts/consts.dart';
import 'package:trendthreads/consts/firebase_consts_variable.dart';
import 'package:trendthreads/services/firebase_services.dart';
import 'package:trendthreads/widgets_common/edit_buttonwidget.dart';

import '../../controllers/cart_controller.dart';
import 'checkout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: Text("Your Cart"),
          backgroundColor: bgColor,
        ),
        body: StreamBuilder(
          stream: FireStoreServices.getCart(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: "Cart Is Empty".text.make(),
              );
            } else {
              var data = snapshot.data!.docs;
              controller.calculate(data);
              controller.productSnapshot = data;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: data.lastIndex,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: Image.network("${data[index]['img']}"),
                                title:
                                    "${data[index]['title']} (${data[index]['quantity']})"
                                        .text
                                        .color(bgColor)
                                        .make(),
                                subtitle: "${data[index]['price']}"
                                    .numCurrencyWithLocale(locale: "HI")
                                    .text
                                    .color(bgColor)
                                    .make(),
                                trailing: Icon(
                                  Icons.delete,
                                  color: bgColor,
                                ).onTap(() {
                                  FireStoreServices.deletecartitem(
                                      data[index].id);
                                }),
                              );
                            })),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        'Total Price :'.text.color(whiteColor).make(),
                        Obx(
                          () => "${controller.total.value}"
                              .numCurrencyWithLocale(locale: 'HI')
                              .text
                              .color(whiteColor)
                              .make(),
                        )
                      ],
                    )
                        .box
                        .padding(EdgeInsets.all(12))
                        .color(bgColor)
                        .roundedSM
                        .make(),
                    20.heightBox,
                    SizedBox(
                      width: context.screenWidth - 60,
                      child: editbutton(
                          color: bgColor,
                          onPress: () {
                            Get.to(() => const CheckOutDetails());
                          },
                          textColor: whiteColor,
                          title: "Checkout"),
                    )
                  ],
                ),
              );
            }
          },
        ));
  }
}
