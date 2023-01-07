import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stat_handler/providers/product_provider.dart';

import 'models/product_model.dart';

List<Product> products = [
  Product(
    id: 1,
    name: "Monsoon Salad",
    price: 25.0,
    image: "assets/images/monsoon.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 25.0,
  ),
  Product(
    id: 2,
    name: "Basic Salad",
    price: 15.0,
    image: "assets/images/basic.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 15.0,
  ),
  Product(
    id: 3,
    name: "Royal Salad",
    price: 19.0,
    image: "assets/images/royal.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 19.0,
  ),
  Product(
    id: 4,
    name: "All Fruits",
    price: 15.0,
    image: "assets/images/allfruits.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 15.0,
  ),
  Product(
    id: 5,
    name: "All Grocery",
    price: 95.0,
    image: "assets/images/allGro.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 95.0,
  ),
  Product(
    id: 6,
    name: "Basic Grocery",
    price: 110.0,
    image: "assets/images/basicGro.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 110.0,
  ),
  Product(
    id: 7,
    name: "Crude Grocery",
    price: 250.0,
    image: "assets/images/crudeGro.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 250.0,
  ),
  Product(
    id: 8,
    name: "All Veges",
    price: 230.0,
    image: "assets/images/allVeg.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 230.0,
  ),
  Product(
    id: 9,
    name: "Mix Veges",
    price: 310.0,
    image: "assets/images/mixVeg.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 310.0,
  ),
];

Widget productContainer(
    {required BuildContext context,
    required String image,
    required int id,
    required String name,
    required double price,
    required Function()? onTap,
    required Function()? plusButtonPressed}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Stack(
    children: [
      InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(10),
          height: height * 0.33,
          width: width * 0.44,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.25),
                  offset: const Offset(0, 0),
                  spreadRadius: 1,
                  blurRadius: 10,
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: (height * 0.26) / 1.5,
                width: width * 0.42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      image,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: -10,
                      right: -10,
                      child: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () async {
                          Provider.of<ProductController>(context, listen: false)
                              .likeProduct(product: products[id]);
                          log(products[id].isLike, name: "Is Like");
                          log(id.toString(), name: "Index");
                        },
                        icon: (products[id].isLike == "true")
                            ? Icon(
                                Icons.favorite,
                                size: 25,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.favorite_border,
                                size: 25,
                                color: Color(0XFFBAC2CD),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: TextStyle(
                  color: Color(0XFF1E2126),
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "20min",
                    style: TextStyle(
                      color: Color(0XFFBAC2CD),
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.star_rate_rounded,
                        color: Color(0XFFffc107),
                      ),
                      Text(
                        "2.5",
                        style: TextStyle(
                          color: Color(0XFFBAC2CD),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "\$$price",
                    style: TextStyle(
                      color: Color(0XFF1E2126),
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      Positioned(
        bottom: -60,
        right: -60,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.brown,
          ),
          child: Align(
            alignment: Alignment(-1.1, -1.1),
            child: IconButton(
              onPressed: plusButtonPressed,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 27,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
