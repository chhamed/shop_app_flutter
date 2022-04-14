import 'package:demo_shop_app/ui/screens/shopping_cart/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

showAlertDialog(BuildContext context) {

  Widget returnback = TextButton(
    child: const Text(
      "OK",
      style: TextStyle(fontSize: 25),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );


  AlertDialog alert = AlertDialog(
    title: const Text('Order done successfully'),
    content: Lottie.asset(
      "assets/images/cart-checkout-fast.json",
      repeat: false,
      reverse: false,
      animate: false,
      controller: CartState.controller2,
    ),
    actions: [returnback],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}