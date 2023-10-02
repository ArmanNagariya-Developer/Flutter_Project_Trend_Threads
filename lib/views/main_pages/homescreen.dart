import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trendthreads/consts/consts.dart';
import 'package:trendthreads/controllers/homecontroller.dart';
import 'package:get/get.dart';
import 'package:trendthreads/views/main_pages/account.dart';
import 'package:trendthreads/views/main_pages/categoryscreen.dart';
import 'package:trendthreads/views/main_pages/mainhomescreen.dart';

import 'cart.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    //from home controller
    var controller = Get.put(HomeController());


    var NavigationBar = [
      const BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.white,weight: 26,),label:"Home"),
      const BottomNavigationBarItem(icon: Icon(Icons.category,color: Colors.white,weight: 26,),label:"Category"),
      const BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,color: Colors.white,weight: 26,),label:"Cart"),
      const BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.white,weight: 26,),label:"Account"),

    ];
    var NavBody=[
      MainHomeScreen(),
      CategoryScreen(),
      CartScreen(),
      AccountScreen(),

    ];
    return Scaffold(
      body: Column(
        children: [
          Obx(()=> Expanded(child:NavBody.elementAt(controller.currentNavIndex.value),)),
        ],
      ),
      bottomNavigationBar: Obx(()=>
         BottomNavigationBar(
           currentIndex: controller.currentNavIndex.value,
          type:BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: const TextStyle(fontFamily: bold),
          selectedItemColor: Colors.black,
          backgroundColor: Colors.brown,
          items: NavigationBar,
           onTap: (value)
           {
             controller.currentNavIndex.value =value;
           },
        ),
      ),
    );
  }
}
