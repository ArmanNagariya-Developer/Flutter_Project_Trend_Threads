import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendthreads/consts/consts.dart';
import 'package:trendthreads/consts/firebase_consts_variable.dart';

class AuthController extends GetxController {
  // text Controller

  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  Future<UserCredential?> Login({context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text);
    } on FirebaseAuthException catch (Ex) {
      VxToast.show(context, msg: Ex.toString());
    }
    return userCredential;
  }

  // signup

  Future<UserCredential?> SignUp({email, password, context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (Ex) {
      VxToast.show(context, msg: Ex.toString());
    }
    return userCredential;
  }

// storing data

  storeUserData({name, password, email}) async {
    DocumentReference store =
        await FirebaseStore.collection(usercollection).doc(currentUser!.uid);
    store.set(
      {
        'name': name,
        'password': password,
        'email': email,
        'image': '',
        'id': currentUser!.uid,
        'cart_count': "00",
        'order_count': "00",
        'wishlist_count': "00"
      },
    );
  }

  signOutMethod(context) async {
    try {
      await auth.signOut();
    } catch (ex) {
      VxToast.show(context, msg: ex.toString());
    }
  }
}
