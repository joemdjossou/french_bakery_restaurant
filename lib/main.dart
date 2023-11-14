import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frenchbreadrestaurant/models/bakery.dart';
import 'package:frenchbreadrestaurant/pages/cart_page.dart';
import 'package:frenchbreadrestaurant/pages/intro_page.dart';
import 'package:frenchbreadrestaurant/pages/menu_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(ChangeNotifierProvider(
    create: (context) => Bakery(),
    child: const MyApp(),
  )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
        routes: {
          '/intropage': (context) => const IntroPage(),
          '/menupage': (context) => const MenuPage(),
          '/cartpage': (context) => const CartPage(),
        },
      ),
    );
  }
}