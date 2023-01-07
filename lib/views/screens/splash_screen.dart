import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stat_handler/models/product_model.dart';

import '../../providers/db_helper.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  get products => null;

  initDataBase() async {
    await ProductDBHelper.productDBHelper.deleteAllData();
    for (Product product in products) {
      int success =
          await ProductDBHelper.productDBHelper.insertData(data: product);
      log(success.toString(), name: "success");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
            ),
            Image.asset(
              "assets/images/logo.png",
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Fast delivery ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Spacer(),
            Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(40),
              child: InkWell(
                borderRadius: BorderRadius.circular(40),
                onTap: () {
                  Navigator.pushNamed(context, "/");
                },
                child: Ink(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: Text(
                        "Towards Foods Ordering",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
