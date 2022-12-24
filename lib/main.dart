import 'package:baitap_appsale/presentation/features/cart/cart_page.dart';
import 'package:baitap_appsale/presentation/features/home/home_page.dart';
import 'package:baitap_appsale/presentation/features/order/order_page.dart';
import 'package:baitap_appsale/presentation/features/sign_in/sign_in_page.dart';
import 'package:baitap_appsale/presentation/features/sign_up/sign_up_page.dart';
import 'package:baitap_appsale/presentation/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'data/datasources/local/cache/app_cache.dart';

void main() {
  runApp(const MyApp());
  AppCache.init();
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppSale',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      routes: {
        "sign-in": (context) => SignInPage(),
        "sign-up": (context) => SignUpPage(),
        "splash": (context) => const SplashPage(),
        "home": (context) => const HomePage(),
        "cart":(context) => CartPage(),
        "order": (context) => OrderPage(),
      },
        initialRoute: "splash",
    );
  }
}
