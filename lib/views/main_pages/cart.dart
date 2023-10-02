import 'package:flutter/material.dart';
import 'package:trendthreads/consts/consts.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: "Cart is Empty ): ".text.size(16).color(bgColor).makeCentered(),
    );
  }
}
