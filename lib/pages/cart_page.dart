import 'package:flutter/material.dart';
import 'package:frenchbreadrestaurant/components/button.dart';
import 'package:frenchbreadrestaurant/models/bakery.dart';
import 'package:frenchbreadrestaurant/models/food.dart';
import 'package:frenchbreadrestaurant/themes/colors.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove from cart
  void removeFromCart(Food food, BuildContext context) {
    //get access to the bakery
    final bakery = context.read<Bakery>();

    //remove from cart
    bakery.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Bakery>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          leading: child,
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 0.0,
          title: const Text(
            "My Cart",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            //CUSTOMER CART
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  //get the food from cart
                  final Food food = value.cart[index];

                  //get food name
                  final String foodName = food.name;

                  //get food price
                  final String foodPrice = food.price;

                  //return list tile
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      color: secondaryColor,
                    ),
                    margin: const EdgeInsets.only(
                      left: 20.0,
                      top: 20.0,
                      right: 20.0,
                    ),
                    child: ListTile(
                      title: Text(
                        foodName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '\$$foodPrice',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () => removeFromCart(food, context),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red[500],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            //PAY BUTTON
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(
                text: "PAY NOW",
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
