import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rentalhome/category/homedetail.dart';
import 'package:rentalhome/main.dart';
import 'package:rentalhome/category/updatehome.dart';
import 'package:rentalhome/sqflite/sqflitecontroller.dart';
import 'package:rentalhome/sqflite/sqflitetable.dart';
import 'package:rentalhome/utility.dart';

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

Utility u = Utility();

class _MyhomeState extends State<Myhome> {
  @override
  void initState() {
    super.initState();
    init();
  }

  int load = 0;
  init() async {
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
          title: Text("My home",
              style: GoogleFonts.getFont(
                font.value,
                color: themeNotifier.value == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
                fontSize: 20,
              )),
          actions: [
            CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.notifications_none_outlined,
                  color: themeNotifier.value == ThemeMode.light
                      ? Colors.black
                      : Colors.white,
                )),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: load == 0
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: homelist.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Homedetail(
                                    id: homelist[index].homeid,
                                    image1: homelist[index].image1,
                                    image2: homelist[index].image2,
                                    image3: homelist[index].image3,
                                    image4: homelist[index].image4,
                                    image5: homelist[index].image5,
                                    category: homelist[index].category,
                                    blocknumber: homelist[index].blocknumber,
                                    apartment: homelist[index].apartment,
                                    homeaddress: homelist[index].homeaddress,
                                    hall: homelist[index].hall,
                                    balcony: homelist[index].balcony,
                                    beds: homelist[index].beds,
                                    bath: homelist[index].bath,
                                    sqft: homelist[index].sqft,
                                    kitchen: homelist[index].kitchen,
                                    rentprice: homelist[index].rentprice,
                                    ownername: homelist[index].ownername,
                                    contactnumber:
                                        homelist[index].contactnumber,
                                    description: homelist[index].description,
                                  )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: h / 5.5,
                        width: w - 16,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: themeNotifier.value == ThemeMode.light
                                ? const Color.fromARGB(26, 229, 228, 228)
                                : const Color.fromARGB(221, 52, 52, 52)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: h / 4.5 - 16,
                                width: w / 3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.file(
                                    File(homelist[index].image1),
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
                                    homelist[index].apartment,
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.getFont(font.value,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  Text(
                                    homelist[index].homeaddress,
                                    style: GoogleFonts.getFont(font.value,
                                        color: Colors.grey),
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        "₹${homelist[index].rentprice}",
                                        style: GoogleFonts.getFont(font.value,
                                            fontSize: 20,
                                            color: colors.value,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "/month",
                                        style: GoogleFonts.getFont(font.value,
                                            color: Colors.grey, fontSize: 15),
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        onTap: () async {
                                          Navigator.pop(context);

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Updatehome(
                                                        image1: homelist[index]
                                                            .image1,
                                                        image2: homelist[index]
                                                            .image2,
                                                        image3: homelist[index]
                                                            .image3,
                                                        image4: homelist[index]
                                                            .image4,
                                                        image5: homelist[index]
                                                            .image5,
                                                        category:
                                                            homelist[index]
                                                                .category,
                                                        blocknumber:
                                                            homelist[index]
                                                                .blocknumber,
                                                        apartment:
                                                            homelist[index]
                                                                .apartment,
                                                        homeaddress:
                                                            homelist[index]
                                                                .homeaddress,
                                                        hall: homelist[index]
                                                            .hall,
                                                        balcony: homelist[index]
                                                            .balcony,
                                                        beds: homelist[index]
                                                            .beds,
                                                        bath: homelist[index]
                                                            .bath,
                                                        sqft: homelist[index]
                                                            .sqft,
                                                        kitchen: homelist[index]
                                                            .kitchen,
                                                        rentprice:
                                                            homelist[index]
                                                                .rentprice,
                                                        ownername:
                                                            homelist[index]
                                                                .ownername,
                                                        contactnumber:
                                                            homelist[index]
                                                                .contactnumber,
                                                        description:
                                                            homelist[index]
                                                                .description,
                                                        id: homelist[index]
                                                            .homeid,
                                                      )));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Container(
                                            height: h / 30,
                                            width: w / 10,
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
                                              CupertinoIcons.pen,
                                              color: colors.value,
                                            )),
                                          ),
                                        ),
                                      ),
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
                                                  height:
                                                      u.height(context) / 19,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
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
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.4)),
                                                            height: u.height(
                                                                    context) /
                                                                20,
                                                            width: u.width(
                                                                    context) /
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
                                                              "delete from home where homeid=${homelist[index].homeid}");
                                                          u.snackbar(
                                                              "Home Deleted",
                                                              "Home SuccessFully Deleted");
                                                          setState(
                                                            () {
                                                              homelist.removeAt(
                                                                  index);
                                                            },
                                                          );
                                                          // ignore: use_build_context_synchronously
                                                          Navigator.pop(
                                                              context);
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
                                                                color: colors
                                                                    .value),
                                                            height: u.height(
                                                                    context) /
                                                                20,
                                                            width: u.width(
                                                                    context) /
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
                                            width: w / 10,
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ));
  }
}
