import 'package:demo_shop_app/ui/screens/home/widgets/drink_items.dart';
import 'package:demo_shop_app/ui/screens/home/widgets/food_items.dart';
import 'package:demo_shop_app/ui/screens/home/widgets/fruit_items.dart';

import 'package:demo_shop_app/ui/screens/shopping_cart/shopping_cart.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../drawer/drawer.dart';
import '../../../provider/data_model.dart';
import 'package:lottie/lottie.dart';

import '../drawer/routes.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  static late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    controller.reset();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return Model();
      },
      child: MaterialApp(
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          drawer: const NavDrawer(),
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("Shoppy"),
            actions: [
              Row(
                children: [
                  Builder(builder: (context) {
                    return IconButton(
                        onPressed: () {
                          Navigator.of(context).push(createRoute(const Cart()));
                        },
                        icon: Transform.scale(
                            scale: 1.8,
                            child: Lottie.network(
                              "https://assets10.lottiefiles.com/temp/lf20_phx0zt.json",
                              repeat: false,
                              reverse: false,
                              animate: false,
                              controller: controller,
                            )));
                  }),
                  Consumer<Model>(
                    builder: (context, value, child) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "${value.TotaleQuantite}",
                          style: const TextStyle(fontSize: 20),
                        ),
                      );
                    },
                  )
                ],
              )
            ],
          ),
          body: ListView(children: [
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Foods",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const FoodItems(),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Fruits",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Builder(builder: (context) {
              return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: const FruitItems());
            }),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Drinks",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Builder(builder: (context) {
              return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: 200,
                  child: const DrinkItems());
            }),
          ]),
        ),
      ),
    );
  }
}
