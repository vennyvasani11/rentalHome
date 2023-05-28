import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rentalhome/main.dart';
import 'package:rentalhome/onboarding/components/welcomeview.dart';
import 'package:rentalhome/sqflite/sqflitecontroller.dart';
import 'package:rentalhome/sqflite/sqflitetable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'new accounnt/login.dart';

class Feathures {
  DateTime today = DateTime.now();

  logout(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          title: Lottie.asset("asset/animation/off.json", height: 200),
          actionsAlignment: MainAxisAlignment.center,
          content: Text(
            'Are you sure logout?',
            style: GoogleFonts.getFont(font.value),
          ),
          actions: <Widget>[
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    final db = await initdatabase;
                    await db!.rawDelete(
                     "delete from login where loginid=${loginlist[0].loginid}");

                    GoogleService g = GoogleService();
                    SP!.remove("skip");
                    SP!.remove("photo");
                    SP!.remove("name");
                    SP!.remove("gmail");
                    i = 0.obs;
                    await g.signOutFromGoogle();
                    colors.value = const Color.fromARGB(255, 7, 135, 255);

                    Navigator.pushNamed(
                        context, '/IntroductionAnimationScreen');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colors.value),
                      height: u.height(context) / 20,
                      width: u.width(context) / 3,
                      child: Center(
                        child: Text(
                          "Confirm",
                          style: GoogleFonts.getFont(font.value, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.4)),
                      height: u.height(context) / 20,
                      width: u.width(context) / 3,
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.getFont(font.value, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  exit(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(35))),
          title: Container(
            //color: Colors.amber,
            child: Lottie.asset("asset/animation/closed.json",
                height: 150, alignment: Alignment.center),
          ),
          actionsAlignment: MainAxisAlignment.center,
          content: SizedBox(
            height: u.height(context) / 19,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Exit App',
                  style: GoogleFonts.getFont(font.value,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  'Do you want to really exit the app?',
                  style: GoogleFonts.getFont(
                    font.value,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.withOpacity(0.4)),
                      height: u.height(context) / 20,
                      width: u.width(context) / 3,
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.getFont(font.value, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    SystemNavigator.pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: colors.value),
                      height: u.height(context) / 20,
                      width: u.width(context) / 3,
                      child: Center(
                        child: Text(
                          "Confirm",
                          style: GoogleFonts.getFont(font.value, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  sucess(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40))),
          title: Center(
            child: Text(
              'Sucesssfully Login',
              style: GoogleFonts.getFont(font.value),
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          content: Lottie.asset("asset/animation/done.json", repeat: true),
        );
      },
    );
  }

  loading(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(500))),
          actionsAlignment: MainAxisAlignment.center,
          content: Lottie.asset("asset/animation/loading.json"),
        );
      },
    );
  }
}
