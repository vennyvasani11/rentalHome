import 'package:rentalhome/main.dart';
import 'package:rentalhome/sqflite/sqflitemodel.dart';
import 'package:rentalhome/sqflite/sqflitetable.dart';

//------------------------ login --------------------------

final loginlist = <SqlLogin>[];

logindata(String gmail) async {
  final db = await initdatabase;
  List<Map> alldata = await db!
      .rawQuery("select * from login where login.loginemail Like '$gmail'");
  loginlist.clear();
  for (var data in alldata) {
    SqlLogin finaldata = SqlLogin.fromMap(data);
    loginlist.add(finaldata);
  }
}

//------------------------ City --------------------------

final homelist = <Sqlhome>[];

Future<void> homedata() async {
  final db = await initdatabase;
  List<Map> alldata = await db!.rawQuery("select * from home");
  homelist.clear();
  for (var data in alldata) {
    Sqlhome finaldata = Sqlhome.fromMap(data);
    homelist.add(finaldata);
  }
}

///-----------------------------5home------------------------------

final fivehomelist = <Sqlhome>[];

homefivedata() async {
  final db = await initdatabase;
  List<Map> alldata =
      await db!.rawQuery("select * from home order by homeid desc limit 5");
  fivehomelist.clear();
  for (var data in alldata) {
    Sqlhome finaldata = Sqlhome.fromMap(data);
    fivehomelist.add(finaldata);
  }
}
// //------------------------ booking --------------------------

final bookinglist = <SqlBooking>[];

bookingdata() async {
  final db = await initdatabase;
  List<Map> alldata = await db!.rawQuery("select * from booking");
  bookinglist.clear();
  for (var data in alldata) {
    SqlBooking finaldata = SqlBooking.fromMap(data);
    bookinglist.add(finaldata);
  }
}

// //------------------------ house --------------------------

final houselist = <Sqlhome>[];

Future<void> housedata(String category) async {
  final db = await initdatabase;
  List<Map> alldata = await db!
      .rawQuery("select * from home where home.category Like '$category'");
  houselist.clear();
  for (var data in alldata) {
    Sqlhome finaldata = Sqlhome.fromMap(data);
    houselist.add(finaldata);
  }
}

// //------------------------ BusinessType --------------------------

final favouritelist = <Sqlfavourite>[];

favouritedata() async {
  final db = await initdatabase;
  List<Map> alldata = await db!.rawQuery("select * from favorite");
  favouritelist.clear();
  for (var data in alldata) {
    Sqlfavourite finaldata = Sqlfavourite.fromMap(data);
    favouritelist.add(finaldata);
  }
}

Future<void> init() async {
  await homedata();
  await homefivedata();
  await favouritedata();
  await logindata(SP!.get("gmail").toString());
}
// where favorite.fbookingid Like '$id'

final notificationlist = <Sqlnotification>[];

notificationdata() async {
  final db = await initdatabase;
  List<Map> alldata = await db!
      .rawQuery("select * from notification order by notificationid desc");
  notificationlist.clear();
  for (var data in alldata) {
    Sqlnotification finaldata = Sqlnotification.fromMap(data);
    notificationlist.add(finaldata);
  }
}
