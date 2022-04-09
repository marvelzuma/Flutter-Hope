import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hope/screens/home/home.dart';
import 'package:flutter_hope/widgets/qualites.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../constants/controllers.dart';
import '../main.dart';
import '../widgets/custom_text.dart';
import 'home/widgets/shopping_cart.dart';
import 'home/widgets/shopping_wishlist.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: CustomText(
            text: "FireLab",
            size: 24,
            color: Colors.black,
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
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://firebasestorage.googleapis.com/v0/b/hope-e1b50.appspot.com/o/omar-prestwich-jLEGurepDco-unsplash.jpg?alt=media&token=8035da6e-fdd9-4634-8243-31c307ba7868"),
                fit: BoxFit.cover,
                // colorFilter: new ColorFilter.mode(
                //     Colors.black.withOpacity(0.1), BlendMode.dstATop),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'A propos de nous',
                  style: GoogleFonts.lato(
                      fontSize: 80,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
                SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 125),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'La qualité,',
                                style: GoogleFonts.lato(
                                    fontSize: 80,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "c'est chez nous.",
                                style: GoogleFonts.lato(
                                    fontSize: 80,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Authenticity Only.',
                                style: GoogleFonts.lato(
                                    fontSize: 80,
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ))
                    // Text(
                    //   '"Firelab a été capable de me fournir des sneakers indisponibles dans le pays. La vitesse de réception est déconcertante et je les remercie pour cela."',
                    //   style: GoogleFonts.lato(
                    //       fontSize: 40,
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.black, Colors.black]),
              image: DecorationImage(
                image: NetworkImage(
                    "https://firebasestorage.googleapis.com/v0/b/hope-e1b50.appspot.com/o/nice.png?alt=media&token=a0ea5309-17a4-478a-8d21-812c4623c84f"),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.1), BlendMode.dstATop),
              ),
              //borderRadius: BorderRadius.circular(30),
              color: Colors.grey[900],
            ),
            height: MediaQuery.of(context).size.height / 1.2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(30),
                color: Colors.grey[50],
              ),
              height: MediaQuery.of(context).size.height / 1.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 10),
                    child: Text('Nos clients parlent de nous',
                        style: GoogleFonts.lato(
                            fontSize: 45,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    width: 600,
                    height: 400,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Column(
                        children: [
                          Text(
                              '''Firelab a été capable de me fournir des sneakers indisponibles dans le pays. La vitesse de réception est déconcertante et je les remercie pour cela.''',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 30, color: Colors.black)),
                          Text('Aïcha, Thiès',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 30, color: Colors.amber)),
                          Text(
                              '''J'ai découvert ce sneaker supplier grâce à un ami et depuis, j'achète toutes mes chaussures chez eux. Leur service client est à l'écoute et leur efficacité est vraiment appréciable; je les recommande.''',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 30, color: Colors.black)),
                          Text('Modou, Dakar',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 30, color: Colors.amber))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.black, Colors.black]),
              image: DecorationImage(
                image: NetworkImage(
                    "https://firebasestorage.googleapis.com/v0/b/hope-e1b50.appspot.com/o/nice.png?alt=media&token=a0ea5309-17a4-478a-8d21-812c4623c84f"),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.1), BlendMode.dstATop),
              ),
              //borderRadius: BorderRadius.circular(30),
              color: Colors.grey[900],
            ),
            height: MediaQuery.of(context).size.height / 1.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, right: 10),
                  child: Text('Mission, vision, valeurs.',
                      style: GoogleFonts.lato(
                          fontSize: 45,
                          color: Colors.amber,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  width: 600,
                  height: 320,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                        '''FireLab est une entreprise qui se veut responsable et qui vend des chaussures confortables, de qualité et de style. Nous vous fournirons des paires parmi les meilleures rapidement, quelle que soit votre localisation dans le pays.''',
                        style: GoogleFonts.ubuntu(
                            fontSize: 30, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ])));
  }
}
