import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rentalhome/features.dart';
import 'package:rentalhome/new%20accounnt/forgetotp.dart';

import '../main.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

Feathures f = Feathures();

class _ForgetpasswordState extends State<Forgetpassword> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Your forget Password ",
            style: GoogleFonts.getFont(font.value,
                fontSize: 20, color: Colors.black)),
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
        child: Column(
          children: [
            SizedBox(
              height: h / 25,
            ),
            Center(
              child: SizedBox(
                height: h / 4,
                width: w / 2,
                child: Lottie.asset("asset/animation/forgetpassword.json"),
              ),
            ),
            SizedBox(
              height: h / 25,
            ),
            Text(
                "Select which contact details shoul we use to your Mobile Number ",
                style: GoogleFonts.getFont(font.value,
                    fontSize: 18, color: Colors.black)),
            SizedBox(
              height: h / 25,
            ),
            Container(
              height: h / 8,
              width: w / 1.2,
              decoration: BoxDecoration(
                  border: Border.all(color: colors.value, width: 2),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 207, 222, 248),
                      radius: 40,
                      child: Icon(
                        Icons.message,
                        color: colors.value,
                      )),
                  title: Text("+91 9157834380",
                      style: GoogleFonts.getFont(font.value,
                          fontSize: 15, color: Colors.black)),
                  horizontalTitleGap: 10,
                ),
              ),
            ),
            SizedBox(
              height: h / 6,
            ),
            InkWell(
              onTap: () {
                sendotp();
                otpbtn == 0
                    ? f.loading(context)
                    : Navigator.pushNamed(context, '/forgetotp');
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
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50))),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: GoogleFonts.getFont(font.value,
                          fontSize: 15, color: Colors.white),
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

  int otpbtn = 0;
  String vc = "";
  Future sendotp() async {
    await auth!.verifyPhoneNumber(
      phoneNumber: '+91 9157834380',
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
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Forgetotp(
                      vc: vc,
                      number: "9157834380",
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
}
