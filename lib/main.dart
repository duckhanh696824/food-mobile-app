// ignore_for_file: prefer_const_constructors

import 'package:agriplant/controller/auth_controller.dart';
import 'package:agriplant/controller/cart_controller.dart';
import 'package:agriplant/screens/cart_screen.dart';
import 'package:agriplant/screens/home_screen.dart';
import 'package:agriplant/screens/login_screen.dart';
import 'package:agriplant/screens/onboarding_screen.dart';
import 'package:agriplant/screens/register_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agriplant/services/product_service.dart';

void main() {
  Get.put(ProductService());
  Get.put(AuthController());
  Get.put(CartController());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        textTheme: GoogleFonts.nunitoTextTheme(),
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(CartController());
      }),
      home: const OnboardingScreen(),
      getPages: [
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/onboarding', page: () => OnboardingScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/register', page: () => RegisterScreen()),
        GetPage(name: '/cart', page: () => CartScreen()),
      ],
    );
  }
}
