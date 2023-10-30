import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendthreads/consts/consts.dart';
import 'package:trendthreads/controllers/cart_controller.dart';
import 'package:trendthreads/views/main_pages/paymentmethod.dart';

import '../../widgets_common/edit_buttonwidget.dart';
import '../../widgets_common/edit_textfield.dart';

class CheckOutDetails extends StatelessWidget {
  const CheckOutDetails({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text("CheckOut"),
        backgroundColor: bgColor,
      ),
      bottomNavigationBar: editbutton(
          onPress: () {
            if (controller.pincodecontroller.text.length > 2) {
              Get.to(() => const PaymentMethod());
            } else {
              VxToast.show(context, msg: "Add Your Full Address");
            }
          },
          color: bgColor,
          textColor: whiteColor,
          title: "Continue"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Edittextfield(
              hint: "Address",
              IsPass: false,
              title: "Address",
              controller: controller.addresscontroller),
          Edittextfield(
              hint: "City",
              IsPass: false,
              title: "City",
              controller: controller.citycontroller),
          Edittextfield(
              hint: "State",
              IsPass: false,
              title: "State",
              controller: controller.statecontroller),
          Edittextfield(
              hint: "PIN Code",
              IsPass: false,
              title: "PIN Code",
              controller: controller.pincodecontroller),
          Edittextfield(
              hint: "Phone Number",
              IsPass: false,
              title: "Phone Number",
              controller: controller.phonecontroller),
        ]),
      ),
    );
  }
}
