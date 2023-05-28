import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:rentalhome/menu/bookingnow.dart';
import 'package:rentalhome/main.dart';
import 'package:rentalhome/sqflite/sqflitecontroller.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Homedetail extends StatefulWidget {
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

  Homedetail(
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
  State<Homedetail> createState() => _HomedetailState();
}

class _HomedetailState extends State<Homedetail> {
  @override
  void initState() {
    getdata();

    super.initState();
  }

  List<String> images = [];
  getdata() {
    homedata();
    images.add(widget.image1);
    images.add(widget.image2);
    images.add(widget.image3);
    images.add(widget.image4);
    images.add(widget.image5);
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h / 2,
              width: w,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: h / 2,
                          width: w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.file(
                              File(images[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: h / 2,
                          width: w,
                          decoration: const BoxDecoration(),
                          child: AppBar(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            leading: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back_ios,
                                // color: Colors.black,
                              ),
                            ),
                            actions: const [
                              Icon(
                                Icons.favorite_outline_outlined,
                                //  color: Colors.black,
                              ),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: h / 80,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.apartment,
                style: GoogleFonts.getFont(font.value,
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: h / 25,
                    width: w / 5,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 227, 227, 227),
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Text(
                        widget.category,
                        style: GoogleFonts.getFont(font.value,
                            color: colors.value),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    //color: Colors.amber,
                    height: h / 15,
                    width: w / 3.5,
                    child: Row(
                      children: [
                        CircleAvatar(
                            backgroundColor: colors.value.withOpacity(0.2),
                            child: Icon(
                              Icons.living_outlined,
                              color: colors.value,
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${widget.hall} Hall",
                            style:
                                GoogleFonts.getFont(font.value, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    //color: Colors.amber,
                    height: h / 15,
                    width: w / 3.5,
                    child: Row(
                      children: [
                        CircleAvatar(
                            backgroundColor: colors.value.withOpacity(0.2),
                            child: Icon(
                              Icons.kitchen_outlined,
                              color: colors.value,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "${widget.kitchen} Kitchen",
                            style:
                                GoogleFonts.getFont(font.value, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    //color: Colors.amber,
                    height: h / 15,
                    width: w / 3,
                    child: Row(
                      children: [
                        CircleAvatar(
                            backgroundColor: colors.value.withOpacity(0.2),
                            child: Icon(
                              Icons.balcony_outlined,
                              color: colors.value,
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${widget.balcony} Balcony",
                            style:
                                GoogleFonts.getFont(font.value, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    //color: Colors.amber,
                    height: h / 15,
                    width: w / 3.5,
                    child: Row(
                      children: [
                        CircleAvatar(
                            backgroundColor: colors.value.withOpacity(0.2),
                            child: Icon(
                              Icons.bed,
                              color: colors.value,
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${widget.beds} Beds",
                            style:
                                GoogleFonts.getFont(font.value, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    //color: Colors.amber,
                    height: h / 15,
                    width: w / 3.5,
                    child: Row(
                      children: [
                        CircleAvatar(
                            backgroundColor: colors.value.withOpacity(0.2),
                            child: Icon(
                              Icons.bathtub,
                              color: colors.value,
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${widget.bath} Bath",
                            style:
                                GoogleFonts.getFont(font.value, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    //color: Colors.amber,
                    height: h / 15,
                    width: w / 3,
                    child: Row(
                      children: [
                        CircleAvatar(
                            backgroundColor: colors.value.withOpacity(0.2),
                            child: Icon(
                              Icons.crop_square,
                              color: colors.value,
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${widget.sqft} Sqft",
                            style:
                                GoogleFonts.getFont(font.value, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('asset/images/person.png'),
                    radius: 30,
                  ),
                  SizedBox(
                    width: w / 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.ownername,
                        style: GoogleFonts.getFont(font.value,
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "Owner",
                        style: GoogleFonts.getFont(font.value,
                            fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // InkWell(
                  //   onTap: () {
                  //   },
                  //   child: Icon(
                  //     CupertinoIcons.chat_bubble_2,
                  //     size: 30,
                  //     color: colors.value,
                  //   ),
                  // ),
                  SizedBox(
                    width: w / 20,
                  ),
                  InkWell(
                    onTap: () async {
                      final Uri url = Uri.parse('tel:${widget.contactnumber}');
                      await canLaunchUrl(url)
                          ? await launchUrl(url)
                          : const Text("No Internet");
                    },
                    child: Icon(
                      CupertinoIcons.phone,
                      size: 30,
                      color: colors.value,
                    ),
                  ),
                  SizedBox(
                    width: w / 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h / 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Overview",
                style: GoogleFonts.getFont(font.value,
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.description,
                softWrap: true,
                style: GoogleFonts.getFont(
                  font.value,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Gallery",
                style: GoogleFonts.getFont(font.value,
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: h / 5,
              width: w,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.file(
                          File(images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Location",
                style: GoogleFonts.getFont(font.value,
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: colors.value,
                  ),
                  SizedBox(
                    width: w / 90,
                  ),
                  SizedBox(
                    width: w / 1.2,
                    child: Text(
                      "${widget.blocknumber}, ${widget.apartment}, ${widget.homeaddress}.",
                      softWrap: true,
                      style: GoogleFonts.getFont(
                        font.value,
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: h / 7,
                width: w - 20,
                decoration: BoxDecoration(
                    color: themeNotifier.value == ThemeMode.light
                        ? Colors.white
                        : const Color.fromARGB(255, 33, 33, 33),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                "Prices",
                                style: GoogleFonts.getFont(font.value,
                                    color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(children: [
                                Text(
                                  "₹${widget.rentprice}",
                                  style: GoogleFonts.getFont(font.value,
                                      fontSize: 25,
                                      color: colors.value,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "/month",
                                  style: GoogleFonts.getFont(font.value,
                                      color: Colors.grey, fontSize: 15),
                                ),
                              ]),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Bookingnow(
                                    photo: widget.image1,
                                    price: widget.rentprice,
                                    name: widget.apartment,
                                    address:
                                        "${widget.blocknumber}, ${widget.apartment}, ${widget.homeaddress}.",
                                    id: widget.id.toString(),
                                    ownername: widget.ownername,
                                    category: widget.category,
                                    mobile: widget.contactnumber),
                              ));
                        },
                        child: Container(
                          height: h / 7 / 2,
                          width: w / 2.4,
                          decoration: BoxDecoration(
                              color: colors.value,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              "Booking Now",
                              style: GoogleFonts.getFont(
                                font.value,
                                fontSize: 20,
                                color: themeNotifier.value == ThemeMode.light
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//  Homedetail(
//                                               image1: homelist[index].image1,
//                                               image2: homelist[index].image2,
//                                               image3: homelist[index].image3,
//                                               image4: homelist[index].image4,
//                                               image5: homelist[index].image5,
//                                               category:
//                                                   homelist[index].category,
//                                               blocknumber:
//                                                   homelist[index].blocknumber,
//                                               apartment:
//                                                   homelist[index].apartment,
//                                               homeaddress:
//                                                   homelist[index].homeaddress,
//                                               hall: homelist[index].hall,
//                                               balcony: homelist[index].balcony,
//                                               beds: homelist[index].beds,
//                                               bath: homelist[index].bath,
//                                               sqft: homelist[index].sqft,
//                                               kitchen: homelist[index].kitchen,
//                                               rentprice:
//                                                   homelist[index].rentprice,
//                                               ownername:
//                                                   homelist[index].ownername,
//                                               contactnumber:
//                                                   homelist[index].contactnumber,
//                                               description:
//                                                   homelist[index].description,
//                                             )));