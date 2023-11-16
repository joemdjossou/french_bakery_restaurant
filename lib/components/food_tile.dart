import 'package:flutter/material.dart';
import 'package:frenchbreadrestaurant/models/food.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function() onTap;
  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(left: 25.0),
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //image
            Hero(
              tag: food.imagePath,
              child: Image.asset(
                food.imagePath,
                height: 140.0,
              ),
            ),

            //text
            Text(
              food.name,
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 20.0,
              ),
            ),

            //price and rating
            SizedBox(
              width: 160.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //price
                  Text(
                    '\$${food.price}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),

                  //rating
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      Text(
                        food.rating,
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
