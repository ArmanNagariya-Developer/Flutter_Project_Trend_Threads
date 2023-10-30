import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trendthreads/consts/consts.dart';
import 'package:trendthreads/consts/list.dart';
import 'package:trendthreads/controllers/cart_controller.dart';

import '../../widgets_common/edit_buttonwidget.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: const Text('Payment Method'),
          backgroundColor: bgColor,
        ),
        bottomNavigationBar: editbutton(
            onPress: () {
              controller.placeorder(totalAmount: controller.total.value);
            },
            color: bgColor,
            textColor: whiteColor,
            title: "Place"),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: List.generate(paymentmethod.length, (index) {
              return Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: EdgeInsets.only(bottom: 12),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.asset(
                      paymentmethod[index],
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    controller.paymentIndex.value == index
                        ? Transform.scale(
                            scale: 1.3,
                            child: Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                value: true,
                                checkColor: whiteColor,
                                activeColor: bgColor,
                                onChanged: (value) {}))
                        : Container(),
                  ],
                ),
              );
            }),
          ),
        ));
  }
}
