import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:rentalhome/main.dart';
import 'package:rentalhome/menu/myhome.dart';
import 'package:rentalhome/sqflite/sqflitetable.dart';
import 'package:rentalhome/utility.dart';

// ignore: must_be_immutable
class Updatehome extends StatefulWidget {
  int id;
  String image1;
  String image2;
  String image3;
  String image4;
  String image5;
  String category;
  String blocknumber;
  String apartment;
  String homeaddress;
  String hall;
  String balcony;
  String beds;
  String bath;
  String sqft;
  String kitchen;
  String rentprice;
  String ownername;
  String contactnumber;
  String description;
  Updatehome(
      {required this.id,
      required this.image1,
      required this.image2,
      required this.image3,
      required this.image4,
      required this.image5,
      required this.category,
      required this.blocknumber,
      required this.apartment,
      required this.homeaddress,
      required this.hall,
      required this.balcony,
      required this.beds,
      required this.bath,
      required this.sqft,
      required this.kitchen,
      required this.rentprice,
      required this.ownername,
      required this.contactnumber,
      required this.description,
      super.key});

  @override
  State<Updatehome> createState() => _UpdatehomeState();
}

Utility u = Utility();
DateTime today = DateTime.now();
Allpermission all = Allpermission();
List<String> listnumber = ['1', "2", "3", "4", "5"];
List<String> listcategory = [
  'House',
  "Villa",
  "2BHK",
  "3BHK",
];

class _UpdatehomeState extends State<Updatehome> {
  @override
  void initState() {
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

  @override
  Widget build(BuildContext context) {
    hall = widget.hall;
    balcony = widget.balcony;
    beds = widget.beds;
    bath = widget.bath;
    kitchen = widget.kitchen;

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Obx(
      () {
        return Scaffold(
            appBar: AppBar(
              title: Text("Update Rent Home",
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
                          child: Container(
                              height: h / 2.5,
                              width: w / 1.1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(width: 1)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.file(
                                  File(widget.image1),
                                  fit: BoxFit.cover,
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                              height: h / 2.5,
                              width: w / 1.1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(width: 1)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.file(
                                  File(widget.image2),
                                  fit: BoxFit.cover,
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                              height: h / 2.5,
                              width: w / 1.1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(width: 1)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.file(
                                  File(widget.image3),
                                  fit: BoxFit.cover,
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                              height: h / 2.5,
                              width: w / 1.1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(width: 1)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.file(
                                  File(widget.image4),
                                  fit: BoxFit.cover,
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                              height: h / 2.5,
                              width: w / 1.1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(width: 1)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.file(
                                  File(widget.image5),
                                  fit: BoxFit.cover,
                                ),
                              )),
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
                    height: h / 15,
                    child: Center(
                      child: Text(
                        widget.category,
                        style: GoogleFonts.getFont(font.value,
                            fontSize: 18, color: colors.value),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    initialValue: widget.blocknumber,
                    onChanged: (value) {
                      setState(() {
                        widget.blocknumber = value;
                      });
                    },
                    maxLength: 10,
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
                    maxLength: 50,
                    initialValue: widget.apartment,
                    onChanged: (value) {
                      setState(() {
                        widget.apartment = value;
                      });
                    },
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
                    maxLength: 100,
                    maxLines: 2,
                    initialValue: widget.homeaddress,
                    onChanged: (value) {
                      setState(() {
                        widget.homeaddress = value;
                      });
                    },
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
                        items: listnumber
                            .map<DropdownMenuItem<String>>((String beds) {
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
                        items: listnumber
                            .map<DropdownMenuItem<String>>((String bath) {
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
                        initialValue: widget.sqft,
                        onChanged: (value) {
                          setState(() {
                            widget.sqft = value;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: " Sqft",
                          labelStyle: GoogleFonts.getFont(font.value,
                              color: colors.value),

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
                    initialValue: widget.rentprice,
                    onChanged: (value) {
                      setState(() {
                        widget.rentprice = value;
                      });
                    },
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
                    maxLength: 20,
                    initialValue: widget.ownername,
                    onChanged: (value) {
                      setState(() {
                        widget.ownername = value;
                      });
                    },
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
                    initialValue: widget.contactnumber,
                    onChanged: (value) {
                      setState(() {
                        widget.contactnumber = value;
                      });
                    },
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
                    maxLength: 1000,
                    maxLines: 8,
                    initialValue: widget.description,
                    onChanged: (value) {
                      setState(() {
                        widget.description = value;
                      });
                    },
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
                        onTap: () async {
                          homeupdate();
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>const Myhome(),
                              ));
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
      },
    );
  }

  homeupdate() async {
    final db = await initdatabase;
    await db!.rawUpdate(
        "update home set image1='${widget.image1}', image2='${widget.image2}', image3='${widget.image3}', image4='${widget.image4}', image5='${widget.image5}', blocknumber=${widget.blocknumber}, apartment='${widget.apartment}', homeaddress='${widget.homeaddress}', sqft='${widget.sqft}', rentprice=${widget.rentprice}, ownername='${widget.ownername}', contactnumber=${widget.contactnumber}, description='${widget.description}' where homeid=${widget.id}");
    u.snackbar("Rent Home", "Home SuccessFully Updated");
  }
}
