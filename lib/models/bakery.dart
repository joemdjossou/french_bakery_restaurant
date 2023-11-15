import 'package:flutter/material.dart';
import 'package:frenchbreadrestaurant/models/food.dart';

class Bakery extends ChangeNotifier {
  final List<Food> _foodMenu = [
    //baguettes
    Food(
        name: "Baguettes",
        price: "3.99",
        imagePath: "images/baguette.png",
        rating: "4.9",
        description: "Baguettes, the epitome of French baking, boast a slender form with a golden-brown, crackling crust that encases a soft, airy crumb. Versatile and timeless, they serve as the perfect accompaniment to any meal or as the foundation for delectable sandwiches."),

    //sandwich parisien
    Food(
        name: "Sandwich Parisien",
        price: "7.99",
        imagePath: "images/sandwich_parisien.png",
        rating: "5.0",
        description: "The Sandwich Parisien elevates the art of simplicity. Nestled between slices of fresh baguette, this classic sandwich features layers of thinly sliced ham and creamy cheese, capturing the essence of Parisian street food."),

    //croissant
    Food(
        name: "Croissant",
        price: "2.99",
        imagePath: "images/croissant.png",
        rating: "4.7",
        description: "The croissant, a symbol of French pastry mastery, unfolds its layers of flaky goodness with every bite. Its buttery richness, delicate texture, and crescent shape make it an indulgent treat, whether enjoyed with morning coffee or as a luxurious dessert."),

    //croissant_choco
    Food(
        name: "Croissant Mixte",
        price: "3.99",
        imagePath: "images/croissant(1).png",
        rating: "4.8",
        description: "Indulge in the best of both worlds with the Croissant Mixte. This delightful variation seamlessly weaves layers of plain and chocolate-filled goodness. The marriage of buttery croissant layers and decadent chocolate creates a symphony of flavors in every bite."),

    //French Pancakes
    Food(
        name: "French Pancakes",
        price: "5.99",
        imagePath: "images/french_pancake.png",
        rating: "4.8",
        description: "French pancakes, or crêpes, epitomize delicate elegance. Thin and tender, these versatile delights serve as canvases for a myriad of sweet or savory fillings. From Nutella to ham and cheese, each crêpe promises a culinary journey with every fold."),

    //french_toast
    Food(
        name: "French Toast Breads",
        price: "4.99",
        imagePath: "images/french_toast.png",
        rating: "4.9",
        description: "Crafted specifically for the art of French toasting, these bread slices are slightly thicker, providing the perfect canvas to soak up the luscious blend of eggs and milk. The result is a sumptuous breakfast or brunch experience with a hint of indulgence."),

    //nibbles
    Food(
        name: "Nibbles",
        price: "1.99",
        imagePath: "images/nibbles.png",
        rating: "4.3",
        description: "Nibbles, in the realm of a French bakery, encompass an array of bite-sized treasures. From savory pastries to dainty treats, these morsels offer a symphony of flavors, ideal for savoring throughout the day."),

    //pastries
    Food(
        name: "Pastries",
        price: "5.99",
        imagePath: "images/pastries.png",
        rating: "4.3",
        description: "Pastries, the crown jewels of French baking, are a diverse collection of sweet and savory wonders. From the delicate layers of a mille-feuille to the decadence of an éclair, each pastry is a masterpiece, inviting you to explore a world of exquisite textures and tastes."),

    //bread
    Food(
        name: "Bread",
        price: "3.99",
        imagePath: "images/bread.png",
        rating: "4.4",
        description: "In the realm of a French bakery, bread takes on extraordinary qualities. This may refer to the classic baguette or a rustic pain de campagne, both boasting crusty exteriors and flavorful, tender interiors—a testament to the timeless appeal of traditional French bread."),
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
