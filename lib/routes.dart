import 'package:flutter/cupertino.dart';
import 'package:stat_handler/views/screens/home_page.dart';
import 'package:stat_handler/views/screens/splash_screen.dart';

import '../views/screens/product_page.dart';
import 'app_routes.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes().homePage: (context) => const HomePage(),
  AppRoutes().introScreen: (context) => const IntroScreen(),
  AppRoutes().productPage: (context) => const ProductPage(),
};
