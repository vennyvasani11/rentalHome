import 'dart:io';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:rentalhome/category/homedetail.dart';
import 'package:rentalhome/main.dart';
import 'package:rentalhome/sqflite/sqflitecontroller.dart';
import 'package:rentalhome/utility.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

Utility u = Utility();

class _FavouriteState extends State<Favourite> {
  @override
  void initState() {
    favdata();
    super.initState();
  }

  int load = 0;
  favdata() async {
    await favouritedata();
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
        backgroundColor: Colors.white10,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
        title: Text("Favourite",
            style: GoogleFonts.getFont(font.value,
                fontSize: 20, color: Colors.black)),
        actions: const [
          CircleAvatar(
              backgroundColor: Colors.white10,
              child: Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
              )),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(
              height: h,
              width: w,
              child: GridView.builder(
                  itemCount: favouritelist.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.70),
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homedetail(
                                      id: favouritelist[index].favoriteid,
                                      image1: favouritelist[index].image1,
                                      image2: favouritelist[index].image2,
                                      image3: favouritelist[index].image3,
                                      image4: favouritelist[index].image4,
                                      image5: favouritelist[index].image5,
                                      category: favouritelist[index].category,
                                      blocknumber:
                                          favouritelist[index].blocknumber,
                                      apartment: favouritelist[index].apartment,
                                      homeaddress:
                                          favouritelist[index].homeaddress,
                                      hall: favouritelist[index].hall,
                                      balcony: favouritelist[index].balcony,
                                      beds: favouritelist[index].beds,
                                      bath: favouritelist[index].bath,
                                      sqft: favouritelist[index].sqft,
                                      kitchen: favouritelist[index].kitchen,
                                      rentprice: favouritelist[index].rentprice,
                                      ownername: favouritelist[index].ownername,
                                      contactnumber:
                                          favouritelist[index].contactnumber,
                                      description:
                                          favouritelist[index].description,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                            File(favouritelist[index].image1),
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
                                            favouritelist[index].category,
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
                                  favouritelist[index].apartment,
                                  style: GoogleFonts.getFont(font.value,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Text(
                                  favouritelist[index].homeaddress,
                                  style: GoogleFonts.getFont(font.value,
                                      color: Colors.grey),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Text(
                                      "₹${favouritelist[index].rentprice}",
                                      style: GoogleFonts.getFont(font.value,
                                          color: colors.value,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "/Month",
                                      style: GoogleFonts.getFont(font.value,
                                          color: Colors.grey),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/favourite');
                                      },
                                      child: Icon(
                                        Icons.favorite_outline,
                                        color: colors.value,
                                      ),
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
