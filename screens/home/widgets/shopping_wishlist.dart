import 'package:flutter/material.dart';
import 'package:flutter_hope/screens/home/widgets/wishlist_item_widget.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter_hope/constants/controllers.dart';
import 'package:flutter_hope/screens/home/widgets/cart_item_widget.dart';
import 'package:flutter_hope/widgets/custom_btn.dart';
import 'package:flutter_hope/widgets/custom_text.dart';

class ShoppingWishListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: CustomText(
                text: "Votre Wishlist",
                size: 24,
                weight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Obx(() => Column(
                  children: userController.userModel.value.wishlist!
                      .map((cartItem) => WishListItemWidget(
                            cartItem: cartItem,
                          ))
                      .toList(),
                )),
          ],
        ),
        // Positioned(
        //     bottom: 30,
        //     child: Container(
        //       width: MediaQuery.of(context).size.width,
        //       padding: EdgeInsets.all(8),
        //       child: Obx(() => CustomButton(
        //           text: "Pay (\$${cartController.totalCartPrice.value.toStringAsFixed(2)})", onTap: () {
        //             paymentsController.createPaymentMethod();
        //           }),)
        //     ))
      ],
    );
  }
}
