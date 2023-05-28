import 'dart:io';
import 'package:animated_stack/animated_stack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rentalhome/category/homedetail.dart';
import 'package:rentalhome/features.dart';
import 'package:rentalhome/home.dart';
import 'package:rentalhome/main.dart';
import 'package:rentalhome/sqflite/sqflitecontroller.dart';

// ignore: must_be_immutable
class Mypage extends StatefulWidget {
  Mypage({super.key});
  DateTime today = DateTime.now();
  Renthome r = Renthome();
  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  final MyDrawerController controller = Get.put(MyDrawerController());
  @override
  void initState() {
    super.initState();
    init();
  }

  Feathures f = Feathures();

  List home = [];
  int load = 0;
  Future<void> init() async {
    await homedata();
    await homefivedata();
    await favouritedata();

    await logindata(SP!.get("gmail").toString());
    setState(() {
      load = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return GetBuilder<MyDrawerController>(
      builder: (_) => ZoomDrawer(
        controller: _.zoomDrawerController,
        menuScreen: load == 0
            ? const Center(child: CircularProgressIndicator())
            : const MenuScreen(),
        menuBackgroundColor: themeNotifier.value == ThemeMode.light
            ? Colors.white
            : Colors.black,
        mainScreen: load == 0
            ? Container(
                height: h,
                width: w,
                color: Colors.white,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Homepage(),
        menuScreenTapClose: true,
        mainScreenTapClose: true,
        borderRadius: 30.0,
        showShadow: true,
        angle: -5.0,
        drawerShadowsBackgroundColor: colors.value,
        slideWidth: MediaQuery.of(context).size.width * 0.85,
      ),
    );
  }
}

class MenuScreen extends GetView<MyDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Renthome r = Renthome();

    return SafeArea(
        child: r.menu(context, loginlist[0].loginname, loginlist[0].loginmobile,
            loginlist[0].loginphoto));
  }
}

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }
}

// ignore: must_be_immutable
class Homepage extends GetView<MyDrawerController> {
  Homepage({Key? key}) : super(key: key);
  TextEditingController search = TextEditingController();
  Feathures f = Feathures();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () {
        f.exit(context);
        return true as Future<bool>;
      },
      child: Scaffold(
          backgroundColor: themeNotifier.value == ThemeMode.light
              ? Colors.white
              : Colors.black,
          resizeToAvoidBottomInset: false,
          body: AnimatedStack(
            backgroundColor: themeNotifier.value == ThemeMode.light
                ? Colors.white
                : const Color.fromARGB(255, 63, 63, 63),
            fabBackgroundColor: colors.value,
            foregroundWidget: Container(
              decoration: BoxDecoration(boxShadow: <BoxShadow>[
                BoxShadow(
                  color: colors.value.withOpacity(0.5),
                  blurRadius: 50,
                  offset: const Offset(4, 4),
                ),
              ], borderRadius: BorderRadius.circular(5)),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                    height: h,
                    width: w,
                    decoration: BoxDecoration(
                        color: themeNotifier.value == ThemeMode.light
                            ? Colors.white
                            : Colors.black,
                        borderRadius: BorderRadius.circular(15)),
                    child: RefreshIndicator(
                      color: colors.value,
                      triggerMode: RefreshIndicatorTriggerMode.anywhere,
                      onRefresh: init,
                      child: ListView.builder(
                          itemCount: homelist.length,
                          itemBuilder: ((context, index) {
                            return index == 0
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: controller.toggleDrawer,
                                              child: CircleAvatar(
                                                backgroundColor: colors.value,
                                                radius: 31,
                                                child: SP!.get("photo") == null
                                                    ? const CircleAvatar(
                                                        radius: 30,
                                                        backgroundColor:
                                                            Colors.white,
                                                        child: Image(
                                                          image: AssetImage(
                                                              'asset/images/person.png'),
                                                        ),
                                                      )
                                                    : Container(
                                                        height: h / 5,
                                                        width: w / 2.5,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        79),
                                                            image: DecorationImage(
                                                                image: NetworkImage(
                                                                    loginlist[0]
                                                                        .loginphoto),
                                                                fit: BoxFit
                                                                    .cover)),
                                                      ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: w / 30,
                                            ),
                                            SizedBox(
                                              width: w / 1.7,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Good Morning 👋",
                                                    style: GoogleFonts.getFont(
                                                        font.value,
                                                        fontSize: 13,
                                                        color: Colors.grey),
                                                  ),
                                                  Text(
                                                    SP!.get("skip") == true
                                                        ? loginlist[0].loginname
                                                        : "Guest",
                                                    style: GoogleFonts.getFont(
                                                        font.value,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: themeNotifier
                                                                    .value ==
                                                                ThemeMode.light
                                                            ? Colors.black
                                                            : Colors.white,
                                                        fontSize: 20),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, '/notifications');
                                              },
                                              child: Icon(
                                                  CupertinoIcons.bell_solid,
                                                  size: 25,
                                                  color: themeNotifier.value ==
                                                          ThemeMode.light
                                                      ? Colors.black
                                                      : Colors.white),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                themeNotifier.value =
                                                    themeNotifier.value ==
                                                            ThemeMode.light
                                                        ? ThemeMode.dark
                                                        : ThemeMode.light;
                                                Navigator.pop(context);
                                                Navigator.pushNamed(
                                                    context, '/MyHomePage');
                                              },
                                              child: Lottie.asset(
                                                  "asset/animation/light-dark mode.json",
                                                  height: 45,
                                                  width: 45),
                                            )
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        endIndent: 20,
                                        indent: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Featured",
                                          style: GoogleFonts.getFont(font.value,
                                              color: themeNotifier.value ==
                                                      ThemeMode.light
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: h / 2,
                                            width: w,
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: fivehomelist.length,
                                                itemBuilder: ((context, index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      Homedetail(
                                                                        id: fivehomelist[index]
                                                                            .homeid,
                                                                        image1:
                                                                            fivehomelist[index].image1,
                                                                        image2:
                                                                            fivehomelist[index].image2,
                                                                        image3:
                                                                            fivehomelist[index].image3,
                                                                        image4:
                                                                            fivehomelist[index].image4,
                                                                        image5:
                                                                            fivehomelist[index].image5,
                                                                        category:
                                                                            fivehomelist[index].category,
                                                                        blocknumber:
                                                                            fivehomelist[index].blocknumber,
                                                                        apartment:
                                                                            fivehomelist[index].apartment,
                                                                        homeaddress:
                                                                            fivehomelist[index].homeaddress,
                                                                        hall: fivehomelist[index]
                                                                            .hall,
                                                                        balcony:
                                                                            fivehomelist[index].balcony,
                                                                        beds: fivehomelist[index]
                                                                            .beds,
                                                                        bath: fivehomelist[index]
                                                                            .bath,
                                                                        sqft: fivehomelist[index]
                                                                            .sqft,
                                                                        kitchen:
                                                                            fivehomelist[index].kitchen,
                                                                        rentprice:
                                                                            fivehomelist[index].rentprice,
                                                                        ownername:
                                                                            fivehomelist[index].ownername,
                                                                        contactnumber:
                                                                            fivehomelist[index].contactnumber,
                                                                        description:
                                                                            fivehomelist[index].description,
                                                                      )));
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                        height: h / 2,
                                                        width: w / 1.2,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(60),
                                                        ),
                                                        child: Stack(
                                                          children: [
                                                            SizedBox(
                                                              height: h / 2,
                                                              width: w,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                                child:
                                                                    Image.file(
                                                                  File(fivehomelist[
                                                                          index]
                                                                      .image1),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(25),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        h / 30,
                                                                    width:
                                                                        w / 8,
                                                                    decoration: BoxDecoration(
                                                                        color: themeNotifier.value == ThemeMode.light
                                                                            ? const Color.fromARGB(
                                                                                255,
                                                                                230,
                                                                                229,
                                                                                229)
                                                                            : const Color.fromARGB(
                                                                                221,
                                                                                65,
                                                                                65,
                                                                                65),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10)),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        fivehomelist[index]
                                                                            .category,
                                                                        style: GoogleFonts.getFont(
                                                                            font
                                                                                .value,
                                                                            color:
                                                                                colors.value),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(25),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Text(
                                                                    fivehomelist[
                                                                            index]
                                                                        .apartment,
                                                                    style: GoogleFonts.getFont(
                                                                        font
                                                                            .value,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            20),
                                                                  ),
                                                                  Text(
                                                                    fivehomelist[
                                                                            index]
                                                                        .homeaddress,
                                                                    style: GoogleFonts.getFont(
                                                                        font
                                                                            .value,
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        "₹${fivehomelist[index].rentprice}",
                                                                        style: GoogleFonts.getFont(
                                                                            font
                                                                                .value,
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 20),
                                                                      ),
                                                                      Text(
                                                                        "/month",
                                                                        style: GoogleFonts.getFont(
                                                                            font
                                                                                .value,
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: 15),
                                                                      ),
                                                                      const Spacer(),
                                                                      // InkWell(
                                                                      //   onTap:
                                                                      //       () {
                                                                      //     Navigator.pushNamed(
                                                                      //         context,
                                                                      //         '/favourite');
                                                                      //   },
                                                                      //   child:
                                                                      //       const Icon(
                                                                      //     Icons
                                                                      //         .favorite_border,
                                                                      //     color:
                                                                      //         Colors.white,
                                                                      //   ),
                                                                      // )
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
                                                })),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Our Recommendation",
                                          style: GoogleFonts.getFont(font.value,
                                              color: themeNotifier.value ==
                                                      ThemeMode.light
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
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
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      switch (index) {
                                                        case 0:
                                                          {
                                                            Navigator.pushNamed(
                                                                context,
                                                                '/Homepage');
                                                          }
                                                          break;
                                                        case 1:
                                                          {
                                                            Navigator.pushNamed(
                                                                context,
                                                                '/House');
                                                          }
                                                          break;

                                                        case 2:
                                                          {
                                                            Navigator.pushNamed(
                                                                context,
                                                                '/villa');
                                                          }
                                                          break;

                                                        case 3:
                                                          {
                                                            Navigator.pushNamed(
                                                                context,
                                                                '/BHK2');
                                                          }
                                                          break;
                                                        case 4:
                                                          {
                                                            Navigator.pushNamed(
                                                                context,
                                                                '/BHK3');
                                                          }
                                                      }
                                                    },
                                                    child: Container(
                                                      height: 30,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                          color: index == 0
                                                              ? colors.value
                                                              : themeNotifier
                                                                          .value ==
                                                                      ThemeMode
                                                                          .light
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                          border: Border.all(
                                                              width: 3,
                                                              color: colors
                                                                  .value)),
                                                      child: Center(
                                                          child: Text(
                                                        u.category[index],
                                                        style: GoogleFonts.getFont(
                                                            font.value,
                                                            color: index == 0
                                                                ? themeNotifier
                                                                            .value ==
                                                                        ThemeMode
                                                                            .light
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black
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
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Center(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Homedetail(
                                                          id: homelist[index]
                                                              .homeid,
                                                          image1:
                                                              homelist[index]
                                                                  .image1,
                                                          image2:
                                                              homelist[index]
                                                                  .image2,
                                                          image3:
                                                              homelist[index]
                                                                  .image3,
                                                          image4:
                                                              homelist[index]
                                                                  .image4,
                                                          image5:
                                                              homelist[index]
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
                                                          balcony:
                                                              homelist[index]
                                                                  .balcony,
                                                          beds: homelist[index]
                                                              .beds,
                                                          bath: homelist[index]
                                                              .bath,
                                                          sqft: homelist[index]
                                                              .sqft,
                                                          kitchen:
                                                              homelist[index]
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
                                                        )));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: h / 5.5,
                                              width: w - 16,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: themeNotifier.value ==
                                                          ThemeMode.light
                                                      ? const Color.fromARGB(
                                                          26, 229, 228, 228)
                                                      : const Color.fromARGB(
                                                          221, 52, 52, 52)),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      height: h / 4.5 - 16,
                                                      width: w / 3,
                                                      // child: Image.file(File(
                                                      //     "/data/user/0/com.example.rentalhome/cache/bf2cc479-d64e-4d54-bb28-faea86b7d3a3/1678081381416.jpg")),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        child: Image.file(
                                                          File(homelist[index]
                                                              .image1),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Spacer(),
                                                        Text(
                                                          homelist[index]
                                                              .apartment,
                                                          softWrap: true,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: GoogleFonts
                                                              .getFont(
                                                                  font.value,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                        const Spacer(),
                                                        Text(
                                                          homelist[index]
                                                              .homeaddress,
                                                          style: GoogleFonts
                                                              .getFont(
                                                                  font.value,
                                                                  color: Colors
                                                                      .grey),
                                                        ),
                                                        const Spacer(),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "₹${homelist[index].rentprice}",
                                                              style: GoogleFonts.getFont(
                                                                  font.value,
                                                                  fontSize: 20,
                                                                  color: colors
                                                                      .value,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Text(
                                                              "/month",
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                      font
                                                                          .value,
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          15),
                                                            ),
                                                            const Spacer(),
                                                            // InkWell(
                                                            //     onTap:
                                                            //         () async {
                                                            //       final db =
                                                            //           await initdatabase;
                                                            //       await db!
                                                            //           .rawInsert(
                                                            //               "insert into favorite(image1, image2, image3, image4, image5, category, blocknumber, apartment, homeaddress, hall, balcony, beds, bath, sqft, kitchen, rentprice, ownername, contactnumber, description, fbookingid, status) values('${homelist[index].image1}','${homelist[index].image2}','${homelist[index].image3}','${homelist[index].image4}','${homelist[index].image5}','${homelist[index].category}','${homelist[index].blocknumber}','${homelist[index].apartment}','${homelist[index].homeaddress}','${homelist[index].hall}','${homelist[index].balcony}','${homelist[index].beds}','${homelist[index].bath}','${homelist[index].sqft}','${homelist[index].kitchen}','${homelist[index].rentprice}','${homelist[index].ownername}','${homelist[index].contactnumber}','${homelist[index].description}','${homelist[index].homeid}',1)");
                                                            //     },
                                                            //     child: Icon(
                                                            //       Icons
                                                            //           .favorite,
                                                            //       color: colors
                                                            //           .value,
                                                            //     )
                                                            //     //  Icon(
                                                            //     //     Icons.favorite_outline,
                                                            //     //     color:
                                                            //     //         colors.value,
                                                            //     //   )
                                                            //     ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Container(
                                                                height: h / 30,
                                                                width: w / 8,
                                                                decoration: BoxDecoration(
                                                                    color: themeNotifier.value ==
                                                                            ThemeMode
                                                                                .light
                                                                        ? const Color.fromARGB(
                                                                            255,
                                                                            230,
                                                                            229,
                                                                            229)
                                                                        : const Color.fromARGB(
                                                                            221,
                                                                            65,
                                                                            65,
                                                                            65),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                child: Center(
                                                                  child: Text(
                                                                    homelist[
                                                                            index]
                                                                        .category,
                                                                    style: GoogleFonts.getFont(
                                                                        font
                                                                            .value,
                                                                        color: colors
                                                                            .value),
                                                                  ),
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
                                        ),
                                      ),
                                    ],
                                  );
                          })),
                    ),
                  )
                ],
              )),
            ),
            columnWidget: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/Addhome');
                  },
                  child: const _IconTile(
                    width: 100,
                    height: 60,
                    iconData: Icons.add_home_outlined,
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/notifications');
                  },
                  child: const _IconTile(
                    width: 60,
                    height: 60,
                    iconData: Icons.notifications_active,
                  ),
                ),
                //const SizedBox(height: 20),
                // InkWell(
                //   onTap: () {
                //     bookinglist.clear();
                //   },
                //   child: const _IconTile(
                //     width: 60,
                //     height: 60,
                //     iconData: CupertinoIcons.chat_bubble,
                //   ),
                // ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    controller.toggleDrawer();
                  },
                  child: const _IconTile(
                    width: 60,
                    height: 60,
                    iconData: CupertinoIcons.settings,
                  ),
                ),
              ],
            ),
            bottomWidget: const SizedBox(),
          )),
    );
  }
}

class _IconTile extends StatelessWidget {
  final double width;
  final double height;
  final IconData iconData;

  const _IconTile(
      {Key? key,
      required this.width,
      required this.height,
      required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 60,
      decoration: BoxDecoration(
        color: colors.value,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Icon(
        iconData,
        size: 35,
        color: themeNotifier.value == ThemeMode.light
            ? Colors.white
            : Colors.black,
      ),
    );
  }
}
