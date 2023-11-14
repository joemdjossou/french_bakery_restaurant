import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frenchbreadrestaurant/components/button.dart';
import 'package:frenchbreadrestaurant/components/food_tile.dart';
import 'package:frenchbreadrestaurant/models/bakery.dart';
import 'package:frenchbreadrestaurant/pages/food_details_page.dart';
import 'package:frenchbreadrestaurant/themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //click on the heart icon
  late Icon heartIcon = const Icon(Icons.favorite_outline);
  //navigate to the food item details page
  void navigateToFoodDetails(int index) {
    //get the bakery and the menu
    final bakery = context.read<Bakery>();
    final foodMenu = bakery.foodMenu;
    Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (context) => FoodDetailsPage(
            food: foodMenu[index],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    //status bar brightness

    //get the bakery and the menu
    final bakery = context.read<Bakery>();
    final foodMenu = bakery.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.light,),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => Navigator.pushNamed(context, '/cartpage'),
        ),
        title: const Text(
          "Paris",
        ),
        actions: [
          // cart button
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartpage');
            },
            icon: const Icon(
              Icons.shopping_cart_checkout_rounded,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //promo banner
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25.0),
            padding:
                const EdgeInsets.symmetric(vertical: 25.0, horizontal: 40.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //promo message
                      Text(
                        "Get 32% Promo",
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(
                        height: 20.0,
                      ),

                      //redeem button
                      MyButton(
                        text: "Redeem",
                        onTap: () {
                          Navigator.pushNamed(context, '/cartpage');
                        },
                      ),
                    ],
                  ),

                  //image
                  Image.asset(
                    'images/french_toast.png',
                    height: 100,
                  )
                ]),
          ),

          const SizedBox(
            height: 25.0,
          ),

          //search bar
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                hintText: 'Search here...',
              ),
            ),
          ),

          const SizedBox(
            height: 25.0,
          ),
          //menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Food Menu',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[900],
                fontSize: 18,
              ),
            ),
          ),

          const SizedBox(
            height: 10.0,
          ),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
                onTap: () => navigateToFoodDetails(index),
              ),
            ),
          ),

          const SizedBox(
            height: 25.0,
          ),

          //popular food
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(40.0),
            ),
            margin: const EdgeInsets.only(
              left: 25.0,
              right: 25.0,
              bottom: 25.0,
            ),
            padding: const EdgeInsets.all(20.0),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //image
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'images/french_toast.png',
                      height: 60.0,
                    ),

                    const SizedBox(
                      height: 20.0,
                    ),

                    //name and price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "French Toast Breads",
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 18.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "\$ 15.99",
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                //heart icon
                IconButton(
                  icon: heartIcon,
                  color: Colors.grey,
                  onPressed: () {
                    setState(() {
                      if(heartIcon.color == Colors.redAccent) {
                        heartIcon = const Icon(
                          Icons.favorite_outline,
                          color: Colors.grey,
                        );
                      }else {
                        heartIcon = const Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                        );
                      }
                      // heartIcon = const Icon(
                      //   Icons.favorite,
                      //   color: Colors.redAccent,
                      // );
                    });
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
