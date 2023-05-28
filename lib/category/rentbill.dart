import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rentalhome/features.dart';
import 'package:rentalhome/main.dart';
import 'package:rentalhome/menu/pdf.dart';

// ignore: must_be_immutable
class Rentbill extends StatefulWidget {
  String id;
  String customername;
  String customernumber;
  String price;
  String address;
  String ownername;
  String category;
  String mobile;
  String start;
  String end;
  int totlprice;

  Rentbill(
      {required this.price,
      required this.customername,
      required this.customernumber,
      required this.start,
      required this.end,
      required this.totlprice,
      required this.address,
      required this.id,
      required this.ownername,
      required this.category,
      required this.mobile,
      super.key});

  @override
  State<Rentbill> createState() => _RentbillState();
}

class _RentbillState extends State<Rentbill> {
  int loading = 0;
  Feathures f = Feathures();
  TextEditingController startdate = TextEditingController();
  TextEditingController enddate = TextEditingController();
  TextEditingController customername = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController customernumber = TextEditingController();
  TextEditingController ownername = TextEditingController();
  TextEditingController ownernumber = TextEditingController();
  TextEditingController totlpayment = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController category = TextEditingController();
  Directory directory = Directory('/storage/emulated/0/Pictures/Rentalhome');
  GlobalKey previewContainers = GlobalKey();
  @override
  void initState() {
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }
    super.initState();
  }

  DateTime d = DateTime.now();
  @override
  Widget build(BuildContext context) {
    customername.text = widget.customername;
    customernumber.text = widget.customernumber;
    ownername.text = widget.ownername;
    ownernumber.text = widget.mobile;
    address.text = widget.address;
    startdate.text = widget.start;
    enddate.text = widget.end;
    price.text = "${widget.price}/-";
    totlpayment.text = "${widget.totlprice.toString()}/-";
    category.text = widget.category;

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
            child: RepaintBoundary(
              key: previewContainers,
              child: Container(
                color: Colors.white,
                height: h,
                width: w,
                child: Column(
                  children: [
                    SizedBox(
                      height: h / 40,
                    ),
                    Row(
                      children: [
                        Container(
                          height: h / 12,
                          width: w / 5.5,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "asset/images/ic_launcher.png"))),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "INVOICE",
                                style: GoogleFonts.getFont(font.value,
                                    color: colors.value, fontSize: 28),
                              ),
                              Text(
                                "Date: ${d.day.toString()}/${d.month.toString()}/${d.year.toString()}",
                                style: GoogleFonts.getFont(font.value,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: h / 40,
                    ),
                    Row(
                      children: [
                        Container(
                          width: w / 2 - 5,
                          padding: const EdgeInsets.all(4.0),
                          child: TextFormField(
                            enabled: false,
                            controller: customername,
                            decoration: InputDecoration(
                              filled: true,
                              suffixStyle: GoogleFonts.getFont(font.value,
                                  color: colors.value),
                              labelText: " Customer Name ",
                              labelStyle: GoogleFonts.getFont(font.value,
                                  fontSize: 13, color: colors.value),
                              fillColor: Colors.white,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 242, 241, 241),
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Container(
                          width: w / 2 - 5,
                          padding: const EdgeInsets.all(4.0),
                          child: TextFormField(
                            textCapitalization: TextCapitalization.words,
                            enabled: false,
                            controller: ownername,
                            decoration: InputDecoration(
                              suffixStyle: GoogleFonts.getFont(font.value,
                                  fontSize: 13, color: colors.value),
                              labelText: " Owner Name ",
                              labelStyle: GoogleFonts.getFont(font.value,
                                  fontSize: 13, color: colors.value),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 242, 241, 241),
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: w / 2 - 5,
                          padding: const EdgeInsets.all(4.0),
                          child: TextFormField(
                            enabled: false,
                            controller: customernumber,
                            decoration: InputDecoration(
                              labelText: "Mobile Number",
                              labelStyle: GoogleFonts.getFont(font.value,
                                  fontSize: 13, color: colors.value),
                              fillColor: Colors.white,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 242, 241, 241),
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Container(
                          width: w / 2 - 5,
                          padding: const EdgeInsets.all(4.0),
                          child: TextFormField(
                            enabled: false,
                            controller: ownernumber,
                            decoration: InputDecoration(
                              labelText: "Mobile Number",
                              labelStyle: GoogleFonts.getFont(font.value,
                                  fontSize: 13, color: colors.value),
                              fillColor: Colors.white,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 242, 241, 241),
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        enabled: false,
                        maxLines: 3,
                        controller: address,
                        decoration: InputDecoration(
                          labelText: "Address",
                          labelStyle: GoogleFonts.getFont(font.value,
                              fontSize: 13, color: colors.value),
                          fillColor: Colors.white,
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 242, 241, 241),
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: w / 2 - 5,
                          padding: const EdgeInsets.all(4.0),
                          child: TextFormField(
                            enabled: false,
                            controller: price,
                            decoration: InputDecoration(
                              labelText: "Rent Price",
                              labelStyle: GoogleFonts.getFont(font.value,
                                  fontSize: 13, color: colors.value),
                              fillColor: Colors.white,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 242, 241, 241),
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Container(
                          width: w / 2 - 5,
                          padding: const EdgeInsets.all(4.0),
                          child: TextFormField(
                            enabled: false,
                            controller: category,
                            decoration: InputDecoration(
                              labelText: "Category",
                              labelStyle: GoogleFonts.getFont(font.value,
                                  fontSize: 13, color: colors.value),
                              fillColor: Colors.white,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 242, 241, 241),
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: w / 2 - 5,
                          padding: const EdgeInsets.all(4.0),
                          child: TextFormField(
                            enabled: false,
                            controller: startdate,
                            decoration: InputDecoration(
                              labelText: "Start Date",
                              labelStyle: GoogleFonts.getFont(font.value,
                                  fontSize: 13, color: colors.value),
                              fillColor: Colors.white,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 242, 241, 241),
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Container(
                          width: w / 2 - 5,
                          padding: const EdgeInsets.all(4.0),
                          child: TextFormField(
                            enabled: false,
                            controller: enddate,
                            decoration: InputDecoration(
                              labelText: "end date",
                              labelStyle: GoogleFonts.getFont(font.value,
                                  fontSize: 13, color: colors.value),
                              fillColor: Colors.white,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 242, 241, 241),
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        enabled: false,
                        controller: totlpayment,
                        decoration: InputDecoration(
                          labelText: "Total Amount",
                          labelStyle: GoogleFonts.getFont(font.value,
                              color: colors.value),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 242, 241, 241),
                            ),
                          ),
                          fillColor: Colors.white,
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: w / 2,
                            height: h / 4.8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Spacer(
                                  flex: 5,
                                ),
                                Text(
                                  "Terms & conditions",
                                  style: GoogleFonts.getFont(font.value,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Text(
                                  "Payment should be paid with the valid date if not extra amount should be paid.",
                                  maxLines: 2,
                                  style: GoogleFonts.getFont(font.value,
                                      fontSize: 10),
                                ),
                                const Spacer(
                                  flex: 1,
                                ),
                                Text(
                                  "Payment Information",
                                  style: GoogleFonts.getFont(font.value,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Text(
                                  "We accept for only cash Payment.",
                                  style: GoogleFonts.getFont(font.value,
                                      fontSize: 10),
                                ),
                                Text(
                                  "We not accept for online Payment",
                                  maxLines: 2,
                                  style: GoogleFonts.getFont(font.value,
                                      fontSize: 10),
                                ),
                                const Spacer(
                                  flex: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 9,
                        ),
                        Text(
                          "Rental Home Signature",
                          style: GoogleFonts.getFont(font.value,
                              color: colors.value, fontSize: 12),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 15,
                    ),
                  ],
                ),
              ),
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
      )),
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
                takeScreenShot();
                setState(() {
                  loading = 1;
                });
              },
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: colors.value),
                      height: h / 20,
                      width: w / 2.5,
                      child: const Center(
                          child: Text(
                        'Get Recipt',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )))))
        ],
      ),
    );
  }

  Future<void> takeScreenShot() async {
    final RenderRepaintBoundary boundary = previewContainers.currentContext!
        .findRenderObject() as RenderRepaintBoundary;

    final image = await boundary.toImage(pixelRatio: 5.0);

    final ByteData? byteData =
        await image.toByteData(format: ImageByteFormat.png);

    final Uint8List pngBytes = byteData!.buffer.asUint8List();

    File imgFile = File(
        '/storage/emulated/0/Pictures/Rentalhome/image${d.millisecond}.jpg');
    await imgFile.writeAsBytes(pngBytes);
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
    // ignore: use_build_context_synchronously
    setState(() {
      loading = 0;
    });
    // ignore: use_build_context_synchronously
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Pdf(
              path:
                  '/storage/emulated/0/Pictures/Rentalhome/image${d.millisecond}.jpg'),
        ));
  }
}
