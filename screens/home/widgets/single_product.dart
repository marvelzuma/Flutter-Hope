import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hope/constants/controllers.dart';
import 'package:flutter_hope/models/product.dart';
import 'package:flutter_hope/widgets/custom_text.dart';

class SingleProductWidget extends StatelessWidget {
  final ProductModel? product;

  const SingleProductWidget({Key? key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                offset: Offset(3, 2),
                blurRadius: 7)
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  product!.image.toString(),
                  width: double.infinity,
                )),
          ),
          CustomText(
            text: product!.name.toString(),
            size: 18,
            weight: FontWeight.bold,
          ),
          CustomText(
            text: product!.brand.toString(),
            color: Colors.grey,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomText(
                  text: "${product!.price}" + ' FCFA',
                  size: 22,
                  weight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              IconButton(
                  icon: Icon(
                    CupertinoIcons.heart_fill,
                  ),
                  onPressed: () {
                    cartController.addProductTowishList(product!);
                  }),
              IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    cartController.addProductToCart(product!);
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
