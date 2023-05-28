// ignore_for_file: avoid_types_as_parameter_names

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:rentalhome/category/myhomepage.dart';

import '../main.dart';

class Themes extends StatefulWidget {
  const Themes({super.key});

  @override
  State<Themes> createState() => _ThemesState();
}

int load = 0;

class _ThemesState extends State<Themes> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
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
        title: Text("Theme",
            style: GoogleFonts.getFont(
              font.value,
              color: themeNotifier.value == ThemeMode.light
                  ? Colors.black
                  : Colors.white,
              fontSize: 20,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    "Color",
                    style: GoogleFonts.getFont(font.value, fontSize: 25),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: themeNotifier.value == ThemeMode.light
                          ? Colors.black
                          : Colors.white,
                      child: CircleAvatar(
                        radius: 27,
                        backgroundColor: colors.value,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: h / 1.2,
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(10),
                    itemCount: u.color.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6),
                    // ignore: non_constant_identifier_names
                    itemBuilder: (BuildContext, index) {
                      return Padding(
                        padding: const EdgeInsets.all(1),
                        child: InkWell(
                          onTap: () {
                            colors.value = u.color[index];
                            setState(() {
                              load = 1;
                            });
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Mypage(),
                                ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: CircleAvatar(
                              radius: 21,
                              backgroundColor:
                                  themeNotifier.value == ThemeMode.light
                                      ? Colors.black
                                      : Colors.white,
                              child: CircleAvatar(
                                radius: 27,
                                backgroundColor: u.color[index],
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Font",
                    style: GoogleFonts.getFont(font.value, fontSize: 25),
                  ),
                  const Spacer(),
                  Text(
                    font.value,
                    style: GoogleFonts.getFont(font.value,
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                        color: colors.value),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                    height: u.height(context),
                    child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: u.name.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              font.value = u.name[index];
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Mypage(),
                                  ));
                            },
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: colors.value.withOpacity(0.5),
                                child: Text(
                                  (index + 1).toString(),
                                  style: GoogleFonts.getFont(font.value,
                                      color:
                                          themeNotifier.value == ThemeMode.light
                                              ? Colors.black
                                              : Colors.white),
                                ),
                              ),
                              title: Text(u.name[index],
                                  style: GoogleFonts.getFont(u.name[index],
                                      fontSize: 25)),
                            ),
                          );
                        },
                        separatorBuilder: ((context, index) {
                          return const Divider();
                        }))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
