import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rentalhome/features.dart';
import 'package:rentalhome/main.dart';
import 'package:rentalhome/sqflite/sqflitecontroller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../onboarding/components/welcomeview.dart';

User? user;
GoogleService service = GoogleService();
Rx<int> i = 0.obs;
// ignore: non_constant_identifier_names

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

Feathures f = Feathures();

class _LoginState extends State<Login> {
  int load = 0;

  @override
  void initState() {
    super.initState();
    initSP();
  }

  String email = '';
  // ignore: non_constant_identifier_names
  String Password = '';
  initSP() async {
    SP = await SharedPreferences.getInstance();

    // how to get value of variable in shared_preferences
  }

  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Center(
            child: SizedBox(
              height: h / 3.7,
              width: w / 2,
              child: Lottie.asset("asset/animation/loginui.json"),
            ),
          ),
          Text("Login to Your Account",
              style: GoogleFonts.getFont(font.value,
                  fontSize: 30, fontWeight: FontWeight.w500)),
          SizedBox(
            height: h / 45,
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: TextFormField(
              controller: name,
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(
                  fontFamily: 'Poppins',
                  color: colors.value.withOpacity(0.5),
                ),

                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: colors.value,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: colors.value,
                  ),
                ),
                //fillColor: Colors.green
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: TextFormField(
              maxLength: 8,
              onChanged: (value) {
                setState(() {
                  Password = value;
                });
              },
              controller: password,
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(
                  fontFamily: 'Poppins',
                  color: colors.value.withOpacity(0.5),
                ),

                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: colors.value,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: colors.value,
                  ),
                ),
                //fillColor: Colors.green
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
          ),
          SizedBox(
            height: h / 100,
          ),
          InkWell(
            onTap: () {
              login();
              setState(() {
                load = 1;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: h / 18,
                width: w - 40,
                decoration: BoxDecoration(
                    color: colors.value,
                    border: Border.all(
                        color: const Color.fromARGB(255, 206, 205, 205)),
                    //color: colors.value,
                    borderRadius: const BorderRadius.all(Radius.circular(50))),
                child: Center(
                    child: load == 0
                        ? Text(
                            "Sign up",
                            style: GoogleFonts.getFont(font.value,
                                fontSize: 15, color: Colors.white),
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                            color: Colors.white,
                          ))),
              ),
            ),
          ),
          SizedBox(
            height: h / 55,
          ),
          // InkWell(
          //   onTap: () {
          //     Navigator.pushNamed(context, '/Forgetpassword');
          //   },
          //   child: Text("Forget the password ?",
          //       style: GoogleFonts.getFont(font.value,
          //           fontSize: 15, color: colors.value)),
          // ),
          SizedBox(
            height: h / 35,
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
                    width: w / 4,
                    child: const Center(
                      child: Divider(
                        color: Color.fromARGB(255, 182, 182, 182),
                        thickness: 2,
                        indent: 10,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "or continue with",
                      style: GoogleFonts.getFont(
                        font.value,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    //color: Colors.amber,
                    height: 30,
                    width: w / 4,
                    child: const Divider(
                      color: Color.fromRGBO(182, 182, 182, 1),
                      thickness: 2,
                      endIndent: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: h / 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  GoogleService g = GoogleService();
                  await g.googlelogin();

                  // ignore: use_build_context_synchronously
                  Navigator.pushNamed(context, '/verifymobile');
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 210, 210, 210)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Lottie.asset(
                      "asset/animation/38870-google-logo-effect.json"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: h / 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already haven't an account? ",
                style: GoogleFonts.getFont(font.value,
                    fontSize: 15, color: Colors.grey),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/newaccount');
                },
                child: Text(
                  "Sign in",
                  style: GoogleFonts.getFont(font.value,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: colors.value),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }

  login() async {
    await logindata(email);
    setState(() {
      load = 0;
    });

    try {
      if (loginlist[0].loginemail == email &&
          loginlist[0].loginpassword == Password) {
        SP!.setBool("skip", true);

        SP!.setString("gmail", email);

        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, '/MyHomePage');
      } else {
        u.snackbar("Wrong Input", "Invalid Data");
      }
    } catch (e) {
      u.snackbar("Wrong Input", "Invalid Data");
    }
  }
}
