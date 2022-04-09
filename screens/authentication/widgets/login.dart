import 'package:flutter/material.dart';
import 'package:flutter_hope/constants/controllers.dart';
import 'package:flutter_hope/screens/authentication/widgets/registration.dart';
import 'package:flutter_hope/widgets/custom_btn.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Text(
              "FireLab",
              style:
                  GoogleFonts.lato(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              "Authenticity Only.",
              style: GoogleFonts.lato(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            ),
            SizedBox(height: 15),
            Text(
              "Se connecter",
              style: GoogleFonts.lato(
                fontSize: 30,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey.withOpacity(.3),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: TextField(
                      controller: userController.email,
                      decoration: InputDecoration(
                          icon: Icon(Icons.email_outlined),
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintText: "Email"),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey.withOpacity(.3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      child: TextField(
                        controller: userController.password,
                        decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            hintText: "Mot de passe"),
                      ),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: CustomButton(
                  text: "Se connecter",
                  onTap: () {
                    userController.signIn();
                  }),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationWidget()),
                );
              },
              child: Text(
                'Nouveau? Créez un compte',
                style: GoogleFonts.lato(fontSize: 35),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
