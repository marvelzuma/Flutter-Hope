import 'package:flutter/cupertino.dart';

class Product {
  late String name;
  double price;
  String? desc;
  DecorationImage? photo;

  Product({required this.name, required this.price, this.desc, this.photo});
}
