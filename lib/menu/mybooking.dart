import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rentalhome/main.dart';
import 'package:rentalhome/sqflite/sqflitecontroller.dart';
import 'package:rentalhome/sqflite/sqflitetable.dart';

class Mybooking extends StatefulWidget {
  const Mybooking({super.key});

  @override
  State<Mybooking> createState() => _MybookingState();
}

class _MybookingState extends State<Mybooking> {
  @override
  void initState() {
    bookdata();
    super.initState();
  }

  int load = 0;
  bookdata() async {
    await bookingdata();
    await homedata();
    setState(() {
      load = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/MyHomePage');
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: themeNotifier.value == ThemeMode.light
                  ? Colors.black
                  : Colors.white,
            )),
        title: Text(
          "My Booking",
          style: GoogleFonts.getFont(font.value,
              color: themeNotifier.value == ThemeMode.light
                  ? Colors.black
                  : Colors.white,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: load == 0
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: bookinglist.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: h / 5.5,
                        width: w - 16,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: themeNotifier.value == ThemeMode.light
                                ? const Color.fromARGB(26, 229, 228, 228)
                                : const Color.fromARGB(221, 52, 52, 52)),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: h / 4.5 - 16,
                              width: w / 3,
                              // child: Image.file(File(
                              //     "/data/user/0/com.example.rentalhome/cache/bf2cc479-d64e-4d54-bb28-faea86b7d3a3/1678081381416.jpg")),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.file(
                                  File(bookinglist[index].image1),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                const Spacer(),
                                Text(
                                  bookinglist[index].address,
                                  style: GoogleFonts.getFont(font.value,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Text(
                                  bookinglist[index].customername,
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.getFont(font.value,
                                      color: Colors.grey),
                                ),
                                Text(
                                  bookinglist[index].customernumber,
                                  style: GoogleFonts.getFont(font.value,
                                      color: Colors.grey),
                                ),
                                const Spacer(),
                                Text(
                                  "${bookinglist[index].startdate} To ${bookinglist[index].enddate}",
                                  style: GoogleFonts.getFont(font.value,
                                      color: Colors.grey),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Text(
                                      "₹${bookinglist[index].totlpayment}/-",
                                      style: GoogleFonts.getFont(font.value,
                                          fontSize: 20,
                                          color: colors.value,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () async {
                                        return showDialog<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  35))),
                                              title: Container(
                                                //color: Colors.amber,
                                                child: Lottie.asset(
                                                    "asset/animation/closed.json",
                                                    height: 150,
                                                    alignment:
                                                        Alignment.center),
                                              ),
                                              actionsAlignment:
                                                  MainAxisAlignment.center,
                                              content: SizedBox(
                                                height: u.height(context) / 19,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Home Deleted',
                                                      style:
                                                          GoogleFonts.getFont(
                                                              font.value,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    const Spacer(),
                                                    Text(
                                                      'Are You Sure Home Deleted?',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        font.value,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.4)),
                                                          height: u.height(
                                                                  context) /
                                                              20,
                                                          width:
                                                              u.width(context) /
                                                                  3,
                                                          child: Center(
                                                            child: Text(
                                                              "Cancel",
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                      font
                                                                          .value,
                                                                      fontSize:
                                                                          15),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () async {
                                                        final db =
                                                            await initdatabase;
                                                        await db!.rawDelete(
                                                            "delete from booking where bookingid=${bookinglist[index].bookingid}");
                                                        u.snackbar(
                                                            "Home Deleted",
                                                            "Home SuccessFully Deleted");
                                                        setState(
                                                          () {
                                                            bookinglist
                                                                .removeAt(
                                                                    index);
                                                          },
                                                        );
                                                        // ignore: use_build_context_synchronously
                                                        Navigator.pop(context);
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              color:
                                                                  colors.value),
                                                          height: u.height(
                                                                  context) /
                                                              20,
                                                          width:
                                                              u.width(context) /
                                                                  3,
                                                          child: Center(
                                                            child: Text(
                                                              "Confirm",
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                      font
                                                                          .value,
                                                                      fontSize:
                                                                          15),
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
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Container(
                                          height: h / 30,
                                          width: w / 8,
                                          decoration: BoxDecoration(
                                              color: themeNotifier.value ==
                                                      ThemeMode.light
                                                  ? Colors.white
                                                  : const Color.fromARGB(
                                                      221, 122, 122, 122),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Center(
                                              child: Icon(
                                            CupertinoIcons.delete,
                                            color: colors.value,
                                          )),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ]))
                        ])));
              },
            ),
    );
  }
}
