import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendthreads/controllers/homecontroller.dart';
import 'package:trendthreads/controllers/profile_controllers.dart';

import '../consts/firebase_consts_variable.dart';

class CartController extends GetxController {
  var total = 0.obs;

  var addresscontroller = TextEditingController();
  var citycontroller = TextEditingController();
  var statecontroller = TextEditingController();
  var pincodecontroller = TextEditingController();
  var phonecontroller = TextEditingController();

  var paymentIndex = 0.obs;
  var products = [];

  var controller = Get.put(ProfileController());

  late dynamic productSnapshot;

  calculate(data) {
    total.value = 0;
    for (var i = 0; i < data.length; i++) {
      total.value = total.value + int.parse(data[i]['price'].toString());
    }
  }

  placeorder({required totalAmount}) async {
    await getProductDetails();
    await FirebaseStore.collection(ordersDetailsCollection).doc().set({
      "order_code": "Y0001",
      "order_by": currentUser!.uid,
      "order_date": FieldValue.serverTimestamp(),
      "email": currentUser!.email,
      "address": addresscontroller.text,
      "city": citycontroller.text,
      "state": statecontroller.text,
      "pincode": pincodecontroller.text,
      "phone": phonecontroller.text,
      "paymentMethod": "Cash On Delivery",
      "totalAmount": totalAmount,
      "order_placed": true,
      "order_confirmed": false,
      "order_delivered": false,
      'orders ': FieldValue.arrayUnion(products)
    });
  }

  getProductDetails() {
    for (var i = 0; i < productSnapshot.length; i++) {
      products.add({
        'color': productSnapshot[i]['color'],
        'img': productSnapshot[i]['img'],
        'quantity': productSnapshot[i]['quantity'],
        'title': productSnapshot[i]['title'],
      });
    }
  }
}
