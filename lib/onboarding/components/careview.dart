import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentalhome/main.dart';

class CareView extends StatelessWidget {
  final AnimationController animationController;

  const CareView({Key? key, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstHalfAnimation =
        Tween<Offset>(begin: const Offset(1, 0), end:const Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.2,
        0.4,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final secondHalfAnimation =
        Tween<Offset>(begin:const Offset(0, 0), end:const Offset(-1, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve:const Interval(
        0.4,
        0.6,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    final imageFirstHalfAnimation =
        Tween<Offset>(begin:const Offset(4, 0), end:const Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve:const Interval(
        0.2,
        0.4,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final imageSecondHalfAnimation =
        Tween<Offset>(begin:const Offset(0, 0), end:const Offset(-4, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve:const Interval(
        0.4,
        0.6,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return SlideTransition(
      position: firstHalfAnimation,
      child: SlideTransition(
        position: secondHalfAnimation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: imageFirstHalfAnimation,
                child: SlideTransition(
                  position: imageSecondHalfAnimation,
                  child: Container(
                    height: h / 2.5,
                    width: w / 1.5,
                    decoration:const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 151, 148, 148),
                            blurRadius: 20.0,
                          ),
                        ],
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("asset/images/on2.jpeg")),
                        // color: Colors.amber,
                        borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(200),
                          topRight: Radius.circular(200),
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  "Book a rental House quickly and easily with one click",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont(font.value,
                      fontSize: 35,
                      color: colors.value,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
