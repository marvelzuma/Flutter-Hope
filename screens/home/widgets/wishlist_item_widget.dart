import 'package:flutter/material.dart';
import 'package:flutter_hope/constants/controllers.dart';
import 'package:flutter_hope/models/cart_item.dart';
import 'package:flutter_hope/widgets/custom_text.dart';

class WishListItemWidget extends StatelessWidget {
  final CartItemModel? cartItem;

  const WishListItemWidget({Key? key, this.cartItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            cartItem!.image.toString(),
            width: 80,
          ),
        ),
        Expanded(
            child: Wrap(
          direction: Axis.vertical,
          children: [
            Container(
                padding: EdgeInsets.only(left: 14),
                child: CustomText(
                  text: cartItem!.name.toString(),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(Icons.chevron_left),
                    onPressed: () {
                      cartController.decreaseWishQuantity(cartItem!);
                    }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: cartItem!.quantity.toString(),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.chevron_right),
                    onPressed: () {
                      cartController.increaseWishQuantity(cartItem!);
                    }),
              ],
            ),
          ],
        )),
        Padding(
          padding: const EdgeInsets.all(14),
          child: CustomText(
            text: "${cartItem!.cost}" + "FCFA",
            size: 22,
            weight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
