import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stat_handler/providers/product_provider.dart';
import 'package:stat_handler/views/screens/home_page.dart';
import 'package:stat_handler/views/screens/product_page.dart';
import 'package:stat_handler/views/screens/splash_screen.dart';

import 'app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductController>(
            create: (context) => ProductController()),
      ],
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Food ordering System",
        //home: HomePage(),
        initialRoute: AppRoutes().introScreen,
        routes: {
          AppRoutes().homePage: (context) => const HomePage(),
          AppRoutes().introScreen: (context) => const IntroScreen(),
          AppRoutes().productPage: (context) => const ProductPage(),
        },
      ),
    );
  }
}
