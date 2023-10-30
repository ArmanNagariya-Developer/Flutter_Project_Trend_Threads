import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trendthreads/consts/firebase_consts_variable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trendthreads/consts/consts.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  var profileImagePath = ''.obs;

  var profileImageLink = '';

  var nameController = TextEditingController();
  var passwordController = TextEditingController();

  var IsLoading = false.obs;

  ChangeImage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) return;
      profileImagePath.value = img.path;
    } on PlatformException catch (Execption) {
      VxToast.show(context, msg: Execption.toString());
    }
  }

  uploadimagedb() async {
    var filename = basename(profileImagePath.value);
    var destination = 'images/${currentUser!.uid}/$filename';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImagePath.value));
    profileImageLink = await ref.getDownloadURL();
  }

  updateProfile({name, password, image}) async {
    var store = FirebaseStore.collection(usercollection).doc(currentUser!.uid);
    await store.set({
      'name': name,
      'password': password,
      'image': image,
    }, SetOptions(merge: true));
    IsLoading(false);
  }
}
