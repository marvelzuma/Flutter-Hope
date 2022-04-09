import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_hope/constants/app_constants.dart';
import 'package:flutter_hope/constants/controllers.dart';
import 'package:flutter_hope/models/cart_item.dart';
import 'package:flutter_hope/models/product.dart';
import 'package:flutter_hope/models/user.dart';
import 'package:uuid/uuid.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  Rx<double> totalCartPrice = 0.0.obs;

  @override
  void onReady() {
    super.onReady();
    ever(userController.userModel, changeCartTotalPrice);
  }

  void addProductToCart(ProductModel product) {
    try {
      if (_isItemAlreadyAdded(product)) {
        Get.snackbar(
            "Vérifiez votre panier", "${product.name} est déjà ajouté");
      } else {
        String itemId = Uuid().toString();
        userController.updateUserData({
          "cart": FieldValue.arrayUnion([
            {
              "id": itemId,
              "productId": product.id,
              "name": product.name,
              "quantity": 1,
              "price": product.price,
              "image": product.image,
              "cost": product.price,
              "size": 40
            }
          ])
        });
        Get.snackbar(
            "Produit ajouté", "${product.name} a été ajouté à votre panier");
      }
    } catch (e) {
      Get.snackbar("Erreur", "Produit non ajouté");
      debugPrint(e.toString());
    }
  }

  void removeCartItem(CartItemModel cartItem) {
    try {
      userController.updateUserData({
        "cart": FieldValue.arrayRemove([cartItem.toJson()])
      });
    } catch (e) {
      Get.snackbar("Erreur", "Produit non retiré");
      //debugPrint(e.message);
    }
  }

  changeCartTotalPrice(UserModel userModel) {
    totalCartPrice.value = 0.0;
    if (userModel.cart!.isNotEmpty) {
      userModel.cart!.forEach((cartItem) {
        totalCartPrice += cartItem.cost;
      });
    }
  }

  bool _isItemAlreadyAdded(ProductModel product) =>
      userController.userModel.value.cart!
          .where((item) => item.productId == product.id)
          .isNotEmpty;

  void decreaseQuantity(CartItemModel item) {
    if (item.quantity == 1) {
      removeCartItem(item);
    } else {
      removeCartItem(item);
      item.quantity--;
      userController.updateUserData({
        "cart": FieldValue.arrayUnion([item.toJson()])
      });
    }
  }

  void increaseQuantity(CartItemModel item) {
    removeCartItem(item);
    item.quantity++;
    logger.i({"quantity": item.quantity});
    userController.updateUserData({
      "cart": FieldValue.arrayUnion([item.toJson()])
    });
  }

  void newItem(CartItemModel item) {
    userController.updateUserData({
      "cart": FieldValue.arrayUnion([item.toJson()])
    });
  }

  void increaseSize(CartItemModel item) {
    removeCartItem(item);
    item.size++;
    logger.i({"size": item.size});
    userController.updateUserData({
      "cart": FieldValue.arrayUnion([item.toJson()])
    });
  }

  void decreaseSize(CartItemModel item) {
    removeCartItem(item);
    item.size--;
    userController.updateUserData({
      "cart": FieldValue.arrayUnion([item.toJson()])
    });
  }

  void addProductTowishList(ProductModel product) {
    try {
      if (_isItemAlreadyAddedtowish(product)) {
        Get.snackbar(
            "Vérifiez votre wishlist", "${product.name} est déjà aujouté");
      } else {
        String itemId = Uuid().toString();
        userController.updateUserData({
          "wishlist": FieldValue.arrayUnion([
            {
              "id": itemId,
              "productId": product.id,
              "name": product.name,
              "quantity": 1,
              "price": product.price,
              "image": product.image,
              "cost": product.price,
              "size": 40,
            }
          ])
        });
        Get.snackbar(
            "Produit ajouté", "${product.name} a été ajouté à votre wishlist");
      }
    } catch (e) {
      Get.snackbar("Erreur", "Produit non ajouté");
      debugPrint(e.toString());
    }
  }

  void removeWishListItem(CartItemModel cartItem) {
    try {
      userController.updateUserData({
        "wishlist": FieldValue.arrayRemove([cartItem.toJson()])
      });
    } catch (e) {
      Get.snackbar("Erreur", "Produit non retiré");
      //debugPrint(e.message);
    }
  }

  changeWishListTotalPrice(UserModel userModel) {
    totalCartPrice.value = 0.0;
    if (userModel.wishlist!.isNotEmpty) {
      userModel.wishlist!.forEach((cartItem) {
        totalCartPrice += cartItem.cost;
      });
    }
  }

  void decreaseWishQuantity(CartItemModel item) {
    if (item.quantity == 1) {
      removeWishListItem(item);
    } else {
      removeWishListItem(item);
      item.quantity--;
      userController.updateUserData({
        "wishlist": FieldValue.arrayUnion([item.toJson()])
      });
    }
  }

  void increaseWishQuantity(CartItemModel item) {
    removeWishListItem(item);
    item.quantity++;
    logger.i({"quantity": item.quantity});
    userController.updateUserData({
      "wishlist": FieldValue.arrayUnion([item.toJson()])
    });
  }

  bool _isItemAlreadyAddedtowish(ProductModel product) =>
      userController.userModel.value.wishlist!
          .where((item) => item.productId == product.id)
          .isNotEmpty;
}
