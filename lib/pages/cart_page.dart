import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Theme.of(context).colorScheme.brightness,
          ),
          leading: child,
          backgroundColor: primaryColor,
          foregroundColor: Theme.of(context).colorScheme.secondary,
          elevation: 0.0,
          title: Text(
            "My Cart",
            style: TextStyle(color: Theme.of(context).colorScheme.secondary,),
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
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '\$$foodPrice',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
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
