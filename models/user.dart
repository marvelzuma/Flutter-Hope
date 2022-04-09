import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hope/models/cart_item.dart';

class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const CART = "cart";
  static const WISHLIST = "wishlist";

  String? id;
  String? name;
  String? email;
  List<CartItemModel>? cart;
  List<CartItemModel>? wishlist;

  UserModel(
      {this.id,
      this.name,
      this.email,
      required this.cart,
      required this.wishlist});

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    name = snapshot.data()![NAME];
    email = snapshot.data()![EMAIL];
    id = snapshot.data()![ID];
    cart = _convertCartItems(snapshot.data()![CART] ?? []);
    wishlist = _convertCartItems(snapshot.data()![WISHLIST] ?? []);
  }

  List<CartItemModel> _convertCartItems(List cartFomDb) {
    List<CartItemModel> _result = [];
    if (cartFomDb.length > 0) {
      cartFomDb.forEach((element) {
        _result.add(CartItemModel.fromMap(element));
      });
    }
    return _result;
  }

  List cartItemsToJson() => cart!.map((item) => item.toJson()).toList();
  List wishlistItemsToJson() => wishlist!.map((item) => item.toJson()).toList();
}
