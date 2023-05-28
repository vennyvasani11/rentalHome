import 'dart:convert';

SqlLogin sqlloginFromJson(String str) {
  final jsonData = json.decode(str);
  return SqlLogin.fromMap(jsonData);
}

String sqlloginToJson(SqlLogin data) {
  final dm = data.toMap();
  return json.encode(dm);
}

class SqlLogin {
  int loginid;
  String loginname;
  String loginmobile;
  String loginpassword;
  String loginemail;
  String loginphoto;

  static final columns = [
    "loginid",
    "loginname",
    "loginmobile",
    "loginpassword",
    "loginemail",
    "loginphoto"
  ];

  SqlLogin(
      {required this.loginid,
      required this.loginname,
      required this.loginmobile,
      required this.loginpassword,
      required this.loginemail,
      required this.loginphoto});

  factory SqlLogin.fromMap(Map<dynamic, dynamic> json) => SqlLogin(
        loginid: json["loginid"],
        loginname: json["loginname"],
        loginmobile: json["loginmobile"],
        loginpassword: json["loginpassword"],
        loginemail: json["loginemail"],
        loginphoto: json["loginphoto"],
      );

  Map<dynamic, dynamic> toMap() => {
        "loginid": loginid,
        "loginname": loginname,
        "loginmobile": loginmobile,
        "loginpassword": loginpassword,
        "loginemail": loginemail,
        "loginphoto": loginphoto,
      };
}

//---------------------- Home --------------------------

Sqlhome sqlhomeFromJson(String str) {
  final jsonData = json.decode(str);
  return Sqlhome.fromMap(jsonData);
}

String sqlhomeToJson(Sqlhome data) {
  final dm = data.toMap();
  return json.encode(dm);
}

class Sqlhome {
  int homeid;
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

  static final columns = [
    "homeid",
    "image1",
    "image2",
    "image3",
    "image4",
    "image5",
    "category",
    "blocknumber",
    "apartment",
    "homeaddress",
    "hall",
    "balcony",
    "beds",
    "bath",
    "sqft",
    "kitchen",
    "rentprice",
    "ownername",
    "contactnumber",
    "description"
  ];

  Sqlhome(
      {required this.homeid,
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
      required this.description});

  factory Sqlhome.fromMap(Map<dynamic, dynamic> json) => Sqlhome(
      homeid: json["homeid"],
      image1: json["image1"],
      image2: json["image2"],
      image3: json["image3"],
      image4: json["image4"],
      image5: json["image5"],
      category: json["category"],
      blocknumber: json["blocknumber"],
      apartment: json["apartment"],
      homeaddress: json["homeaddress"],
      hall: json["hall"],
      balcony: json["balcony"],
      beds: json["beds"],
      bath: json["bath"],
      sqft: json["sqft"],
      kitchen: json["kitchen"],
      rentprice: json["rentprice"],
      ownername: json["ownername"],
      contactnumber: json["contactnumber"],
      description: json["description"]);

  Map<String, dynamic> toMap() => {
        "homeid": homeid,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "image4": image4,
        "image5": image5,
        "category": category,
        "blocknumber": blocknumber,
        "apartment": apartment,
        "homeaddress": homeaddress,
        "hall": hall,
        "balcony": balcony,
        "beds": beds,
        "bath": bath,
        "sqft": sqft,
        "kitchen": kitchen,
        "rentprice": rentprice,
        "ownername": ownername,
        "contactnumber": contactnumber,
        "description": description
      };
}

// //---------------------- booking --------------------------

SqlBooking sqlbookingFromJson(String str) {
  final jsonData = json.decode(str);
  return SqlBooking.fromMap(jsonData);
}

String sqlbookingToJson(SqlBooking data) {
  final dm = data.toMap();
  return json.encode(dm);
}

class SqlBooking {
  int bookingid;
  String category;
  String image1;
  String ownername;
  String ownernumber;
  String customername;
  String customernumber;
  String startdate;
  String enddate;
  String totlpayment;
  String address;

  static final columns = [
    "bookingid",
    "category",
    "image1",
    "ownername",
    "ownernumber",
    "customername",
    "customernumber",
    "startdate",
    "enddate",
    "totlpayment",
    "address"
  ];

  SqlBooking(
      {required this.bookingid,
      required this.category,
      required this.customername,
      required this.customernumber,
      required this.enddate,
      required this.address,
      required this.ownername,
      required this.ownernumber,
      required this.image1,
      required this.startdate,
      required this.totlpayment});

  factory SqlBooking.fromMap(Map<dynamic, dynamic> json) => SqlBooking(
      bookingid: json["bookingid"],
      category: json["category"],
      customername: json["customername"],
      customernumber: json["customernumber"],
      enddate: json["enddate"],
      address: json["address"],
      ownername: json["ownername"],
      ownernumber: json["ownernumber"],
      image1: json["image1"],
      startdate: json["startdate"],
      totlpayment: json["totlpayment"]);

  Map<String, dynamic> toMap() => {
        "bookingid": bookingid,
        "category": category,
        "customername": customername,
        "customernumber": customernumber,
        "enddate": enddate,
        "address": address,
        "ownername": ownername,
        "ownernumber": ownernumber,
        "image1": image1,
        "startdate": startdate,
        "totlpayment": totlpayment
      };
}

// //---------------------- favourite --------------------------

Sqlfavourite sqlfavouriteFromJson(String str) {
  final jsonData = json.decode(str);
  return Sqlfavourite.fromMap(jsonData);
}

String sqlfavouriteToJson(Sqlhome data) {
  final dm = data.toMap();
  return json.encode(dm);
}

class Sqlfavourite {
  int favoriteid;
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
  int fbookingid;

  int status;

  static final columns = [
    "favoriteid",
    "image1",
    "image2",
    "image3",
    "image4",
    "image5",
    "category",
    "blocknumber",
    "apartment",
    "homeaddress",
    "hall",
    "balcony",
    "beds",
    "bath",
    "sqft",
    "kitchen",
    "rentprice",
    "ownername",
    "contactnumber",
    "description",
    "fbookingid",
    "status"
  ];

  Sqlfavourite(
      {required this.favoriteid,
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
      required this.fbookingid,
      required this.status});

  factory Sqlfavourite.fromMap(Map<dynamic, dynamic> json) => Sqlfavourite(
      favoriteid: json["favoriteid"],
      image1: json["image1"],
      image2: json["image2"],
      image3: json["image3"],
      image4: json["image4"],
      image5: json["image5"],
      category: json["category"],
      blocknumber: json["blocknumber"],
      apartment: json["apartment"],
      homeaddress: json["homeaddress"],
      hall: json["hall"],
      balcony: json["balcony"],
      beds: json["beds"],
      bath: json["bath"],
      sqft: json["sqft"],
      kitchen: json["kitchen"],
      rentprice: json["rentprice"],
      ownername: json["ownername"],
      contactnumber: json["contactnumber"],
      description: json["description"],
      fbookingid: json["fbookingid"],
      status: json["status"]);

  Map<String, dynamic> toMap() => {
        "favoriteid": favoriteid,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "image4": image4,
        "image5": image5,
        "category": category,
        "blocknumber": blocknumber,
        "apartment": apartment,
        "homeaddress": homeaddress,
        "hall": hall,
        "balcony": balcony,
        "beds": beds,
        "bath": bath,
        "sqft": sqft,
        "kitchen": kitchen,
        "rentprice": rentprice,
        "ownername": ownername,
        "contactnumber": contactnumber,
        "description": description,
        "fbookingid": fbookingid,
        "status": status
      };
}

//-------------------------notification------------

Sqlnotification sqlnotificationFromJson(String str) {
  final jsonData = json.decode(str);
  return Sqlnotification.fromMap(jsonData);
}

String sqlnotificationToJson(SqlLogin data) {
  final dm = data.toMap();
  return json.encode(dm);
}

class Sqlnotification {
  int notificationid;
  String notificationtitle;
  String notificationphoto;
  String notificationsubtitle;
  String notificationtime;

  static final columns = [
    "notificationid",
    "notificationtitle",
    "notificationphoto",
    "notificationsubtitle",
    "notificationtime"
  ];

  Sqlnotification(
      {required this.notificationid,
      required this.notificationtitle,
      required this.notificationphoto,
      required this.notificationsubtitle,
      required this.notificationtime});

  factory Sqlnotification.fromMap(Map<dynamic, dynamic> json) =>
      Sqlnotification(
          notificationid: json["notificationid"],
          notificationtitle: json["notificationtitle"],
          notificationphoto: json["notificationphoto"],
          notificationsubtitle: json["notificationsubtitle"],
          notificationtime: json["notificationtime"]);

  Map<dynamic, dynamic> toMap() => {
        "notificationid": notificationid,
        "notificationtitle": notificationtitle,
        "notificationphoto": notificationphoto,
        "notificationsubtitle": notificationsubtitle,
        "notificationtime": notificationtime
      };
}
