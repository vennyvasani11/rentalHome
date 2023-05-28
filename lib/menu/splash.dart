import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:rentalhome/features.dart';

import '../main.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

Feathures f = Feathures();

class _SplashState extends State<Splash> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            SizedBox(
                //color: Colors.amber,
                height: h / 6,
                width: w / 2,
                child: const Image(
                    image: AssetImage("asset/images/ic_launcher.png"))),
            Text(
              "Rental Home",
              style: GoogleFonts.getFont(
                font.value,
                fontWeight: FontWeight.bold,
                color: colors.value,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: h / 50,
            ),
            Text(
              "Location, Community, Quality Living. It Starts Here!",
              style: GoogleFonts.getFont(
                font.value,
                fontSize: 12,
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/MyHomePage');
              },
              child: Container(
                height: h / 15,
                width: w / 1.5,
                decoration: BoxDecoration(
                    color: colors.value,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "Rental Home",
                    style: GoogleFonts.getFont(
                      font.value,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
