import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentalhome/features.dart';
import 'package:rentalhome/main.dart';
import 'package:rentalhome/sqflite/sqflitecontroller.dart';

import '../sqflite/sqflitetable.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

TextEditingController name = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController mobile = TextEditingController();
TextEditingController password = TextEditingController();

Rx<int> images = 0.obs;
Feathures f = Feathures();
ImagePicker pick = ImagePicker();
XFile? profileimage;

class _EditprofileState extends State<Editprofile> {
  @override
  void initState() {
    login();
    super.initState();
  }

  int load = 0;
  login() async {
    await logindata(SP!.get("gmail").toString());

    setState(() {
      load = 1;
    });
  }

  String photo = loginlist[0].loginphoto;

  // ignore: non_constant_identifier_names
  String Name1 = "";
  // ignore: non_constant_identifier_names
  String Password1 = "";
  String photo1 = "";

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    String Name = loginlist[0].loginname;
    // ignore: non_constant_identifier_names
    String Email = loginlist[0].loginemail;
    // ignore: non_constant_identifier_names
    String Mobile = loginlist[0].loginmobile;
    // ignore: non_constant_identifier_names
    String Password = loginlist[0].loginpassword;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: themeNotifier.value == ThemeMode.light
                ? Colors.black
                : Colors.white,
          ),
        ),
        title: Text("Edit Profile",
            style: GoogleFonts.getFont(
              font.value,
              color: themeNotifier.value == ThemeMode.light
                  ? Colors.black
                  : Colors.white,
              fontSize: 20,
            )),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: load == 0
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: h / 25,
                      ),
                      Center(
                        child: Stack(
                          children: [
                            const CircleAvatar(
                              radius: 80,
                              backgroundColor: Colors.black,
                            ),
                            SP!.get("photo") == null
                                ? const Positioned(
                                    right: 1,
                                    bottom: 1,
                                    child: CircleAvatar(
                                      radius: 79,
                                      backgroundImage:
                                          AssetImage('asset/images/person.png'),
                                    ),
                                  )
                                : Positioned(
                                    right: 1,
                                    bottom: 1,
                                    child: CircleAvatar(
                                      radius: 79,
                                      child: Container(
                                        height: h / 5,
                                        width: w / 2.5,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(79),
                                            image: DecorationImage(
                                                image: NetworkImage(photo),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                  ),
                            // Positioned(
                            //     right: 9,
                            //     bottom: 1,
                            //     child: CircleAvatar(
                            //       radius: 16,
                            //       backgroundColor: Colors.black,
                            //       child: InkWell(
                            //         onTap: () async {
                            //           profileimage = await pick.pickImage(
                            //               source: ImageSource.gallery);
                            //           setState(() {
                            //             images = 1.obs;
                            //             photo = profileimage!.path;
                            //           });
                            //         },
                            //         child: CircleAvatar(
                            //             radius: 15,
                            //             backgroundColor: Colors.white,
                            //             child: Icon(
                            //               CupertinoIcons.pencil,
                            //               color: Colors.black,
                            //             )),
                            //       ),
                            //     ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h / 25,
                      ),
                      Text(
                        "Personal Information",
                        style: GoogleFonts.getFont(font.value,
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: h / 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          initialValue: Name,
                          onChanged: (value) {
                            setState(() {
                              Name1 = value;
                            });
                          },
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            labelText: " Full Name ",
                            labelStyle: GoogleFonts.getFont(
                              font.value,
                              color: colors.value,
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
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          enabled: false,
                          initialValue: Email,
                          decoration: InputDecoration(
                            labelText: " Email",
                            labelStyle: GoogleFonts.getFont(
                              font.value,
                              color: colors.value.withOpacity(0.5),
                            ),
                            fillColor: Colors.white,
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 225, 225, 225),
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          initialValue: Mobile,
                          enabled: false,
                          decoration: InputDecoration(
                            labelText: " Mobile Number ",
                            labelStyle: GoogleFonts.getFont(
                              font.value,
                              color: colors.value.withOpacity(0.5),
                            ),
                            fillColor: Colors.white,
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 220, 220, 220),
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          maxLength: 8,
                          initialValue: Password,
                          onChanged: (value) {
                            setState(() {
                              Password1 = value;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: GoogleFonts.getFont(
                              font.value,
                              color: colors.value,
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
                        height: h / 20,
                      ),
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
                                height: h / 20,
                                width: w / 2.5,
                                child: const Center(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                homeupdate();
                                Navigator.pushNamed(context, '/MyHomePage');
                              },
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: colors.value),
                                      height: h / 20,
                                      width: w / 2.5,
                                      child: const Center(
                                          child: Text(
                                        'Confirm',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )))))
                        ],
                      ),
                      SizedBox(
                        height: h / 9,
                      ),
                    ],
                  ),
                )),
        ),
      ),
    );
  }

  homeupdate() async {
    final db = await initdatabase;

    await db!.rawUpdate(
        "update login set loginname='${Name1.toString()}', loginpassword='${Password1.toString()}', loginphoto='${photo.toString()}' where loginemail='${SP!.get("gmail").toString()}'");
    u.snackbar("Rent Home Profile", "Profile SuccessFully Updated");
  }
}
