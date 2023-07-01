import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  //list of items on sale
  final List _shopItems = [
    //itemName, itemPrice, imagePath, color
    ["Avocado", "300", "lib/images/avocado.png", Colors.green],
    ["Banana", "80", "lib/images/banana.png", Colors.yellow],
    ["Chicken", "250", "lib/images/chicken.png", Colors.brown],
    ["Water", "20", "lib/images/water.png", Colors.blue],
  ];

  //list of cart items
  final List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  //add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    //should be removeAt for functioning remove button
    notifyListeners();
  }

  //show total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]); //1 for price index in list
    }
    return totalPrice.toStringAsFixed(2);
  }
}
