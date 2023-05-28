import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rentalhome/features.dart';
import 'package:rentalhome/main.dart';
import 'package:rentalhome/menu/notification.dart';
import 'package:rentalhome/new%20accounnt/forgetotp.dart';
import 'category/addhome.dart';
import 'category/bhk2.dart';
import 'category/bhk3.dart';
import 'category/favourite.dart';
import 'category/homedetail.dart';
import 'category/house.dart';
import 'category/myhomepage.dart';
import 'category/villa.dart';
import 'menu/bookingnow.dart';
import 'menu/editprofile.dart';
import 'menu/mybooking.dart';
import 'menu/myhome.dart';
import 'menu/splash.dart';
import 'menu/theme.dart';
import 'new accounnt/alllogin.dart';
import 'new accounnt/forgetpassword.dart';
import 'new accounnt/login.dart';
import 'new accounnt/newaccount.dart';
import 'new accounnt/newpassword.dart';
import 'new accounnt/otp.dart';
import 'new accounnt/verifymobile.dart';
import 'onboarding/introduction_animation_screen.dart';

class Utility {
  Feathures f = Feathures();
  Allpermission all = Allpermission();
  List category = ["✅ All", "🏠︎ House", "🌇 Villa", "🏠︎ 2BHK", "🏠︎ 3BHK"];

  snackbar(String title, subtitle) {
    return Get.snackbar(title, subtitle,
        titleText: Text(
          title,
          style: GoogleFonts.getFont(font.value,
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        messageText: Text(
          subtitle,
          style: GoogleFonts.getFont(
            font.value,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        icon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset("asset/images/ic_launcher.png")),
          ),
        ),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        colorText: Colors.white,
        backgroundColor: colors.value.withOpacity(0.7));
  }

  tile(String title, var icon) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 15,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage("asset/images/booking.png"),
      ),
      title: Text(
        title,
        style: GoogleFonts.getFont(
          font.value,
        ),
      ),
      trailing: Icon(icon),
    );
  }

  List name = [
    'Alata',
    'Poppins',
    'Raleway',
    'Roboto Slab',
    'Nunito',
    'Rubik',
    'Josefin Sans',
    'Bitter',
    'Pacifico',
    'Satisfy',
    'Vollkorn',
    'Alice',
    'Laila',
    'Damion',
    'Spectral',
    'Signika',
    'Play',
    'Permanent Marker',
    'Chakra Petch',
    'Rhodium Libre'
  ];
  height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: font.value,
    primarySwatch: generateMaterialColor(primary.blue.value),
    scaffoldBackgroundColor: Colors.black,
    backgroundColor: Colors.black,
    primaryColor: Colors.black,
    toggleableActiveColor: Colors.blue,
  );

  ThemeData lightTheme = ThemeData(
    //scaffoldBackgroundColor: Colors.white,
    fontFamily: font.value,
    primarySwatch: generateMaterialColor(primary.blue.value),
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    primaryColor: Colors.white,
    //toggleableActiveColor: Colors.blue,
  );
  List color = [
    Colors.red.shade100,
    Colors.red.shade300,
    Colors.red.shade500,
    Colors.red.shade700,
    Colors.red.shade900,
    Colors.red.shade900.withOpacity(0.7),
    Colors.orange.shade100,
    Colors.orange.shade300,
    Colors.orange.shade500,
    Colors.orange.shade700,
    Colors.orange.shade900,
    Colors.orange.shade900.withOpacity(0.7),
    Colors.yellow.shade100,
    Colors.yellow.shade300,
    Colors.yellow.shade500,
    Colors.yellow.shade700,
    Colors.yellow.shade900,
    Colors.yellow.shade900.withOpacity(0.7),
    Colors.green.shade100,
    Colors.green.shade200,
    Colors.green.shade500,
    Colors.green.shade700,
    Colors.green.shade900,
    Colors.green.shade900.withOpacity(0.7),
    Colors.cyan.shade100,
    Colors.cyan.shade300,
    Colors.cyan.shade500,
    Colors.cyan.shade700,
    Colors.cyan.shade900,
    Colors.cyan.shade900.withOpacity(0.7),
    Colors.blue.shade100,
    Colors.blue.shade300,
    Colors.blue.shade500,
    const Color.fromARGB(255, 7, 135, 255),
    Colors.blue.shade700,
    Colors.blue.shade900.withOpacity(0.7),
    Colors.indigo.shade100,
    Colors.indigo.shade300,
    Colors.indigo.shade500,
    Colors.indigo.shade700,
    Colors.indigo.shade900,
    Colors.indigo.shade900.withOpacity(0.7),
    Colors.purple.shade100,
    Colors.purple.shade300,
    Colors.purple.shade500,
    Colors.purple.shade700,
    Colors.purple.shade900,
    Colors.purple.shade900.withOpacity(0.7),
    Colors.pink.shade100,
    Colors.pink.shade300,
    Colors.pink.shade500,
    Colors.pink.shade700,
    Colors.pink.shade900,
    Colors.pink.shade900.withOpacity(0.7),
    Colors.brown.shade100,
    Colors.brown.shade300,
    Colors.brown.shade500,
    Colors.brown.shade700,
    Colors.brown.shade900,
    Colors.brown.shade900.withOpacity(0.7),
    Colors.grey.shade100,
    Colors.grey.shade300,
    Colors.grey.shade500,
    Colors.grey.shade700,
    Colors.grey.shade900,
    Colors.grey.shade900.withOpacity(0.7),
  ];
  themedata(context, dynamic colorsvalue) {
    return InkWell(
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/MyHomePage');
          colors.value = colorsvalue;
        },
        child: CircleAvatar(
          radius: 21,
          backgroundColor: themeNotifier.value == ThemeMode.light
              ? Colors.black
              : Colors.white,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: colorsvalue,
          ),
        ));
  }
}

// ignore: camel_case_types
class primary {
  static Rx<Color> blue = colors.value.obs;
}

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);
////---------------------------------------------------------------
//---------------------------------------------------------------
bool? spermission; // main ma banavi nakho
bool? conpermission;
bool? campermission;

// ignore: camel_case_types
class Allpermission {
  Future permission() async {
    if (await Permission.storage.request().isGranted) {
      spermission = true;
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      spermission = false;
    }
  }

  Future camerapermission() async {
    if (await Permission.camera.request().isGranted) {
      campermission = true;
    } else if (await Permission.camera.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.camera.request().isDenied) {
      campermission = false;
    }
  }

  Future contactpermission() async {
    if (await Permission.contacts.request().isGranted) {
      conpermission = true;
    } else if (await Permission.contacts.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.contacts.request().isDenied) {
      conpermission = false;
    }
  }
}

class Routes {
  static final route = [
    GetPage(
        name: '/IntroductionAnimationScreen',
        page: () => const IntroductionAnimationScreen()),
    GetPage(name: '/Alllogin', page: () => const Alllogin()),
    GetPage(name: '/newaccount', page: () => const Newaccount()),
    GetPage(name: '/Login', page: () => const Login()),
    GetPage(name: '/Forgetpassword', page: () => const Forgetpassword()),
    GetPage(
        name: '/otp',
        page: () => const Otp(
              vc: "",
              number: "",
            )),
    GetPage(name: '/ password', page: () => const Newpassword()),
    GetPage(
        name: '/homedetail',
        page: () => Homedetail(
              id: 0,
              image1: "",
              image2: "",
              image3: "",
              image4: "",
              image5: "",
              category: "",
              blocknumber: "",
              apartment: "",
              homeaddress: "",
              hall: "",
              balcony: "",
              beds: "",
              bath: "",
              sqft: "",
              kitchen: "",
              rentprice: "",
              ownername: "",
              contactnumber: "",
              description: "",
            )),
    GetPage(name: '/House', page: () => const House()),
    GetPage(name: '/villa', page: () => const Villa()),
    GetPage(name: '/BHK2', page: () => const BHKtwo()),
    GetPage(name: '/BHK3', page: () => const BHK3()),
    GetPage(name: '/favourite', page: () => const Favourite()),
    GetPage(name: '/mybooking', page: () => const Mybooking()),
    GetPage(name: '/MyHomePage', page: () => Mypage()),
    GetPage(name: '/MenuScreen', page: () => const MenuScreen()),
    GetPage(name: '/Addhome', page: () => const Addhome()),
    GetPage(name: '/myhome', page: () => const Myhome()),
    GetPage(name: '/notifications', page: () => const Notifications()),
    GetPage(
        name: '/bookingnow',
        page: () => Bookingnow(
              address: "",
              category: "",
              id: "",
              mobile: "",
              name: "",
              ownername: "",
              photo: "",
              price: "",
            )),
    GetPage(name: '/splash', page: () => const Splash()),
    GetPage(name: '/verifymobile', page: () => const Verifymobile()),
    GetPage(
        name: '/forgetotp',
        page: () => const Forgetotp(
              vc: " ",
              number: " ",
            )),
    GetPage(name: '/editprofile', page: () => const Editprofile()),
    GetPage(name: '/theme', page: () => const Themes()),
  ];
}
