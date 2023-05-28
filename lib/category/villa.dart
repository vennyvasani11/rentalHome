import 'dart:io';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:rentalhome/main.dart';
import 'package:rentalhome/sqflite/sqflitecontroller.dart';

import 'homedetail.dart';

class Villa extends StatefulWidget {
  const Villa({super.key});

  @override
  State<Villa> createState() => _VillaState();
}

int ink = 2;

class _VillaState extends State<Villa> {
  @override
  @override
  void initState() {
    house();
    super.initState();
  }

  int load = 0;
  house() async {
    await housedata("Villa");
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
        title: Text("Villa",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 60,
                  width: w,
                  child: ListView.builder(
                    itemCount: u.category.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            switch (index) {
                              case 0:
                                {
                                  Navigator.pop(context);
                                  Navigator.pushNamed(context, '/MyHomePage');
                                }
                                break;
                              case 1:
                                {
                                  Navigator.pop(context);
                                  Navigator.pushNamed(context, '/House');
                                }
                                break;

                              case 2:
                                {
                                  Navigator.pop(context);
                                  Navigator.pushNamed(context, '/villa');
                                }
                                break;

                              case 3:
                                {
                                  Navigator.pop(context);
                                  Navigator.pushNamed(context, '/BHK2');
                                }
                                break;
                              case 4:
                                {
                                  Navigator.pop(context);
                                  Navigator.pushNamed(context, '/BHK3');
                                }
                            }
                          },
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                                color: ink == index
                                    ? colors.value
                                    : themeNotifier.value == ThemeMode.light
                                        ? Colors.white
                                        : Colors.black,
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(width: 3, color: colors.value)),
                            child: Center(
                                child: Text(
                              u.category[index],
                              style: GoogleFonts.getFont(font.value,
                                  color: ink == index
                                      ? themeNotifier.value == ThemeMode.light
                                          ? Colors.white
                                          : Colors.black
                                      : colors.value,
                                  fontSize: 13),
                            )),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            load == 0
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
                    height: h,
                    width: w,
                    child: GridView.builder(
                        itemCount: houselist.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.65),
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Homedetail(
                                            id: houselist[index].homeid,
                                            image1: houselist[index].image1,
                                            image2: houselist[index].image2,
                                            image3: houselist[index].image3,
                                            image4: houselist[index].image4,
                                            image5: houselist[index].image5,
                                            category: houselist[index].category,
                                            blocknumber:
                                                houselist[index].blocknumber,
                                            apartment:
                                                houselist[index].apartment,
                                            homeaddress:
                                                houselist[index].homeaddress,
                                            hall: houselist[index].hall,
                                            balcony: houselist[index].balcony,
                                            beds: houselist[index].beds,
                                            bath: houselist[index].bath,
                                            sqft: houselist[index].sqft,
                                            kitchen: houselist[index].kitchen,
                                            rentprice:
                                                houselist[index].rentprice,
                                            ownername:
                                                houselist[index].ownername,
                                            contactnumber:
                                                houselist[index].contactnumber,
                                            description:
                                                houselist[index].description,
                                          )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                width: w / 2 - 16,
                                height: h / 3 - 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: themeNotifier.value == ThemeMode.light
                                      ? Colors.white
                                      : const Color.fromARGB(221, 52, 52, 52),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                              height: h / 5,
                                              width: w / 2 - 25,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.file(
                                                  File(houselist[index].image1),
                                                  fit: BoxFit.cover,
                                                ),
                                              )),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: h / 40,
                                              width: w / 10,
                                              decoration: BoxDecoration(
                                                  color: themeNotifier.value ==
                                                          ThemeMode.light
                                                      ? const Color.fromARGB(
                                                          255, 226, 225, 225)
                                                      : const Color.fromARGB(
                                                          221, 52, 52, 52),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Center(
                                                child: Text(
                                                  houselist[index].category,
                                                  style: GoogleFonts.getFont(
                                                    font.value,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Text(
                                        houselist[index].apartment,
                                        style: GoogleFonts.getFont(font.value,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      Text(
                                        houselist[index].homeaddress,
                                        style: GoogleFonts.getFont(font.value,
                                            color: Colors.grey),
                                      ),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          Text(
                                            "₹${houselist[index].rentprice}",
                                            style: GoogleFonts.getFont(
                                                font.value,
                                                color: colors.value,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "/Month",
                                            style: GoogleFonts.getFont(
                                                font.value,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        })),
                  )
          ],
        ),
      ),
    );
  }
}
