import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hope/screens/about.dart';
import 'package:flutter_hope/screens/home/widgets/menproducts.dart';
import 'package:flutter_hope/screens/home/widgets/shopping_wishlist.dart';
import 'package:flutter_hope/screens/home/widgets/womenproducts.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_hope/constants/controllers.dart';
import 'package:flutter_hope/screens/home/widgets/products.dart';
import 'package:flutter_hope/screens/home/widgets/shopping_cart.dart';
//import 'package:flutter_hope/screens/payments/payments.dart';
import 'package:flutter_hope/widgets/custom_text.dart';

import '../../main.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> items = ['Best Sellers', 'Hommes', 'Femmes'];

  String? selectedItem = 'Best Sellers';
  dynamic daTrue = ProductsWidget();

  void what() {
    if (selectedItem == 'Best Sellers') {
      setState(() {
        daTrue = ProductsWidget();
      });
    } else if (selectedItem == 'Hommes') {
      setState(() {
        daTrue = MenProductsWidget();
      });
    } else {
      daTrue = WomenProductsWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: CustomText(
            text: "FireLab",
            size: 24,
            weight: FontWeight.bold,
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  showBarModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      color: Colors.white,
                      child: ShoppingCartWidget(),
                    ),
                  );
                }),
            IconButton(
                icon: Icon(
                  CupertinoIcons.heart_fill,
                ),
                onPressed: () {
                  showBarModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      color: Colors.white,
                      child: ShoppingWishListWidget(),
                    ),
                  );
                })
          ],
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: ListView(
            children: [
              Obx(() => UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.black),
                  accountName: Text(userController.userModel.value.name ?? ""),
                  accountEmail:
                      Text(userController.userModel.value.email ?? ""))),
              // ListTile(
              //   leading: Icon(Icons.book),
              //   title: CustomText(
              //     text: "Payments History",
              //   ),
              //   onTap: ()async {
              //    paymentsController.getPaymentHistory();
              //   },
              // ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(title: '')),
                  );
                },
                leading: Icon(Icons.home_filled),
                title: Text('Accueil'),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                leading: Icon(Icons.shopping_bag_outlined),
                title: Text('Nos produits'),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => About()),
                  );
                },
                leading: Icon(Icons.question_mark_outlined),
                title: Text('A propos'),
              ),
              ListTile(
                onTap: () {
                  userController.signOut();
                },
                leading: Icon(Icons.exit_to_app),
                title: Text("Se déconnecter"),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Nos Produits',
                style:
                    GoogleFonts.lato(fontSize: 45, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black, width: 4),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      value: selectedItem,
                      isExpanded: true,
                      iconSize: 26,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                              value: item, child: Text(item)))
                          .toList(),
                      onChanged: (item) {
                        setState(() => selectedItem = item);
                        what();
                      }),
                ),
              ),
              Container(
                // height: MediaQuery.of(context),
                width: MediaQuery.of(context).size.width,
                color: Colors.white12,
                child: Column(
                  children: [
                    daTrue,
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
