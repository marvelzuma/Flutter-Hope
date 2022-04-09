import 'package:flutter/material.dart';
import 'package:flutter_hope/constants/controllers.dart';
import 'package:flutter_hope/models/product.dart';
import 'package:flutter_hope/screens/home/widgets/single_product.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';

class ProductsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    int number = width > 1010 ? 4 : 1;
    print(producsController.products);
    return SingleChildScrollView(
      child: Obx(() => GridView.count(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          crossAxisCount: number,
          childAspectRatio: .63,
          padding: const EdgeInsets.all(10),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 10,
          children: producsController.products.map((ProductModel product) {
            return SingleProductWidget(
              product: product,
            );
          }).toList())),
    );
  }
}
