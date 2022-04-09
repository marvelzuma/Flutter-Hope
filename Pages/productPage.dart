import 'package:flutter/material.dart';
import 'package:flutter_hope/Classes/product.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';

class ProductPage extends StatefulWidget {
  Product produit;
  ProductPage({required this.produit});
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width > 600) {
      return Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('GOOdbye'))
        ],
      );
    } else {
      return Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black,
            child: TextButton(
                onPressed: () {
                  Navigator.pop;
                },
                child: Text('Nigga')),
          ),
        ],
      );
    }
  }
}
