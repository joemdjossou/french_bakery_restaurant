import 'package:flutter/material.dart';
import 'package:frenchbreadrestaurant/models/food.dart';

class Bakery extends ChangeNotifier {
  final List<Food> _foodMenu = [
    //baguettes
    Food(
        name: "Baguettes",
        price: "7.99",
        imagePath: "images/baguettes.png",
        rating: "4.9"),

    //bread
    Food(
        name: "Bread",
        price: "5.99",
        imagePath: "images/bread.png",
        rating: "4.4"),

    //croissant
    Food(
        name: "Croissant",
        price: "12.99",
        imagePath: "images/croissant_1.png",
        rating: "4.7"),

    //croissant_choco
    Food(
        name: "Croissant Mixte",
        price: "19.99",
        imagePath: "images/croissant_choco.png",
        rating: "4.8"),

    //French Pancakes
    Food(
        name: "French Pancakes",
        price: "14.99",
        imagePath: "images/french_pancake.png",
        rating: "4.8"),

    //french_toast
    Food(
        name: "French Toast Breads",
        price: "15.99",
        imagePath: "images/french_toast.png",
        rating: "4.9"),

    //nibbles
    Food(
        name: "Nibbles",
        price: "6.99",
        imagePath: "images/nibbles.png",
        rating: "4.3"),

    //pastries
    Food(
        name: "Pastries",
        price: "9.99",
        imagePath: "images/pastries.png",
        rating: "4.3"),

    //sandwich parisien
    Food(
        name: "Sandwich Parisien",
        price: "11.99",
        imagePath: "images/sandwich_parisien.png",
        rating: "5.0"),
  ];
  //customer cart
  List<Food> _cart = [];

  //getter method
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  //add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(
    Food foodItem,
  ) {
    _cart.remove(foodItem);
    notifyListeners();
  }
}
