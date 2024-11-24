import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentalhome/features.dart';
import 'package:rentalhome/utility.dart';
import 'main.dart';

class Renthome {
  Utility u = Utility();
  Feathures f = Feathures();

  menu(BuildContext context, String name, String number, String photo) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        primary: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Center(
              child: CircleAvatar(
                backgroundColor: colors.value,
                radius: 52,
                child: SP!.get("photo") == null
                    ? const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: Image(
                          image: AssetImage('asset/images/person.png'),
                        ),
                      )
                    : Container(
                        height: h / 5,
                        width: w / 2.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(79),
                            image: DecorationImage(
                                image: NetworkImage(photo), fit: BoxFit.cover)),
                      ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 70,
            ),
            Center(
              child: Text(
                SP!.get("skip") == true ? name : "Guest",
                style: GoogleFonts.getFont(font.value,
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 55,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Text(
                      "Manage Profile",
                      style: GoogleFonts.getFont(font.value,
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 15,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 14,
                        child: Icon(
                          CupertinoIcons.pencil,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ListTile(
                title: Text(
                  name,
                  style: GoogleFonts.getFont(font.value, fontSize: 16),
                ),
                subtitle: Text(
                  "Full Name",
                  style: GoogleFonts.getFont(font.value, fontSize: 12),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ListTile(
                title: Text(
                  SP!.get("skip") == true ? SP!.get("gmail").toString() : "Guest",
                  style: GoogleFonts.getFont(font.value, fontSize: 16),
                ),
                subtitle: Text(
                  "Email",
                  style: GoogleFonts.getFont(font.value, fontSize: 12),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ListTile(
                title: Text(
                  number,
                  style: GoogleFonts.getFont(font.value, fontSize: 16),
                ),
                subtitle: Text(
                  "Mobile Number",
                  style: GoogleFonts.getFont(font.value, fontSize: 12),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Home Details",
                style: GoogleFonts.getFont(font.value,
                    fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/mybooking');
                ZoomDrawer.of(context)!.close();
              },
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  CupertinoIcons.book,
                  color: colors.value,
                ),
              ),
              subtitle: Text(
                "Tap to View",
                style: GoogleFonts.getFont(font.value, fontSize: 11),
              ),
              title: Text(
                "My Booking",
                style: GoogleFonts.getFont(font.value, fontSize: 12),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: colors.value,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/Addhome');
              },
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  CupertinoIcons.home,
                  color: colors.value,
                ),
              ),
              title: Text(
                "Add Home",
                style: GoogleFonts.getFont(font.value, fontSize: 12),
              ),
              subtitle: Text(
                "Tap to Add",
                style: GoogleFonts.getFont(font.value, fontSize: 11),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: colors.value,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/myhome');
                ZoomDrawer.of(context)!.close();
              },
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.home_work_outlined,
                  color: colors.value,
                ),
              ),
              subtitle: Text(
                "Tap to view",
                style: GoogleFonts.getFont(font.value, fontSize: 11),
              ),
              title: Text(
                "My home",
                style: GoogleFonts.getFont(font.value, fontSize: 12),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: colors.value,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Setting",
                style: GoogleFonts.getFont(font.value, fontSize: 12),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/notifications');
                ZoomDrawer.of(context)!.close();
              },
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  CupertinoIcons.bell,
                  color: colors.value,
                ),
              ),
              subtitle: Text(
                "Tap to Notification",
                style: GoogleFonts.getFont(font.value, fontSize: 11),
              ),
              title: Text(
                "Notification",
                style: GoogleFonts.getFont(font.value, fontSize: 12),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: colors.value,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/theme');
      
                // f.theme(context);
                ZoomDrawer.of(context)!.close();
              },
              subtitle: Text(
                "Tap to Change",
                style: GoogleFonts.getFont(font.value, fontSize: 11),
              ),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  CupertinoIcons.color_filter,
                  color: colors.value,
                ),
              ),
              title: Text(
                "Theme",
                style: GoogleFonts.getFont(font.value, fontSize: 12),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: colors.value,
              ),
            ),
            // ListTile(
            //   onTap: () {
            //     Navigator.pushNamed(context, '/table');
            //   },
            //   leading: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Icon(
            //       Icons.security_outlined,
            //       color: colors.value,
            //     ),
            //   ),
            //   subtitle: Text(
            //     "Tap to Change",
            //     style: GoogleFonts.getFont(font.value, fontSize: 11),
            //   ),
            //   title: Text(
            //     "Security",
            //     style: GoogleFonts.getFont(font.value, fontSize: 12),
            //   ),
            //   trailing: Icon(
            //     Icons.arrow_forward_ios,
            //     color: colors.value,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Manage Account",
                style: GoogleFonts.getFont(font.value, fontSize: 12),
              ),
            ),
            ListTile(
              onTap: () {
                f.logout(context);
              },
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.logout_outlined,
                  color: colors.value,
                ),
              ),
              subtitle: Text(
                "Safe Log out",
                style: GoogleFonts.getFont(font.value, fontSize: 11),
              ),
              title: Text(
                " Log out",
                style: GoogleFonts.getFont(font.value, fontSize: 12),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: colors.value,
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}

plusimage(context, String name) {
  double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;
  return Container(
      height: h / 2.5,
      width: w / 1.1,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 230, 230, 230),
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "➕",
            style: TextStyle(color: Color.fromARGB(255, 211, 209, 209)),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(name,
              style: GoogleFonts.getFont(font.value,
                  color: const Color.fromARGB(255, 82, 82, 82))),
        ],
      ));
}

image(context, String path) {
  double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;
  return Container(
    height: h / 2.5,
    width: w / 1.1,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        color: const Color.fromARGB(255, 230, 230, 230),
        borderRadius: const BorderRadius.all(Radius.circular(25))),
    child: ClipRRect(
      //clipper: ClipPath.shape(shape: ShapeBorderClipper(shape: shape)),
      borderRadius: BorderRadius.circular(25),
      child: Image.file(
        File(path),
        fit: BoxFit.cover,
        isAntiAlias: true,
      ),
    ),
  );
}
