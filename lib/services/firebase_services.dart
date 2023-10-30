import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:trendthreads/consts/firebase_consts_variable.dart';

class FireStoreServices {
  static getUser(uid) {
    return FirebaseStore.collection(usercollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  static getProducts(Category) {
    return FirebaseStore.collection("products")
        .where('p_category', isEqualTo: Category)
        .snapshots();
  }

  static getCart(uid) {
    return FirebaseStore.collection(cartcollection)
        .where('added_by', isEqualTo: uid)
        .snapshots();
  }

  static deletecartitem(docId) {
    return FirebaseStore.collection(cartcollection).doc(docId).delete();
  }

  static getCount() async {
    var res = await Future.wait([
      FirebaseStore.collection(cartcollection)
          .where("added_by", isEqualTo: currentUser!.uid)
          .get()
          .then((value) {
        return value.docs.length;
      }),
      FirebaseStore.collection(productsCollection)
          .where("p_price", arrayContains: currentUser!.uid)
          .get()
          .then((value) {
        return value.docs.length;
      }),
      FirebaseStore.collection(productsCollection)
          .where("order_by", isEqualTo: currentUser!.uid)
          .get()
          .then((value) {
        return value.docs.length;
      }),
    ]);
    return res;
  }

  static allProduct() {
    return FirebaseStore.collection(productsCollection).snapshots();
  }
}
