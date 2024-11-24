import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentalhome/home.dart';
import 'package:rentalhome/sqflite/sqflitetable.dart';
import 'package:rentalhome/utility.dart';
import '../main.dart';
import 'package:path/path.dart';

class Addhome extends StatefulWidget {
  const Addhome({super.key});

  @override
  State<Addhome> createState() => _AddhomeState();
}

DateTime d = DateTime.now();
List<String> listnumber = ['1', "2", "3", "4", "5"];
List<String> listcategory = [
  "House",
  "Villa",
  "2BHK",
  "3BHK",
];

class _AddhomeState extends State<Addhome> {
  ImagePicker image1 = ImagePicker();
  XFile? imagefile1;
  int loadimage1 = 0;
  ImagePicker image2 = ImagePicker();
  XFile? imagefile2;
  int loadimage2 = 0;

  ImagePicker image3 = ImagePicker();
  XFile? imagefile3;
  int loadimage3 = 0;

  ImagePicker image4 = ImagePicker();
  XFile? imagefile4;
  int loadimage4 = 0;

  ImagePicker image5 = ImagePicker();
  XFile? imagefile5;
  int loadimage5 = 0;
  Utility u = Utility();
  Allpermission all = Allpermission();

  TextEditingController apartment = TextEditingController();
  TextEditingController block = TextEditingController();
  TextEditingController homeaddress = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController sqft = TextEditingController();
  TextEditingController ownername = TextEditingController();
  TextEditingController contactnumber = TextEditingController();
  TextEditingController description = TextEditingController();
  @override
  void initState() {
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;

    super.initState();
    all.permission();
  }

  int load = 0;
  String hall = listnumber.first;
  String kitchen = listnumber.first;
  String balcony = listnumber.first;
  String beds = listnumber.first;
  String bath = listnumber.first;
  String category = listcategory.first;

  Future uploadFile() async {
    if (imagefile1 == null) return;
    final fileName = basename(imagefile1!.path);
    final destination = 'files/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(File(imagefile1?.path ?? ''));
    } catch (e) {
      print('error occured');
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Rent Home",
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
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: h / 2.1,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: InkWell(
                        onTap: () async {
                          imagefile1 = await image1.pickImage(
                            imageQuality: 100,
                            source: ImageSource.gallery,
                          );
                          if (imagefile1 == null) {
                            u.snackbar("", "Not Selected Photos");
                          } else {
                            setState(() {
                              loadimage1 = 1;
                            });
                            uploadFile();
                          }
                        },
                        child: loadimage1 == 0
                            ? plusimage(context, "Image 1")
                            : Column(
                                children: [
                                  image(context, imagefile1!.path),
                                  const Spacer(),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          loadimage1 = 0;
                                        });
                                      },
                                      child: const Icon(
                                          CupertinoIcons.clear_circled))
                                ],
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: InkWell(
                        onTap: () async {
                          imagefile2 = await image2.pickImage(
                            source: ImageSource.gallery,
                          );
                          if (imagefile2 == null) {
                            u.snackbar("", "Not Selected Photos");
                          } else {
                            setState(() {
                              loadimage2 = 1;
                            });
                          }
                        },
                        child: loadimage2 == 0
                            ? plusimage(context, "Image 2")
                            : Column(
                                children: [
                                  image(context, imagefile2!.path),
                                  const Spacer(),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          loadimage2 = 0;
                                        });
                                      },
                                      child: const Icon(
                                          CupertinoIcons.clear_circled))
                                ],
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: InkWell(
                        onTap: () async {
                          imagefile3 = await image3.pickImage(
                            source: ImageSource.gallery,
                          );
                          if (imagefile3 == null) {
                            u.snackbar("", "Not Selected Photos");
                          } else {
                            setState(() {
                              loadimage3 = 1;
                            });
                          }
                        },
                        child: loadimage3 == 0
                            ? plusimage(context, "Image 3")
                            : Column(
                                children: [
                                  image(context, imagefile3!.path),
                                  const Spacer(),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          loadimage3 = 0;
                                        });
                                      },
                                      child: const Icon(
                                          CupertinoIcons.clear_circled))
                                ],
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: InkWell(
                        onTap: () async {
                          imagefile4 = await image4.pickImage(
                            source: ImageSource.gallery,
                          );
                          if (imagefile4 == null) {
                            u.snackbar("", "Not Selected Photos");
                          } else {
                            setState(() {
                              loadimage4 = 1;
                            });
                          }
                        },
                        child: loadimage4 == 0
                            ? plusimage(context, "Image 4")
                            : Column(
                                children: [
                                  image(context, imagefile4!.path),
                                  const Spacer(),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          loadimage4 = 0;
                                        });
                                      },
                                      child: const Icon(
                                          CupertinoIcons.clear_circled))
                                ],
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: InkWell(
                        onTap: () async {
                          imagefile5 = await image5.pickImage(
                            source: ImageSource.gallery,
                          );
                          if (imagefile5 == null) {
                            u.snackbar("", "Not Selected Photos");
                          } else {
                            setState(() {
                              loadimage5 = 1;
                            });
                          }
                        },
                        child: loadimage5 == 0
                            ? plusimage(context, "Image 5")
                            : Column(
                                children: [
                                  image(context, imagefile5!.path),
                                  const Spacer(),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          loadimage5 = 0;
                                        });
                                      },
                                      child: const Icon(
                                          CupertinoIcons.clear_circled))
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)),
              width: w / 2 - 10,
              child: DropdownButton<String>(
                style: GoogleFonts.getFont(font.value,
                    fontSize: 16, color: colors.value),
                alignment: Alignment.center,
                value: category,
                isExpanded: true,
                icon: const SizedBox(),
                underline: const SizedBox(),
                elevation: 0,
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    category = value!;
                  });
                },
                items: listcategory
                    .map<DropdownMenuItem<String>>((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Row(
                      children: [
                        const Spacer(),
                        Text(category),
                        Text(
                          " ",
                          style: GoogleFonts.getFont(font.value,
                              fontSize: 16, color: colors.value),
                        ),
                        const Spacer()
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLength: 10,
                controller: block,
                decoration: InputDecoration(
                  labelText: " Block Number",
                  labelStyle:
                      GoogleFonts.getFont(font.value, color: colors.value),

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
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                textCapitalization: TextCapitalization.words,
                maxLength: 50,
                controller: apartment,
                decoration: InputDecoration(
                  labelText: "Apartment",
                  labelStyle:
                      GoogleFonts.getFont(font.value, color: colors.value),

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
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                textCapitalization: TextCapitalization.words,
                maxLength: 100,
                maxLines: 2,
                controller: homeaddress,
                decoration: InputDecoration(
                  labelText: "Home Address",
                  labelStyle:
                      GoogleFonts.getFont(font.value, color: colors.value),

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  width: w / 2 - 10,
                  child: DropdownButton<String>(
                    style: GoogleFonts.getFont(font.value,
                        fontSize: 16, color: colors.value),
                    alignment: Alignment.center,
                    value: hall,
                    isExpanded: true,
                    icon: const SizedBox(),
                    underline: const SizedBox(),
                    elevation: 0,
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        hall = value!;
                      });
                    },
                    items: listnumber
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          children: [
                            const Spacer(),
                            Text(value),
                            Text(
                              " Hall",
                              style: GoogleFonts.getFont(font.value,
                                  fontSize: 16, color: colors.value),
                            ),
                            const Spacer()
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  width: w / 2 - 10,
                  child: DropdownButton<String>(
                    style: GoogleFonts.getFont(font.value,
                        fontSize: 16, color: colors.value),
                    alignment: Alignment.center,
                    value: balcony,
                    isExpanded: true,
                    icon: const SizedBox(),
                    underline: const SizedBox(),
                    elevation: 0,
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        balcony = value!;
                      });
                    },
                    items: listnumber
                        .map<DropdownMenuItem<String>>((String balcony) {
                      return DropdownMenuItem<String>(
                        value: balcony,
                        child: Row(
                          children: [
                            const Spacer(),
                            Text(balcony),
                            Text(
                              " Balcony",
                              style: GoogleFonts.getFont(font.value,
                                  fontSize: 16, color: colors.value),
                            ),
                            const Spacer()
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h / 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  width: w / 2 - 10,
                  child: DropdownButton<String>(
                    style: GoogleFonts.getFont(font.value,
                        fontSize: 16, color: colors.value),
                    alignment: Alignment.center,
                    value: beds,
                    isExpanded: true,
                    icon: const SizedBox(),
                    underline: const SizedBox(),
                    elevation: 0,
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        beds = value!;
                      });
                    },
                    items:
                        listnumber.map<DropdownMenuItem<String>>((String beds) {
                      return DropdownMenuItem<String>(
                        value: beds,
                        child: Row(
                          children: [
                            const Spacer(),
                            Text(beds),
                            Text(
                              " Beds",
                              style: GoogleFonts.getFont(font.value,
                                  fontSize: 16, color: colors.value),
                            ),
                            const Spacer()
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  width: w / 2 - 10,
                  child: DropdownButton<String>(
                    style: GoogleFonts.getFont(font.value,
                        fontSize: 16, color: colors.value),
                    alignment: Alignment.center,
                    value: bath,
                    isExpanded: true,
                    icon: const SizedBox(),
                    underline: const SizedBox(),
                    elevation: 0,
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        bath = value!;
                      });
                    },
                    items:
                        listnumber.map<DropdownMenuItem<String>>((String bath) {
                      return DropdownMenuItem<String>(
                        value: bath,
                        child: Row(
                          children: [
                            const Spacer(),
                            Text(bath),
                            Text(
                              " Bath",
                              style: GoogleFonts.getFont(font.value,
                                  fontSize: 16, color: colors.value),
                            ),
                            const Spacer()
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h / 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: w / 2 - 10,
                  child: TextFormField(
                    controller: sqft,
                    decoration: InputDecoration(
                      labelText: " Sqft",
                      labelStyle:
                          GoogleFonts.getFont(font.value, color: colors.value),

                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: colors.value,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: colors.value,
                        ),
                      ),
                      //fillColor: Colors.green
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  width: w / 2 - 10,
                  child: DropdownButton<String>(
                    style: GoogleFonts.getFont(font.value,
                        fontSize: 16, color: colors.value),
                    alignment: Alignment.center,
                    focusColor: Colors.red,
                    autofocus: true,
                    value: kitchen,
                    itemHeight: kMinInteractiveDimension,
                    isExpanded: true,
                    icon: const SizedBox(),
                    underline: const SizedBox(),
                    elevation: 0,
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        kitchen = value!;
                      });
                    },
                    items: listnumber
                        .map<DropdownMenuItem<String>>((String kitchen) {
                      return DropdownMenuItem<String>(
                        value: kitchen,
                        child: Row(
                          children: [
                            const Spacer(),
                            Text(kitchen),
                            Text(
                              " kitchen",
                              style: GoogleFonts.getFont(font.value,
                                  fontSize: 16, color: colors.value),
                            ),
                            const Spacer()
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLength: 10,
                controller: price,
                decoration: InputDecoration(
                  labelText: " Rent Price",
                  labelStyle:
                      GoogleFonts.getFont(font.value, color: colors.value),

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
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                textCapitalization: TextCapitalization.words,
                maxLength: 20,
                controller: ownername,
                decoration: InputDecoration(
                  labelText: "Owner Name",
                  labelStyle:
                      GoogleFonts.getFont(font.value, color: colors.value),

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
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: TextFormField(
                maxLength: 10,
                controller: contactnumber,
                decoration: InputDecoration(
                  labelText: " Contact Number ",
                  labelStyle:
                      GoogleFonts.getFont(font.value, color: colors.value),

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
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                textCapitalization: TextCapitalization.words,
                maxLength: 1000,
                maxLines: 8,
                controller: description,
                decoration: InputDecoration(
                  labelText: " Discription ",
                  labelStyle:
                      GoogleFonts.getFont(font.value, color: colors.value),

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
                      homeinsert();
                      Navigator.pushNamed(context, '/MyHomePage');
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: colors.value),
                            height: h / 20,
                            width: w / 2.5,
                            child: const Center(
                                child: Text(
                              'Confirm',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold),
                            )))))
              ],
            ),
          ]),
        ));
  }

  homeinsert() async {
    final db = await initdatabase;
    await db!.rawInsert(
        "insert into home(image1, image2, image3, image4, image5, category, blocknumber, apartment, homeaddress, hall, balcony, beds, bath, sqft, kitchen, rentprice, ownername, contactnumber, description) values('${imagefile1!.path}','${imagefile2!.path}','${imagefile3!.path}','${imagefile4!.path}','${imagefile5!.path}','${category.toString()}','${block.text}','${apartment.text}','${homeaddress.text}','${hall.toString()}','${balcony.toString()}','${beds.toString()}','${bath.toString()}','${sqft.text}','${kitchen.toString()}','${price.text}','${ownername.text}','${contactnumber.text}','${description.text}')");
    triggernotification(apartment.text,
        "At ${apartment.text} ${homeaddress.text} New Home Added ");
    await db.rawInsert(
        "insert into notification(notificationtitle, notificationsubtitle, notificationphoto, notificationtime) values('${apartment.text}','${homeaddress.text}','${imagefile1!.path}','${d.hour}:${d.minute}')");

    u.snackbar("Rent Home", "Added SuccessFully");

    block.clear();
    apartment.clear();
    homeaddress.clear();
    sqft.clear();
    price.clear();
    ownername.clear();
    contactnumber.clear();
    description.clear();
    setState(() {
      loadimage1 = 0;
      loadimage2 = 0;
      loadimage3 = 0;
      loadimage4 = 0;
      loadimage5 = 0;
    });
  }

  triggernotification(String title, String body) {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            fullScreenIntent: true,
            criticalAlert: true,
            largeIcon: 'asset/images/guest.png',
            wakeUpScreen: true,
            roundedBigPicture: true,
            backgroundColor: colors.value,
            category: NotificationCategory.Message,
            color: colors.value,
            actionType: ActionType.Default,
            id: 7,
            channelKey: 'rentalhome',
            notificationLayout: NotificationLayout.BigPicture,
            body: body,
            title: title));
  }
}
