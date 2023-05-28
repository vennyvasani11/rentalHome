import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
}

// ignore: non_constant_identifier_names
Database? Rentalhome;

Future<Database?> get initdatabase async {
  if (Rentalhome != null) {
    return Rentalhome;
  }

  Rentalhome = await initDB();
  return Rentalhome;
}

initDB() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();

  String path = "${documentsDirectory.path}/rentalhome.db";

  return await openDatabase(path, version: 1, onOpen: (db) {},
      onCreate: (Database db, int version) async {
    await db.execute("CREATE TABLE login("
        "loginid INTEGER PRIMARY KEY AUTOINCREMENT,"
        "loginname TEXT,"
        "loginpassword TEXT,"
        "loginmobile TEXT,"
        "loginemail TEXT,"
        "loginphoto TEXT"
        ")");

    await db.execute("CREATE TABLE home("
        "homeid INTEGER PRIMARY KEY AUTOINCREMENT,"
        "image1 TEXT,"
        "image2 TEXT,"
        "image3 TEXT,"
        "image4 TEXT,"
        "image5 TEXT,"
        "category TEXT,"
        "blocknumber TEXT,"
        "apartment TEXT,"
        "homeaddress TEXT,"
        "hall TEXT,"
        "balcony TEXT,"
        "beds TEXT,"
        "bath TEXT,"
        "sqft TEXT,"
        "kitchen TEXT,"
        "rentprice TEXT,"
        "ownername TEXT,"
        "contactnumber TEXT,"
        "description TEXT"
        ")");

    await db.execute("CREATE TABLE booking("
        "bookingid INTEGER PRIMARY KEY AUTOINCREMENT,"
        "category TEXT,"
        "image1 TEXT,"
        "ownername TEXT,"
        "ownernumber TEXT,"
        "customername TEXT,"
        "customernumber TEXT,"
        "startdate TEXT,"
        "enddate TEXT,"
        "totlpayment TEXT,"
        "address INTEGER"
        ")");

    await db.execute("CREATE TABLE favorite("
        "favoriteid INTEGER PRIMARY KEY AUTOINCREMENT,"
        "image1 TEXT,"
        "image2 TEXT,"
        "image3 TEXT,"
        "image4 TEXT,"
        "image5 TEXT,"
        "category TEXT,"
        "blocknumber TEXT,"
        "apartment TEXT,"
        "homeaddress TEXT,"
        "hall TEXT,"
        "balcony TEXT,"
        "beds TEXT,"
        "bath TEXT,"
        "sqft TEXT,"
        "kitchen TEXT,"
        "rentprice TEXT,"
        "ownername TEXT,"
        "contactnumber TEXT,"
        "description TEXT,"
        "fbookingid INTEGER,"
        "status INTEGER,"
        "FOREIGN KEY (fbookingid) REFERENCES home(homeid)"
        ")");

    await db.execute("CREATE TABLE notification("
        "notificationid INTEGER PRIMARY KEY AUTOINCREMENT,"
        "notificationtitle TEXT,"
        "notificationphoto TEXT,"
        "notificationsubtitle TEXT,"
        "notificationtime TEXT"
        ")");
  });
}
