import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/constants/images_paths.dart';
import '../../../../data/models/item.dart';
import '../../../../provider/data_model.dart';
import '../home.dart';

class DrinkItems extends StatefulWidget {
  const DrinkItems({Key? key}) : super(key: key);

  @override
  _DrinkItemsState createState() => _DrinkItemsState();
}

class _DrinkItemsState extends State<DrinkItems> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      //physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 20,
      ),
      itemCount: 4,
      itemBuilder: (context, i) {
        return Card(
          elevation: 8,
          margin: EdgeInsets.zero,
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              child: Consumer<Model>(
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SizedBox(
                            height:
                            MediaQuery.of(context).size.height *
                                0.2,
                            width:
                            MediaQuery.of(context).size.width *
                                0.4,
                            child: Image.asset(
                              drinkPhotos[i],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      "${drinkNames[i]}",
                                      style: const TextStyle(
                                          fontSize: 20),
                                    ),
                                  ),
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      "${drinkPrices[i]} DT",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight:
                                          FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Container(
                                  height: MediaQuery.of(context)
                                      .size
                                      .height *
                                      0.06,
                                  width: MediaQuery.of(context)
                                      .size
                                      .width *
                                      0.2,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius:
                                      BorderRadius.circular(
                                          10)),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.black),
                                    child: const Text(
                                      "Add To Bag",
                                      textAlign: TextAlign.center,
                                      style:
                                      TextStyle(fontSize: 15),
                                    ),
                                    onPressed: () {
                                      HomeState.controller.forward().then(
                                              (value) =>
                                                  HomeState.controller.reset());

                                      value.add(Items(
                                          name: drinkNames[i],
                                          price: drinkPrices[i],
                                          photo: drinkPhotos[i]));
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              )),
        );
      },
    );
  }
}
