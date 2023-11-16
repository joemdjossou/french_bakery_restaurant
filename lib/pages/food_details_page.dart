import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frenchbreadrestaurant/components/button.dart';
import 'package:frenchbreadrestaurant/models/bakery.dart';
import 'package:frenchbreadrestaurant/models/food.dart';
import 'package:frenchbreadrestaurant/themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({
    super.key,
    required this.food,
  });

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  //quantity
  int quantityCount = 0;

  //decrement quantity
  void decrementQuantity() {
    setState(() {
      if (quantityCount >= 1) {
        quantityCount--;
      }
    });
  }

  //increment quantity
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  //add to cart
  void addToCart() {
    //add to the cart if there is a minimum quantity
    if (quantityCount > 0) {
      //get access to the bakery
      final bakery = context.read<Bakery>();

      //add to cart
      bakery.addToCart(widget.food, quantityCount);

      //let the user know that everything was successful
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) =>
            AlertDialog(
              backgroundColor: primaryColor,
              content: const Text(
                'Sucessfully added to cart',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              actions: [
                //okay button
                IconButton(
                  onPressed: () {
                    //pop once to remove the dialog box
                    Navigator.pop(context);
                    //pop again to go to previous screen
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.verified,
                    color: Colors.green,
                    size: 30.0,
                  ),
                )
              ],
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).colorScheme.brightness,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: primaryColor,
        title: Text(widget.food.name,
          style: GoogleFonts.dmSerifDisplay(
            color: Theme.of(context).colorScheme.primary,),
        ),
      ),
      body: Column(
        children: [
          //listview of food details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  //image
                  Hero(
                    tag: widget.food.imagePath,
                    child: Image.asset(
                      widget.food.imagePath,
                      height: 200.0,
                    ),
                  ),

                  const SizedBox(
                    height: 25.0,
                  ),

                  //rating
                  Row(
                    children: [
                      //star icon
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),

                      const SizedBox(
                        width: 5.0,
                      ),

                      //rating number
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 10.0,
                  ),

                  //food name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 28.0,
                    ),
                  ),

                  const SizedBox(
                    height: 25.0,
                  ),

                  //description
                  Text(
                    'Description',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),

                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    widget.food.description,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //price + quantity + add to cart button
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                // price + quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //price
                    Text(
                      "\$${widget.food.price}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),

                    //quantity
                    Row(
                      children: [
                        //minus button
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            onPressed: decrementQuantity,
                          ),
                        ),

                        //quantity count
                        SizedBox(
                          width: 40.0,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),

                        //plus button
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            onPressed: incrementQuantity,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(
                  height: 25.0,
                ),

                //add to cart button
                MyButton(
                  text: "Add To Cart",
                  onTap: () => addToCart(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}