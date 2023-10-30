import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore FirebaseStore = FirebaseFirestore.instance;
User? currentUser = auth.currentUser;

// collection
const usercollection = "users";
const productsCollection = "products";
const cartcollection = 'cart';
const ordersDetailsCollection = 'orders';
