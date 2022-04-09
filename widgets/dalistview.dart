import 'package:flutter/material.dart';
import 'package:flutter_hope/Classes/product.dart';
import 'package:google_fonts/google_fonts.dart';

class DalistView extends StatelessWidget {
  final ScrollController scrollController;
  final List<Product> daitems;

  const DalistView(
      {Key? key, required this.daitems, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: daitems.length,
        itemBuilder: (context, index) {
          return Container(
            height: 58,
            decoration: BoxDecoration(
              image: daitems[index].photo,
              borderRadius: BorderRadius.circular(20),
              //color: Colors.grey[800],
            ),
            margin: EdgeInsets.only(left: 10),
            width: 250,
            child: Column(
              children: [
                // Image.asset(
                //   produis[index].imageUrlb,
                //   width: 200,
                //   height: 160,
                // ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  daitems[index].name,
                  style: GoogleFonts.ubuntu(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${daitems[index].price}' + ' FCFA',
                  style: GoogleFonts.ubuntu(
                      fontSize: 20,
                      color: Colors.amber,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          );
        });
  }
}
