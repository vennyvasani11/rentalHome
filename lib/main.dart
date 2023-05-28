import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rentalhome/category/myhomepage.dart';

import 'package:rentalhome/menu/splash.dart';

import 'package:rentalhome/utility.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding/introduction_animation_screen.dart';

Rx<Color> colors = const Color.fromARGB(255, 7, 135, 255).obs;
Rx<Color> fontcolor = Colors.black.obs;
Rx<int> dark = 0.obs;
//Rx<int> ink=0.obs;
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);
// ignore: non_constant_identifier_names
SharedPreferences? SP;
FirebaseAuth? auth;

void main() async {
  Get.put<MyDrawerController>(MyDrawerController());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            importance: NotificationImportance.High,
            channelShowBadge: true,
            playSound: true,
            enableVibration: true,
            defaultColor: colors.value,
            channelKey: 'rentalhome',
            channelName: 'rental',
            channelDescription: 'rentalhomeapplication')
      ],
      debug: true);
  auth = FirebaseAuth.instance;

  SP = await SharedPreferences.getInstance();

  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

Utility u = Utility();
Rx<String> font = 'Alata'.obs;

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return GetMaterialApp(
            darkTheme: u.darkTheme,
            theme: u.lightTheme,
            themeMode: currentMode,
            debugShowCheckedModeBanner: false,
            home: SP!.get("skip") == true
                ? const Splash()
                : const IntroductionAnimationScreen(),
            getPages: Routes.route,
          );
        });
  }
}
