import "package:electronics/models/Mobile.dart";
import "package:flutter/material.dart";

class Shop extends ChangeNotifier {
  final List<Mobile> _mobileList = [
    Mobile(
      imagePath: "assets/images/4060 ti 8gb Palit.png",
      name: "4060 ti Palit",
      ram: "8",
      price: "300",
      typeRam: "GDDR6",
      rating: "4.7",
    ),
    Mobile(
      imagePath: "assets/images/RTX 4090 ti.png",
      name: "4090 ti",
      ram: "24",
      price: "1000",
      typeRam: "GDDR6X",
      rating: "4.9",
    ),
    Mobile(
      imagePath: "assets/images/RTX 4070 ti Aorus.png",
      name: "4070 ti Aorus",
      ram: "8",
      price: "550",
      typeRam: "GDDR6",
      rating: "4.6",
    ),
  ];

  //customer cart
  final List<Mobile> _cart = [];

  //getter methods
  List<Mobile> get mobileList => _mobileList;
  List<Mobile> get cart => _cart;

  //add to cart
  void addToCart(Mobile mobileItem, int quantity) {
    for (var i = 0; i < quantity; i++) {
      _cart.add(mobileItem);
    }
    notifyListeners();
  }

  void removeToCart(Mobile mobile) {
    _cart.remove(mobile);
    notifyListeners();
  }
}
