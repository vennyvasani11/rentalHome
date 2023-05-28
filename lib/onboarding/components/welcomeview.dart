import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rentalhome/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

User? user;
GoogleService service = GoogleService();

class WelcomeView extends StatefulWidget {
  final AnimationController animationController;
  const WelcomeView({Key? key, required this.animationController})
      : super(key: key);
  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  void initState() {
    super.initState();
    initSP();
  }

  initSP() async {
    SP = await SharedPreferences.getInstance();
    // how to get value of variable in shared_preferences
  }

  @override
  Widget build(BuildContext context) {
    final firstHalfAnimation =
        Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: const Interval(
          0.6,
          0.8,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final secondHalfAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-1, 0))
            .animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: const Interval(
          0.8,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    final welcomeFirstHalfAnimation =
        Tween<Offset>(begin: const Offset(2, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: const Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    final welcomeImageAnimation =
        Tween<Offset>(begin: const Offset(4, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: const Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return SlideTransition(
      position: firstHalfAnimation,
      child: SlideTransition(
        position: secondHalfAnimation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 2),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/MyHomePage');
                      },
                      child: Text(
                        "Skip",
                        style: GoogleFonts.getFont(font.value,
                            fontSize: 15,
                            color: colors.value,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h / 14,
              ),
              SlideTransition(
                position: welcomeImageAnimation,
                child: Center(
                  child: Container(
                    height: h / 3,
                    width: w / 1.5,
                    decoration: const BoxDecoration(
                        //color: Colors.amber,
                        image: DecorationImage(
                            image: AssetImage("asset/lottie/lottie-1.png"))),
                  ),
                ),
              ),
              SlideTransition(
                position: welcomeFirstHalfAnimation,
                child: Text(
                  "Let's you in",
                  style: GoogleFonts.getFont(font.value,
                      letterSpacing: 2,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: h / 30,
              ),
              InkWell(
                onTap: () async {
                  GoogleService g = GoogleService();
                  await g.googlelogin();

                  // ignore: use_build_context_synchronously
                  Navigator.pushNamed(context, '/verifymobile');
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: h / 18,
                    width: w - 50,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 206, 205, 205)),
                        //color: colors.value,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                              "asset/animation/38870-google-logo-effect.json"),
                          Text(
                            "Continue with Google",
                            style: GoogleFonts.getFont(font.value,
                                fontSize: 15, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h / 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
                child: SizedBox(
                  //color: Colors.black,
                  height: 50,
                  width: w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        //color: Colors.amber,
                        height: 30,
                        width: w / 2.5,
                        child: const Center(
                          child: Divider(
                            color: Color.fromARGB(255, 182, 182, 182),
                            thickness: 2,
                            indent: 10,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "or",
                          style: GoogleFonts.getFont(
                            font.value,
                            fontSize: 21,
                          ),
                        ),
                      ),
                      SizedBox(
                        //color: Colors.amber,
                        height: 30,
                        width: w / 2.5,
                        child: const Divider(
                          color: Color.fromRGBO(182, 182, 182, 1),
                          thickness: 2,
                          endIndent: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GoogleService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String?> signInwithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    await _auth.signInWithCredential(credential);
    return null;
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  googlelogin() async {
    await service.signInwithGoogle();
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      SP!.setBool("skip", true);
      SP!.setString("photo", user!.photoURL!);
      SP!.setString("name", user!.displayName!);
      SP!.setString("gmail", user!.email!);
    }
  }
}
