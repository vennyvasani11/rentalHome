import 'dart:io';
import 'package:lottie/lottie.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:rentalhome/main.dart';
import 'package:rentalhome/menu/mybooking.dart';

// ignore: must_be_immutable
class Pdf extends StatefulWidget {
  String path;
  Pdf({required this.path, super.key});

  @override
  State<Pdf> createState() => _PdfState();
}

class _PdfState extends State<Pdf> {
  int loading = 0;
  DateTime d = DateTime.now();
  final pdf = pw.Document();
  final directory = Directory('/storage/emulated/0/Documents/Rentalhome');
  @override
  void initState() {
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }
    setState(() {});
    super.initState();
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
        title: Text("Create PDF",
            style: GoogleFonts.getFont(font.value,
                fontSize: 20, color: Colors.black)),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                const Spacer(),
                Container(
                    height: h / 1.2,
                    width: w / 1.1,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 240, 239, 239),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 2,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    child: Image.file(
                      File(widget.path),
                      fit: BoxFit.fill,
                    )),
                const Spacer()
              ],
            ),
          ),
          loading == 1
              ? Container(
                  height: h,
                  width: w,
                  color: Colors.white.withOpacity(0.5),
                  child: Center(
                      child: Lottie.asset("asset/animation/loading.json")))
              : const SizedBox(),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.withOpacity(0.4)),
                height: h / 20,
                width: w / 2.5,
                child: const Center(
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
              onTap: () {
                setState(() {
                  loading = 1;
                });
                if (loading == 1) {
                  createpdf();
                }
              },
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: loading == 1
                              ? colors.value.withOpacity(0.5)
                              : colors.value),
                      height: h / 20,
                      width: w / 2.5,
                      child: const Center(
                          child: Text(
                        'PDF',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )))))
        ],
      ),
    );
  }

  Future<void> createpdf() async {
    final image = pw.MemoryImage(File(widget.path).readAsBytesSync());

    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(child: pw.Image(image));
      },
    ));
    try {
      final file = File(
          '/storage/emulated/0/Documents/Rentalhome/Rent${d.millisecond}.pdf');
      await file.writeAsBytes(await pdf.save());
      u.snackbar("PDF Saved",
          "'/storage/emulated/0/Documents/Rentalhome/Rent${d.millisecond}.pdf'");
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      setState(() {
        loading = 0;
      });
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Mybooking(),
          ));
    } catch (e) {
      e.toString();
    }
  }

  savepdf() async {
    try {
      final file = File(
          '/storage/emulated/0/Documents/Rentalhome/Rent${d.millisecond}.pdf');
      await file.writeAsBytes(await pdf.save());
      // u.snackbar("PDF Saved",
      //     "'/storage/emulated/0/Documents/Rentalhome/Rent${d.millisecond}.pdf'");
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      setState(() {
        loading = 0;
      });
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Mybooking(),
          ));
    } catch (e) {
      e.toString();
    }
  }
}
