import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:trendthreads/consts/consts.dart';

import '../consts/firebase_consts_variable.dart';
import '../model/categorymodel.dart';

class ProductsController extends GetxController {
  var subcate = [];
  var quantityCount = 0.obs;
  var colorIndex = 0.obs;
  var totalprice = 0.obs;
  getSubCategories(title) async {
    subcate.clear();
    var data = await rootBundle.loadString("lib/services/categories.json");
    var decode = categoryModelFromJson(data);
    var s =
        decode.categories.where((element) => element.name == title).toList();

    // var index = 0;
    // if (s != null && s.length > index) {
    for (var e in s[0].subcategory) {
      subcate.add(e);
    }
  }

  changecolor(index) {
    colorIndex.value = index;
  }

  increaseQuantity(totalQuantity) {
    if (quantityCount.value < totalQuantity) {
      quantityCount.value++;
    }
  }

  decreaseQuantity() {
    if (quantityCount > 0) {
      quantityCount.value--;
    }
  }

  caltotalprice(price) {
    totalprice.value = price * quantityCount.value;
  }

  addToCart({title, img, sellername, color, qty, price, context}) async {
    await FirebaseStore.collection(cartcollection).doc().set({
      "title": title,
      "img": img,
      "sellerName": sellername,
      "color": color,
      "quantity": qty,
      "price": price,
      "added_by": currentUser!.uid
    }).catchError((error) {
      VxToast.show(context, msg: error.toString());
    });
  }

  resetValues() {
    totalprice.value = 0;
    quantityCount.value = 0;
  }
}
