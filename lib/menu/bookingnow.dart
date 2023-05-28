import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentalhome/category/rentbill.dart';
import 'package:rentalhome/main.dart';
import 'package:rentalhome/sqflite/sqflitetable.dart';
import 'package:rentalhome/utility.dart';

import '../sqflite/sqflitecontroller.dart';

// ignore: must_be_immutable
class Bookingnow extends StatefulWidget {
  String photo;
  String price;
  String name;
  String address;
  String id;
  String ownername;
  String category;
  String mobile;

  Bookingnow(
      {required this.photo,
      required this.price,
      required this.name,
      required this.address,
      required this.id,
      required this.ownername,
      required this.category,
      required this.mobile,
      super.key});

  @override
  State<Bookingnow> createState() => _BookingnowState();
}

DateTime today = DateTime.now();
int e = 0;

class _BookingnowState extends State<Bookingnow> {
  TextEditingController startdate = TextEditingController();
  TextEditingController enddate = TextEditingController();
  TextEditingController customername = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController number = TextEditingController();
  Utility u = Utility();
  DateTimeRange daterange =
      DateTimeRange(start: DateTime.now(), end: DateTime(2023, 04, 30));
  @override
  void initState() {
    customername.clear();
    number.clear();
    init();
    super.initState();
  }

  init() async {
    await homedata();
  }

  @override
  Widget build(BuildContext context) {
    price.text = '${widget.price}/-';

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
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
          title: Text("Book Rent Home",
              style: GoogleFonts.getFont(
                font.value,
                color: Colors.black,
                fontSize: 20,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Information details",
                style: GoogleFonts.getFont(font.value, fontSize: 20),
              ),
              Container(
                height: h / 5.5,
                width: w - 16,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: themeNotifier.value == ThemeMode.light
                        ? const Color.fromARGB(26, 159, 156, 156)
                        : const Color.fromARGB(221, 52, 52, 52)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: h / 4.5 - 16,
                        width: w / 2.5,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 112, 112, 112),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            File(widget.photo),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Text(
                            widget.name,
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.getFont(font.value,
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text(
                            widget.address,
                            style: GoogleFonts.getFont(font.value,
                                color: Colors.grey),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                "₹${widget.price}",
                                style: GoogleFonts.getFont(font.value,
                                    fontSize: 20,
                                    color: colors.value,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "/month",
                                style: GoogleFonts.getFont(font.value,
                                    color: Colors.grey, fontSize: 15),
                              ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  textCapitalization: TextCapitalization.words,
                  controller: customername,
                  decoration: InputDecoration(
                    labelText: " Customer Name ",
                    labelStyle:
                        GoogleFonts.getFont(font.value, color: colors.value),

                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: colors.value,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: colors.value,
                      ),
                    ),
                    //fillColor: Colors.green
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLength: 10,
                  controller: number,
                  decoration: InputDecoration(
                    labelText: " Mobile number ",
                    labelStyle:
                        GoogleFonts.getFont(font.value, color: colors.value),

                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: colors.value,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: colors.value,
                      ),
                    ),
                    //fillColor: Colors.green
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  enabled: false,
                  controller: price,
                  decoration: InputDecoration(
                    labelText: " Rent Price ",
                    labelStyle:
                        GoogleFonts.getFont(font.value, color: colors.value),

                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: colors.value,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: colors.value,
                      ),
                    ),
                    //fillColor: Colors.green
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              InkWell(
                onTap: () {
                  pickdaterange();
                  setState(() {
                    int a = daterange.duration.inDays;
                    int b = 30;
                    double c;
                    int d = int.parse(widget.price);

                    c = a / b;

                    e = d * c.toInt();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    enabled: false,
                    controller: startdate,
                    decoration: InputDecoration(
                      labelText: " Start Date ",
                      labelStyle:
                          GoogleFonts.getFont(font.value, color: colors.value),

                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: colors.value,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: colors.value,
                        ),
                      ),
                      //fillColor: Colors.green
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  pickdaterange();
                  setState(() {
                    int a = daterange.duration.inDays;
                    int b = 30;
                    double c;
                    int d = int.parse(widget.price);

                    c = a / b;

                    e = d * c.toInt();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    enabled: false,
                    controller: enddate,
                    decoration: InputDecoration(
                      labelText: " End Date ",
                      labelStyle:
                          GoogleFonts.getFont(font.value, color: colors.value),

                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: colors.value,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: colors.value,
                        ),
                      ),
                      //fillColor: Colors.green
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              // Text('Diffrence:${diffrence.inDays} Days'),
              const Spacer(),
              Row(
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
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                      onTap: () async {
                        bookinginsert();
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Rentbill(
                                  price: widget.price,
                                  customername: customername.text,
                                  customernumber: number.text,
                                  start: startdate.text,
                                  end: enddate.text,
                                  totlprice: e,
                                  address: widget.address,
                                  id: widget.id,
                                  ownername: widget.ownername,
                                  category: widget.category,
                                  mobile: widget.mobile),
                            ));
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
                                'Confirm',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )))))
                ],
              ),
            ],
          ),
        ));
  }

  bookinginsert() async {
    final db = await initdatabase;
    await db!.rawInsert(
        "insert into booking(image1, category, address, ownername, ownernumber, customername, customernumber, startdate, enddate, totlpayment) values('${widget.photo}','${widget.category}','${widget.address}','${widget.ownername}','${widget.mobile}','${customername.text}','${number.text}','${startdate.text}','${enddate.text}',${e.toInt()})");
    await db.rawDelete("delete from home where homeid=${widget.id}");
    u.snackbar("Rent Home", "Booking SuccessFully");
  }

  Future pickdaterange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
        initialEntryMode: DatePickerEntryMode.calendar,
        builder: (context, child) {
          return Theme(
            data: themeNotifier.value == ThemeMode.light
                ? u.lightTheme
                : u.darkTheme,
            child: child!,
          );
        },
        errorInvalidRangeText: "Invalid Date",
        context: context,
        initialDateRange: daterange,
        firstDate: DateTime.now(),
        lastDate: DateTime(2025));

    if (newDateRange == null) return;
    setState(() {
      daterange = newDateRange;

      if (daterange.duration.inDays >= 30) {
        startdate.text =
            '${daterange.start.day}/${daterange.start.month}/${daterange.start.year}';
        enddate.text =
            '${daterange.end.day}/${daterange.end.month}/${daterange.end.year}';

        setState(() {
          int a = daterange.duration.inDays;
          int b = 30;
          double c;
          int d = int.parse(widget.price);

          c = a / b;

          e = d * c.toInt();
        });
      } else {
        u.snackbar("Invalid Date", "Please Select Date");
      }
    });
  }
}
//  onTap: () {
//                         int a = diffrence.inDays;
//                         int b = 30;
//                         double c;
//                         int d = 7000;
//                         double e;

//                         c = a / b;
//                         print(c);

//                         e = d * c;
//                         print(e);

//                         print("sussecc");
//                       },