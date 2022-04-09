import 'package:flutter/material.dart';
import 'package:flutter_hope/Classes/aprop.dart';
import 'package:google_fonts/google_fonts.dart';

class Qualites extends StatefulWidget {
  const Qualites({Key? key}) : super(key: key);

  @override
  State<Qualites> createState() => _QualitesState();
}

class _QualitesState extends State<Qualites> {
  List<Aprop> lesquali = [
    Aprop(
        name: 'Produits de Qualité.',
        desc:
            'Nos produits de haute qualité sont tous manufacturés et vendus à des prix compétitifs',
        icon: Icon(
          Icons.check_circle_outline_outlined,
          color: Colors.amber,
          size: 100,
        )),
    Aprop(
        name: 'Livraison Rapide.',
        desc:
            'La livraison sous 24h est valable sur tous nos produits. Vous avez également la possiblité de venir récupérer vos produits directement en boutique.',
        icon: Icon(
          Icons.local_shipping_rounded,
          color: Colors.amber,
          size: 100,
        )),
    Aprop(
        name: 'Support 24/7',
        desc:
            'Nous sommes ouverts à toutes questions et vous pouvez contacter à tout moment pour avoir des renseignements.',
        icon: Icon(
          Icons.support_agent,
          color: Colors.amber,
          size: 100,
        ))
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          child: Column(
            children: [
              lesquali[0].icon,
              SizedBox(
                height: 20,
              ),
              Container(
                  child: Text(
                '${lesquali[0].name}',
                style: GoogleFonts.lato(
                    color: Colors.amber,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: 10,
                width: 40,
              ),
              Container(
                  width: 300,
                  child: Text(
                    '${lesquali[0].desc}',
                    style: GoogleFonts.ubuntu(fontSize: 24),
                  )),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              lesquali[1].icon,
              SizedBox(
                height: 20,
              ),
              Container(
                  child: Text(
                '${lesquali[1].name}',
                style: GoogleFonts.lato(
                    color: Colors.amber,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: 10,
                width: 40,
              ),
              Container(
                  width: 300,
                  child: Text(
                    '${lesquali[1].desc}',
                    style: GoogleFonts.ubuntu(fontSize: 24),
                  )),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              lesquali[2].icon,
              SizedBox(
                height: 20,
              ),
              Container(
                  child: Text(
                '${lesquali[2].name}',
                style: GoogleFonts.lato(
                    color: Colors.amber,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: 10,
                width: 40,
              ),
              Container(
                  width: 300,
                  child: Text(
                    '${lesquali[2].desc}',
                    style: GoogleFonts.ubuntu(fontSize: 24),
                  )),
            ],
          ),
        ),
      ]),
    );
    //
    // ListView.builder(
    //     itemCount: lesquali.length,
    //     scrollDirection: Axis.horizontal,
    //     itemBuilder: (BuildContext context, int index) {
    //       Aprop prop = lesquali[index];
    //       return Container(
    //         padding: EdgeInsets.only(left: 150),
    //         child: Column(
    //           children: [
    //             prop.icon,
    //             SizedBox(
    //               height: 20,
    //             ),
    //             Container(height: 20, child: Text('${prop.name}')),
    //             SizedBox(
    //               height: 10,
    //               width: 40,
    //             ),
    //             Container(width: 100, child: Text('${prop.desc}')),
    //           ],
    //         ),
    //       );
    //     });
  }
}
