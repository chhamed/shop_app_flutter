
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/data_model.dart';
import 'alert_dialogue.dart';



class Cart extends StatefulWidget {

  const Cart({Key? key}) : super(key: key);

  @override
  CartState createState() => CartState();
}

class CartState extends State<Cart> with TickerProviderStateMixin {
  static    AnimationController? controller2;
  @override
  void initState() {
    super.initState();

     controller2 =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    controller2!.reset();
  }

  @override
  void dispose() {
    controller2!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping items"),
      ),
      body: Consumer<Model>(
        builder: (context, value, child) {
          return value.shopping_items.isEmpty
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "No items buyed\nreturn to the shop to buy some items",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                )
              : ListView(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: value.shopping_items.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(
                                elevation: 8,
                                margin: EdgeInsets.zero,
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                "${value.shopping_items[index].name}",
                                                style: const TextStyle(
                                                    fontSize: 20),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Image.asset(
                                                value.shopping_items[index]
                                                    .photo,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.09,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          ],
                                        ),
                                        const Spacer(),
                                        Text(
                                            "${value.Quant[value.shopping_items[index].name]}",
                                            style:
                                                const TextStyle(fontSize: 20)),
                                        IconButton(
                                          icon: const Icon(
                                              Icons.highlight_remove),
                                          onPressed: () {
                                            value.remove(
                                                value.shopping_items[index]);
                                          },
                                        )
                                      ],
                                    ))),
                          );
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.black),
                              child: Text(
                                "Confirm order\n totale price =${value.totale_price} DT",
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 15),
                              ),
                              onPressed: () {
                                value.addToHistory(
                                    value.shopping_items, value.totale_price);
                                showAlertDialog(context);

                                controller2!
                                    .forward()
                                    .then((value) => controller2!.reset());
                                value.clear();
                              })),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                );
        },
      ),
    );
  }
}


