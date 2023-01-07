import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import 'cart.dart';
import 'home_page_prod.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic selected;
  var heart = false;
  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: StylishBottomBar(
        items: [
          AnimatedBarItems(
              icon: const Icon(
                Icons.house_outlined,
                size: 28,
              ),
              selectedIcon: const Icon(Icons.house_rounded),
              selectedColor: Colors.brown,
              backgroundColor: Colors.brown.shade100,
              title: const Text('Home')),
          AnimatedBarItems(
              icon: const Icon(
                Icons.mark_chat_read_outlined,
                size: 25,
              ),
              selectedIcon: const Icon(Icons.mark_chat_read_outlined),
              selectedColor: Colors.brown,
              backgroundColor: Colors.brown.shade100,
              title: const Text('Message')),
          AnimatedBarItems(
              icon: const Icon(
                CupertinoIcons.cart,
                size: 25,
              ),
              selectedIcon: const Icon(
                CupertinoIcons.cart,
              ),
              selectedColor: Colors.brown,
              backgroundColor: Colors.brown.shade100,
              title: const Text('Cart')),
          AnimatedBarItems(
              icon: const Icon(
                CupertinoIcons.heart,
                size: 25,
              ),
              selectedIcon: const Icon(
                CupertinoIcons.heart_fill,
              ),
              selectedColor: Colors.brown,
              backgroundColor: Colors.brown.shade100,
              title: const Text('Like')),
        ],
        iconSize: 32,
        barAnimation: BarAnimation.transform3D,
        iconStyle: IconStyle.animated,
        hasNotch: true,
        fabLocation: StylishBarFabLocation.center,
        opacity: 0.3,
        currentIndex: selected ?? 0,
        onTap: (index) {
          controller.jumpToPage(index!);
          setState(() {
            selected = index;
          });
        },
      ),
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: const [
            ProductHomePage(),
            Center(child: Text('Star')),
            CartPage(),
            Center(child: Text('Profile')),
          ],
        ),
      ),
    );
  }
}
