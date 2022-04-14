import 'package:demo_shop_app/ui/screens/foods_description/couscous.dart';
import 'package:demo_shop_app/ui/screens/foods_description/spaghetti.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/constants/images_paths.dart';
import '../../../../data/models/item.dart';
import '../../../../provider/data_model.dart';
import '../../../../utils/utils.dart';
import '../home.dart';

class FoodItems extends StatefulWidget {
  const FoodItems({Key? key}) : super(key: key);

  @override
  _FoodItemsState createState() => _FoodItemsState();
}

class _FoodItemsState extends State<FoodItems> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 30),
      itemCount: 6,
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
                            height: MediaQuery
                                .of(context)
                                .size
                                .height *
                                0.2,
                            width:
                            MediaQuery
                                .of(context)
                                .size
                                .width * 0.4,
                            child: GestureDetector(
                              onTap: () {
                                switch (i) {
                                  case 0:
                                    {
                                      Utils.pushScreen(context,Couscous());
                                    }
                                    break;

                                  case 3:
                                    {
                                      Utils.pushScreen(context,Spaghetti());
                                    }
                                    break;

                                  default:
                                    {}
                                    break;
                                }
                              },
                              child: Image.asset(
                                foodPhotos[i],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "${foodNames[i]}",
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "${foodPrices[i].toInt()} DT",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Container(
                              height:
                              MediaQuery
                                  .of(context)
                                  .size
                                  .height *
                                  0.06,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width *
                                  0.2,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                  BorderRadius.circular(10)),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                child: const Text(
                                  "Add To Bag",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15),
                                ),
                                onPressed: () {
                                  HomeState.controller.forward().then(
                                          (value) => HomeState.controller.reset());

                                  value.add(Items(
                                      name: foodNames[i],
                                      price: foodPrices[i],
                                      photo: foodPhotos[i]));
                                },
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
