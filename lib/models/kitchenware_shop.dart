import 'package:cutleryapp/models/kitchenware.dart';
import 'package:flutter/material.dart';

class KitchenWareShop extends ChangeNotifier {
  // List of kitchen items
  final List<KitchenWare> _kitchenWare = [
    KitchenWare(
        name: 'Chopping Board', imagePath: 'images/2.png', price: '950'),
    KitchenWare(
        name: 'Serrated Bread Knife', imagePath: 'images/3.png', price: '250'),
    KitchenWare(
        name: 'Wooden Soup Spoon', imagePath: 'images/4.png', price: '300'),
    KitchenWare(name: 'Set of Knives', imagePath: 'images/5.png', price: '650'),
    KitchenWare(name: 'Coffee mug', imagePath: 'images/6.png', price: '1550'),
    KitchenWare(
        name: 'Set of Plastic Spoons', imagePath: 'images/7.png', price: '450'),
  ];

  // List of items in the user cart

  final List<KitchenWare> _userCart = [];

  // get method list of kitchenware

  List<KitchenWare> get kitchenWare => _kitchenWare;

  // get method of user cart
  List<KitchenWare> get userCart => _userCart;

  // add item to cart function
  void addItemToCart(KitchenWare kitchenitem) {
    _userCart.add(kitchenitem);
    notifyListeners();
  }

  // remove item from cart function
  void removeItemFromCart(KitchenWare kitchenitem) {
    _userCart.remove(kitchenitem);
    notifyListeners();
  }
}
