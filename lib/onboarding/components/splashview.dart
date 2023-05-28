import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rentalhome/main.dart';

class SplashView extends StatefulWidget {
  final AnimationController animationController;

  const SplashView({Key? key, required this.animationController})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    final introductionanimation =
        Tween<Offset>(begin:const Offset(0, 0), end:const Offset(0.0, -1.0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve:const Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return SlideTransition(
      position: introductionanimation,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: h / 15,
            ),
            SizedBox(
              height: h / 2,
              width: w,
              child: Lottie.asset("asset/animation/welcome.json"),
            ),
            SizedBox(
              height: h / 25,
            ),
            Center(
              child: Text(
                "Welcome to",
                style: GoogleFonts.getFont(font.value,
                    fontSize: 40,
                    color: colors.value,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Center(
              child: Text(
                "Rental House! 👋",
                style: GoogleFonts.getFont(font.value,
                    fontSize: 40,
                    color: colors.value,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: h / 25,
            ),
            Center(
              child: Text(
                "The best rental House application to complete ",
                style: GoogleFonts.getFont(font.value,
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w200),
              ),
            ),
            Center(
              child: Text(
                "your life and family",
                style: GoogleFonts.getFont(font.value,
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w200),
              ),
            ),
            SizedBox(
              height: h / 20,
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 16),
              child: InkWell(
                onTap: () {
                  widget.animationController.animateTo(0.2);
                },
                child: Container(
                  height: 58,
                  padding:const EdgeInsets.only(
                    left: 56.0,
                    right: 56.0,
                    top: 16,
                    bottom: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38.0),
                    color: colors.value,
                  ),
                  child: Text(
                    "Let's begin",
                    style: GoogleFonts.getFont(
                      font.value,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
