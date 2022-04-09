import 'package:flutter/material.dart';
import 'package:flutter_hope/constants/controllers.dart';
import 'package:flutter_hope/models/cart_item.dart';
import 'package:flutter_hope/widgets/custom_text.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItemWidget extends StatelessWidget {
  final CartItemModel? cartItem;

  const CartItemWidget({Key? key, this.cartItem}) : super(key: key);
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
            Column(
              children: [
                Text(
                  'Quantité',
                  style: GoogleFonts.ubuntu(
                    fontSize: 13,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(Icons.chevron_left),
                        onPressed: () {
                          cartController.decreaseQuantity(cartItem!);
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
                          cartController.increaseQuantity(cartItem!);
                        }),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Pointure',
                  style: GoogleFonts.ubuntu(
                    fontSize: 13,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.chevron_left),
                        onPressed: () {
                          cartController.decreaseSize(cartItem!);
                        }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(
                        text: cartItem!.size.toString(),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.chevron_right),
                        onPressed: () {
                          cartController.increaseSize(cartItem!);
                        }),
                  ],
                )
              ],
            ),
          ],
        )),
        Padding(
          padding: const EdgeInsets.all(14),
          child: CustomText(
            text: "${cartItem!.cost}" + " FCFA",
            size: 22,
            weight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
