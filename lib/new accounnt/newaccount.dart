import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rentalhome/features.dart';
import 'package:rentalhome/main.dart';
import 'package:rentalhome/new%20accounnt/otp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../onboarding/components/welcomeview.dart';
import '../sqflite/sqflitetable.dart';

// ignore: non_constant_identifier_names
SharedPreferences? SP;

class Newaccount extends StatefulWidget {
  const Newaccount({super.key});

  @override
  State<Newaccount> createState() => _NewaccountState();
}

int otpbtn = 0;
String vc = "";
TextEditingController name = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController gmail = TextEditingController();

TextEditingController mobilenumber = TextEditingController();

class _NewaccountState extends State<Newaccount> {
  @override
  @override
  void initState() {
    super.initState();
    initSP();
  }

  Feathures f = Feathures();

  initSP() async {
    SP = await SharedPreferences.getInstance();
    // how to get value of variable in shared_preferences
  }

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
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: Container(
                height: h / 6,
                width: w / 2,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("asset/lottie/signup.png"))),
              ),
            ),
            const Spacer(),
            Text("Create New Account",
                style: GoogleFonts.getFont(font.value,
                    fontSize: 35, fontWeight: FontWeight.w500)),
            const Spacer(),
            const SizedBox(
              height: 10,
            ),
            textfield(name, "Full Name"),
            const SizedBox(
              height: 10,
            ),
            textfield(gmail, "Email"),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(.50),
              child: TextFormField(
                // validator: (password) {
                //   RegExp regex = RegExp(
                //       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                //   var passNonNullValue = password ?? "";
                //   if (passNonNullValue.isEmpty) {
                //     return ("Password is required");
                //   } else if (passNonNullValue.length < 8) {
                //     return ("Password Must be more than 7 characters");
                //   } else if (!regex.hasMatch(passNonNullValue)) {
                //     return ("Password should contain upper,lower,digit and Special character ");
                //   }
                //   return null;
                // },
                maxLength: 8,
                obscureText: true,
                obscuringCharacter: "*",
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
            Padding(
              padding: const EdgeInsets.all(.50),
              child: TextFormField(
                maxLength: 10,
                controller: mobilenumber,
                decoration: InputDecoration(
                  labelText: "Mobile Number",
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
                keyboardType: TextInputType.phone,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () async {
                  logininsert();

                  sendotp();
                  otpbtn == 0
                      ? f.loading(context)
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Otp(
                                    vc: vc,
                                    number: mobilenumber.text,
                                  )));
                },
                child: Container(
                  height: h / 18,
                  width: w - 40,
                  decoration: BoxDecoration(
                      color: colors.value,
                      border: Border.all(
                          color: const Color.fromARGB(255, 206, 205, 205)),
                      //color: colors.value,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50))),
                  child: Center(
                    child: Text(
                      "Sign up",
                      style: GoogleFonts.getFont(font.value,
                          fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
              ),
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
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: GoogleFonts.getFont(font.value,
                      fontSize: 15, color: Colors.grey),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/Login');
                  },
                  child: Text(
                    "Login",
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
      ),
    );
  }

  Future sendotp() async {
    await auth!.verifyPhoneNumber(
      phoneNumber: '+91 ${mobilenumber.text}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth!.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Invalid Mobile Number"),
            ),
          );
        }
        // Handle other errors
      },
      codeSent: (String verificationId, int? resendToken) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("OTP successfully sent"),
          ),
        );
        setState(() {
          otpbtn = 1;
          vc = verificationId;
          mobilenumber.clear();
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Otp(
                      vc: vc,
                      number: mobilenumber.text,
                    )));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // resend otp live
      },
      timeout: const Duration(seconds: 60),
    );
  }

  textfield(TextEditingController controller, String hint) {
    return Padding(
      padding: const EdgeInsets.all(.50),
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        controller: controller,
        decoration: InputDecoration(
          labelText: hint,
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
        keyboardType: TextInputType.name,
      ),
    );
  }

  logininsert() async {
    final db = await initdatabase;
    await db!.rawInsert(
        "insert into login(loginname, loginmobile, loginpassword, loginemail, loginphoto) values('${name.text}','${mobilenumber.text}','${password.text}','${gmail.text}','${"-"}')");
    name.text = "";
    password.text = "";
    SP!.setBool("skip", true);
    SP!.setString("gmail", gmail.text);
  }
}
