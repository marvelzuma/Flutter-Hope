import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_hope/Widgets/productCaroussel.dart';
import 'package:flutter_hope/Widgets/qualites.dart';
import 'package:flutter_hope/screens/about.dart';
import 'package:flutter_hope/screens/authentication/widgets/login.dart';
import 'package:flutter_hope/screens/authentication/widgets/registration.dart';
import 'package:flutter_hope/screens/home/home.dart';
import 'package:flutter_hope/screens/home/widgets/shopping_cart.dart';
import 'package:flutter_hope/screens/home/widgets/shopping_wishlist.dart';
import 'package:flutter_hope/screens/splash/splash.dart';
import 'package:flutter_hope/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'dart:io' show Platform;

import 'constants/controllers.dart';
import 'constants/firebase.dart';
import 'controllers/appController.dart';
import 'controllers/authController.dart';
import 'controllers/cart_controller.dart';
import 'controllers/menController.dart';
import 'controllers/product_controller.dart';
import 'controllers/womenController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
    Get.put(AppController());
    Get.put(UserController());
    Get.put(ProducsController());
    Get.put(MenController());
    Get.put(WomenController());
    Get.put(CartController());
    //Get.put(PaymentsController());
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        title: CustomText(
          text: "FireLab",
          size: 24,
          color: Colors.white,
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
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/hope-e1b50.appspot.com/o/waw.jpg?alt=media&token=2f1830f8-199d-4b96-8365-4a25817b6fc7"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.only(top: 125),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Les meilleures',
                          style: GoogleFonts.lato(
                              fontSize: 80,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Sneakers.',
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
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 35),
              child: Text(
                'Nos Best Sellers',
                style: GoogleFonts.lato(
                  fontSize: 45,
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
           ProductCaroussel(),
            SizedBox(
              height: 50,
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
                    child: Text('Qui sommes nous?',
                        style: GoogleFonts.lato(
                            fontSize: 45,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    width: 600,
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Text(
                          '''FireLab est une entreprise qui commercialise des sneakers de qualité parmi les plus grandes marques du monde de la mode. Nous nous engagons à vous offrir un excellent service et à répondre à toutes vos attentes.''',
                          style: GoogleFonts.ubuntu(
                              fontSize: 30, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: MediaQuery.of(context).size.height / 1.5,
                child: Qualites()),
            SizedBox(
              height: 30,
            ),
            Container(
                color: Colors.black,
                height: 55,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.copyright,
                            color: Colors.grey[50],
                          ),
                          Text(
                            'Contactez-nous au 773903709',
                            style: GoogleFonts.ubuntu(
                              color: Colors.grey[50],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Your fav sneaker supllier',
                        style: GoogleFonts.ubuntu(
                          color: Colors.grey[50],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.facebook,
                            color: Colors.grey[50],
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Icon(
                            EvaIcons.twitter,
                            color: Colors.grey[50],
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Icon(
                            EvaIcons.linkedin,
                            color: Colors.grey[50],
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Icon(
                            EvaIcons.email,
                            color: Colors.grey[50],
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
