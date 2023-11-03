import 'package:flutter/material.dart';
import 'package:frenchbreadrestaurant/components/button.dart';
import 'package:frenchbreadrestaurant/themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 25.0,
            ),

            //shop name
            Text(
              "FRENCH BAKERY",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 30,
                color: Colors.white,
              ),
            ),

            const SizedBox(
              height: 25.0,
            ),

            //icon
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Image.asset('images/croissant.png'),
            ),

            const SizedBox(
              height: 25.0,
            ),
            //title
            Text(
              "THE TASTE OF FRENCH BREADS",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 44,
                color: Colors.white,
              ),
            ),

            const SizedBox(
              height: 10.0,
            ),

            //subtitle
            Text(
              "Feel the taste of the most popular french breads from anywhere at anytime",
              style: TextStyle(
                color: Colors.grey[300],
                height: 2,
              ),
            ),

            const SizedBox(
              height: 25.0,
            ),

            //button
            MyButton(
              text: "Get Started",
              onTap: () {
                //we go from here to the menu page
                Navigator.pushNamed(context, '/menupage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
