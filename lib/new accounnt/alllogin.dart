import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rentalhome/main.dart';

class Alllogin extends StatefulWidget {
  const Alllogin({super.key});

  @override
  State<Alllogin> createState() => _AllloginState();
}

class _AllloginState extends State<Alllogin> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child:const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: h / 3,
              width: w / 1.5,
              decoration:const BoxDecoration(
                  //color: Colors.amber,
                  image: DecorationImage(
                      image: AssetImage("asset/lottie/lottie-1.png"))),
            ),
          ),
          SizedBox(
            height: h / 20,
          ),
          Text(
            "Let's you in",
            style: GoogleFonts.getFont(font.value,
                letterSpacing: 2, fontSize: 35, fontWeight: FontWeight.bold),
          ),
        const  SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: h / 18,
              width: w,
              decoration: BoxDecoration(
                  border: Border.all(color:const Color.fromARGB(255, 206, 205, 205)),
                  //color: colors.value,
                  borderRadius:const BorderRadius.all(Radius.circular(15))),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                        "asset/animation/38870-google-logo-effect.json"),
                    Text(
                      "Continue with Google",
                      style: GoogleFonts.getFont(font.value,
                          fontSize: 15, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
        const  SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: h / 18,
              width: w,
              decoration: BoxDecoration(
                  border: Border.all(color:const Color.fromARGB(255, 206, 205, 205)),

                  //color: colors.value,
                  borderRadius:const BorderRadius.all(Radius.circular(15))),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset("asset/animation/fb.json"),
                    Text(
                      "Continue with Facebook",
                      style: GoogleFonts.getFont(font.value,
                          fontSize: 15, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
        const  SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              //color: Colors.black,
              height: 50,
              width: w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    //color: Colors.amber,
                    height: 30,
                    width: w / 2.5,
                    child:const Center(
                      child: Divider(
                        color: Color.fromARGB(255, 182, 182, 182),
                        thickness: 2,
                        indent: 10,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "or",
                      style: GoogleFonts.getFont(
                        'font',
                        fontSize: 21,
                      ),
                    ),
                  ),
                  SizedBox(
                    //color: Colors.amber,
                    height: 30,
                    width: w / 2.5,
                    child:const Divider(
                      color: Color.fromRGBO(182, 182, 182, 1),
                      thickness: 2,
                      endIndent: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/ account');
              },
              child: Container(
                height: h / 18,
                width: w - 40,
                decoration: BoxDecoration(
                    color: colors.value,
                    border:
                        Border.all(color:const Color.fromARGB(255, 206, 205, 205)),
                    //color: colors.value,
                    borderRadius:const BorderRadius.all(Radius.circular(50))),
                child: Center(
                  child: Text("Sign in with password",
                      style: GoogleFonts.getFont(font.value,
                          color: Colors.white, fontSize: 15)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: h / 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: GoogleFonts.getFont(font.value,
                    fontSize: 15, color: Colors.black),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/ account');
                },
                child: Text(
                  "Sign up",
                  style: GoogleFonts.getFont(font.value,
                      fontSize: 15,
                      color: colors.value,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
