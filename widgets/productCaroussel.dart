import 'package:flutter/material.dart';
import 'package:flutter_hope/Pages/productPage.dart';
import 'package:flutter_hope/screens/home/home.dart';
import 'package:flutter_hope/widgets/dalistview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_hope/Classes/product.dart';

class ProductCaroussel extends StatefulWidget {
  const ProductCaroussel({Key? key}) : super(key: key);

  @override
  _ProductCarousselState createState() => _ProductCarousselState();
}

class _ProductCarousselState extends State<ProductCaroussel> {
  ScrollController _scrollController = ScrollController();
  List<Product> productHome = [
    Product(
        name: 'Converse Chuck',
        price: 15000,
        photo: DecorationImage(
            image: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/hope-e1b50.appspot.com/o/conversechuck.png?alt=media&token=7bede44a-e306-44a9-8593-128ecf287cb8'),
            fit: BoxFit.fill)),
    Product(
        name: 'Nike Air Max',
        price: 30000,
        photo: DecorationImage(
            image: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/hope-e1b50.appspot.com/o/airmax.png?alt=media&token=f776f5ea-a7a1-4bbb-83ab-0d3da3f6698d'),
            fit: BoxFit.fill)),
    Product(
        name: 'Nike Air Jordan',
        price: 40000,
        photo: DecorationImage(
            image: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/hope-e1b50.appspot.com/o/nike.png?alt=media&token=ed445266-def1-4312-ba74-9fa553a32e1f'),
            fit: BoxFit.fill)),
    Product(
        name: 'Nike ACG',
        price: 25000,
        photo: DecorationImage(
            image: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/hope-e1b50.appspot.com/o/acg.png?alt=media&token=487c6808-2539-480f-b3f6-2aa4f88b1ad8'),
            fit: BoxFit.fill)),
    Product(
        name: "Adidas Astir",
        price: 15000,
        photo: DecorationImage(
            image: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/hope-e1b50.appspot.com/o/womensastir.png?alt=media&token=8f922405-5350-4d5a-8727-e1133b990d2e'),
            fit: BoxFit.fill)),
    Product(
        name: 'Nike Air Huarache',
        price: 15000,
        photo: DecorationImage(
            image: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/hope-e1b50.appspot.com/o/huarache.png?alt=media&token=b50b20a0-ecbb-45a8-b06b-22d15934f722'),
            fit: BoxFit.fill)),
  ];
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      double minScrollExtent1 = _scrollController.position.minScrollExtent;
      double maxScrollExtent1 = _scrollController.position.maxScrollExtent;

      animateToMaxMin(maxScrollExtent1, minScrollExtent1, maxScrollExtent1, 10,
          _scrollController);
    });
  }

  animateToMaxMin(double max, double min, double direction, int seconds,
      ScrollController scrollController) {
    scrollController
        .animateTo(direction,
            duration: Duration(seconds: seconds), curve: Curves.linear)
        .then((value) {
      direction = direction == max ? min : max;
      animateToMaxMin(max, min, direction, seconds, scrollController);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.9,
      child: DalistView(
        scrollController: _scrollController,
        daitems: productHome,
      ),
    );
    // Column(
    //   children: [
    //     Container(
    //       height: MediaQuery.of(context).size.height / 1.2,
    //       child: Center(
    //         child: GridView.builder(
    //           shrinkWrap: true,
    //           itemCount: productHome.length,
    //           scrollDirection: Axis.horizontal,
    //           itemBuilder: (BuildContext context, int index) {
    //             Product produit = productHome[index];

    //             return GestureDetector(
    //               onTap: () {
    //                 Navigator.push(context,
    //                     MaterialPageRoute(builder: (_) => HomeScreen()));
    //               },
    //               child: Container(
    //                 height: 58,
    //                 decoration: BoxDecoration(
    //                   image: produit.photo,
    //                   borderRadius: BorderRadius.circular(20),
    //                   //color: Colors.grey[800],
    //                 ),
    //                 margin: EdgeInsets.only(left: 10),
    //                 width: 250,
    //                 child: Column(
    //                   children: [
    //                     // Image.asset(
    //                     //   produis[index].imageUrlb,
    //                     //   width: 200,
    //                     //   height: 160,
    //                     // ),
    //                     SizedBox(
    //                       height: 10,
    //                     ),
    //                     Text(
    //                       productHome[index].name,
    //                       style: GoogleFonts.ubuntu(
    //                           fontSize: 19,
    //                           color: Colors.black,
    //                           fontWeight: FontWeight.w700),
    //                     ),
    //                     SizedBox(
    //                       height: 10,
    //                     ),
    //                     Text(
    //                       '${productHome[index].price}' + ' FCFA',
    //                       style: GoogleFonts.ubuntu(
    //                           fontSize: 20,
    //                           color: Colors.amber,
    //                           fontWeight: FontWeight.w700),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             );
    //           },
    //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //             crossAxisCount: 2,
    //             crossAxisSpacing: 10.0,
    //             mainAxisSpacing: 10.0,
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
