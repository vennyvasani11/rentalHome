// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rentalhome/category/myhomepage.dart';
import 'package:rentalhome/main.dart';

class Otp extends StatefulWidget {
  final String vc;
  final String number;
  const Otp({required this.vc, required this.number, super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  String vc = "";
  final formKey = GlobalKey<FormState>();
  Rx<int> load = 0.obs;
  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Code Verification",
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
      body: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: h,
          width: w,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: h / 3,
                child: Lottie.asset("asset/animation/otp.json"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Phone Number Verification',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      font.value,
                      fontSize: 20,
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                child: RichText(
                  text: TextSpan(
                      text: "Enter the code sent to ",
                      children: [
                        TextSpan(
                            text: widget.number.toString(),
                            style: GoogleFonts.getFont(
                              font.value,
                            )),
                      ],
                      style:
                          GoogleFonts.getFont(font.value, color: Colors.grey)),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      obscureText: true,
                      obscuringCharacter: '*',
                      obscuringWidget: const CircleAvatar(
                        radius: 15,
                        backgroundImage:
                            AssetImage("asset/images/ic_launcher.png"),
                      ),
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 3) {
                          return "I'm from validator";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeColor: colors.value,
                          inactiveColor: Colors.grey,
                          inactiveFillColor: Colors.white,
                          activeFillColor: Colors.white,
                          selectedFillColor: colors.value),
                      cursorColor: Colors.white,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        debugPrint("Completed");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        debugPrint(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                    hasError ? "*Please fill up all the cells properly" : "",
                    style: GoogleFonts.getFont(font.value, color: Colors.red)),
              ),
              const SizedBox(
                height: 14,
              ),
              Obx(() {
                return Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: colors.value,
                            offset: const Offset(1, -2),
                            blurRadius: 5),
                        BoxShadow(
                            color: colors.value,
                            offset: const Offset(-1, 2),
                            blurRadius: 5)
                      ]),
                  child: ButtonTheme(
                      height: 50,
                      child: TextButton(
                          onPressed: () async {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.focusedChild!.unfocus();
                            }

                            if (currentText == "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Invalid OTP"),
                                ),
                              );
                            } else {
                              String smsCode = currentText;
                              PhoneAuthCredential credential =
                                  PhoneAuthProvider.credential(
                                      verificationId: widget.vc,
                                      smsCode: smsCode);
                              await auth!.signInWithCredential(credential);
                            }
                            u.snackbar("Account Created",
                                "Account SucessFully Created");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Mypage()));
                          },
                          child: Text(
                            "Verify & Go",
                            style: GoogleFonts.getFont(font.value,
                                color: Colors.white),
                          ))),
                );
              }),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
