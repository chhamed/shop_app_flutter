import 'package:demo_shop_app/data/models/item.dart';
import 'package:flutter/material.dart';

import '../data/models/item.dart';

class Model extends ChangeNotifier {
  int totale_price = 0;
  List totale_price2 = [];
  int totalequantite = 0;
  List shopping_items = [];
  List shopping_items2 = [];

  int rating = 0;
  Map<dynamic, dynamic> Quant = {};
  List<dynamic> Quant2 = [];
  Map<dynamic, dynamic> Quant3 = {};

  void add(Items item) {
    if (Quant.containsKey(item.toString())) {
      Quant.update(item.toString(), (value) => value + 1);
    } else {
      shopping_items.add(item);
      Quant[item.toString()] = 1;
    }

    totalequantite += 1;
    totale_price += item.price;

    notifyListeners();
  }

  void remove(Items item) {
    if (Quant[item.toString()]! > 1) {
      Quant.update(item.toString(), (value) => value - 1);
    } else {
      shopping_items.remove(item);
      Quant.remove(item.toString());
    }

    totalequantite -= 1;
    totale_price -= item.price;
    notifyListeners();
  }

  Map reverseMap(Map map) => {for (var e in map.entries) e.value: e.key};

  void addToHistory(shoppingItems, totaleprice) {
    shopping_items2.add(shoppingItems);

    Quant3 = reverseMap(Quant);
    Quant2.add(Quant);

    totale_price2.add(totaleprice);

    notifyListeners();
  }

  void removeFromHistory(index) {
    shopping_items2.remove(shopping_items);

    totale_price2.removeAt(index);
    Quant2.removeAt(index);
    notifyListeners();
  }

  void clear() {
    totalequantite = 0;
    totale_price = 0;
    shopping_items = [];
    Quant = {};

    notifyListeners();
  }

  int get TotaleQuantite => totalequantite;

  void rate(int rating) {
    this.rating = rating;
    notifyListeners();
  }
}
