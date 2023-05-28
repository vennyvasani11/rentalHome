import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rentalhome/main.dart';

class Newpassword extends StatefulWidget {
  const Newpassword({super.key});

  @override
  State<Newpassword> createState() => _NewpasswordState();
}

TextEditingController password1 = TextEditingController();
TextEditingController password2 = TextEditingController();

class _NewpasswordState extends State<Newpassword> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Create New Password ",
            style: GoogleFonts.getFont(font.value,
                fontSize: 20, color: Colors.black)),
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
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: h / 4,
                width: w / 2,
                child: Lottie.asset("asset/animation/newpassword.json"),
              ),
            ),
            SizedBox(
              height: h / 40,
            ),
            Text(
              "Create Your New Password",
              style: GoogleFonts.getFont(font.value, fontSize: 20),
            ),
            SizedBox(
              height: h / 25,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                maxLength: 8,
                controller: password1,
                decoration: InputDecoration(
                  labelText: "Enter New Password",
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
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                maxLength: 8,
                controller: password2,
                decoration: InputDecoration(
                  labelText: "Re-Enter Confirm Password",
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
            ),
            SizedBox(
              height: h / 15,
            ),
            InkWell(
              onTap: () {
                d();
                //Navigator.pushNamed(context, '/newpassword');
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

  d() {
    return Dialog(
      backgroundColor: Colors.white,
      child: Column(
        children: [Lottie.asset("asset/animation/done.json")],
      ),
    );
  }
}
