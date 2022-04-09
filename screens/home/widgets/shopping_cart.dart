import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter_hope/constants/controllers.dart';
import 'package:flutter_hope/screens/home/widgets/cart_item_widget.dart';
import 'package:flutter_hope/widgets/custom_btn.dart';
import 'package:flutter_hope/widgets/custom_text.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoppingCartWidget extends StatelessWidget {
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
                text: "Votre panier",
                size: 24,
                weight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Obx(() => Column(
                  children: userController.userModel.value.cart!
                      .map((cartItem) => CartItemWidget(
                            cartItem: cartItem,
                          ))
                      .toList(),
                )),
          ],
        ),
        Positioned(
            bottom: 30,
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(8),
                child: Obx(
                  () => CustomButton(
                      text:
                          "Acheter (${cartController.totalCartPrice.value.toStringAsFixed(0)} FCFA) ",
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Stack(
                                  overflow: Overflow.visible,
                                  children: <Widget>[
                                    Positioned(
                                      right: -40.0,
                                      top: -40.0,
                                      child: InkResponse(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: CircleAvatar(
                                          child: Icon(Icons.close),
                                          backgroundColor: Colors.red,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                            'Choisissez la manière dont vous souhaitez récupérer vos produits'),
                                        SizedBox(height: 26),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.1,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Colors.black),
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.black,
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        scrollable: true,
                                                        title: Text(
                                                            'Vos coordonnées'),
                                                        content: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Form(
                                                            child: Column(
                                                              children: <
                                                                  Widget>[
                                                                TextFormField(
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Nom',
                                                                    icon: Icon(Icons
                                                                        .account_box),
                                                                  ),
                                                                ),
                                                                TextFormField(
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Téléphone',
                                                                    icon: Icon(Icons
                                                                        .phone),
                                                                  ),
                                                                ),
                                                                TextFormField(
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Adresse',
                                                                    icon: Icon(Icons
                                                                        .location_history_outlined),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        actions: [
                                                          ElevatedButton(
                                                              child: Text(
                                                                  "Terminer"),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return AlertDialog(
                                                                        content:
                                                                            Stack(
                                                                          overflow:
                                                                              Overflow.visible,
                                                                          children: <
                                                                              Widget>[
                                                                            Positioned(
                                                                              right: -40.0,
                                                                              top: -40.0,
                                                                              child: InkResponse(
                                                                                onTap: () {
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                child: CircleAvatar(
                                                                                  child: Icon(Icons.close),
                                                                                  backgroundColor: Colors.red,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Column(
                                                                              children: [
                                                                                Text('Merci pour votre achat!'),
                                                                                Text('Vos produits vous seront livrés dans les prochaines 24 heures'),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    });
                                                              })
                                                        ],
                                                      );
                                                    });
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Je souhaite me les faire livrer',
                                                  style: GoogleFonts.lato(
                                                      fontSize: 25,
                                                      color: Colors.white),
                                                ),
                                              )),
                                        ),
                                        SizedBox(height: 26),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.1,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Colors.black),
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.black,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Je souhaite récupérer mes produits sur place",
                                                  style: GoogleFonts.lato(
                                                      fontSize: 25,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        content: Stack(
                                                          overflow:
                                                              Overflow.visible,
                                                          children: <Widget>[
                                                            Positioned(
                                                              right: -40.0,
                                                              top: -40.0,
                                                              child:
                                                                  InkResponse(
                                                                onTap: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child:
                                                                    CircleAvatar(
                                                                  child: Icon(
                                                                      Icons
                                                                          .close),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .red,
                                                                ),
                                                              ),
                                                            ),
                                                            Column(
                                                              children: [
                                                                Text(
                                                                    'Merci pour votre achat!'),
                                                                Text(
                                                                    'Venez récupérez vos produits sur place.'),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    });
                                              }),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            });
                      }),
                )))
      ],
    );
  }
}
