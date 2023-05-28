import 'dart:io';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:rentalhome/sqflite/sqflitecontroller.dart';

import '../main.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  void initState() {
    init();
    super.initState();
  }

  int load = 0;
  init() async {
    await notificationdata();
    setState(() {
      load = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: themeNotifier.value == ThemeMode.light
                  ? Colors.black
                  : Colors.white,
            )),
        title: Text(
          "Notification",
          style: GoogleFonts.getFont(font.value,
              color: themeNotifier.value == ThemeMode.light
                  ? Colors.black
                  : Colors.white,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SizedBox(
        child: ListView.builder(
          itemCount: notificationlist.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 221, 221, 221))),
                child: ListTile(
                  leading: Container(
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: const Color.fromARGB(255, 221, 221, 221)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.file(
                          File(notificationlist[index].notificationphoto),
                          fit: BoxFit.cover,
                        )),
                  ),
                  title: Text(
                    notificationlist[index].notificationtitle,
                    style: GoogleFonts.getFont(font.value, fontSize: 18),
                  ),
                  subtitle: Text(
                    notificationlist[index].notificationsubtitle,
                    style: GoogleFonts.getFont(font.value, color: Colors.grey),
                  ),
                  trailing: Text(
                    notificationlist[index].notificationtime,
                    style: GoogleFonts.getFont(font.value,
                        fontSize: 12, color: Colors.grey),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
