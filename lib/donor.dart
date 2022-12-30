import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class DonorPage extends StatefulWidget {
  const DonorPage({super.key});

  @override
  State<DonorPage> createState() => _DonorPageState();
}

class _DonorPageState extends State<DonorPage> {
  bool i = true, j = false, k = false;
  DateTime selectedDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime.now(),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        selectedDate = value!;
      });
    });

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
  }

  @override
  double val = 20;
  Widget build(BuildContext context) {
    double h = (MediaQuery.of(context).size.height),
        w = (MediaQuery.of(context).size.width);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: h,
            width: w,
            child: Image.asset(
              'images/donor_background.png',
              fit: BoxFit.fill,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                left: w / 20,
                right: w / 20,
                top: h / 5.9,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Donate Food Details',
                        style: GoogleFonts.poppins(
                            fontSize: 25,
                            // decoration: TextDirection.,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFFC648)),
                      ),
                    ],
                  ),
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: w / 25,
                        ),
                        Text(
                          'Location',
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: w / 25),
                    child: TextFormField(
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: h / 100),
                    child: Row(
                      children: [
                        SizedBox(
                          width: w / 25,
                        ),
                        Text(
                          'Contact No.',
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: w / 25),
                    child: TextFormField(
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Txt(h: h, w: w, t: "Veg/Non Veg"),
                  Row(
                    children: [
                      SizedBox(
                        width: w / 25,
                      ),
                      Image.asset('images/veg.png'),
                      SizedBox(
                        width: w / 10,
                      ),
                      Checkbox(
                          value: i,
                          onChanged: (val) {
                            setState(() {
                              i = val!;
                              print(i);
                              if (i == true && j == true) {
                                j = false;
                              }
                            });
                          }),
                      SizedBox(
                        width: w / 10,
                      ),
                      Image.asset('images/nonVeg.png'),
                      SizedBox(
                        width: w / 10,
                      ),
                      Checkbox(
                          value: j,
                          onChanged: (val) {
                            setState(() {
                              j = val!;
                              if (i == true && j == true) {
                                i = false;
                              }
                            });
                          }),
                      SizedBox(
                        width: w / 10,
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Txt(h: h, w: w, t: "Use by Date"),
                  Row(
                    children: [
                      SizedBox(
                        width: w / 25,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectDate(context);
                            print('object');
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: w / 25),
                          height: h / 25,
                          width: w / 2.5,
                          decoration: BoxDecoration(
                              color: Color(0xffFFC648),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Text(
                                selectedDate.day.toString() +
                                    '/' +
                                    selectedDate.month.toString() +
                                    '/' +
                                    selectedDate.year.toString(),
                                style: GoogleFonts.inter(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: w / 40,
                              ),
                              Icon(Icons.calendar_month)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Row(
                    children: [
                      Txt(h: h, w: w, t: "Quantity :"),
                      Txt(h: h, w: w, t: val.toInt().toString()),
                      Txt(h: h, w: w, t: "persons"),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xffffc648),
                      inactiveTrackColor: Colors.grey,
                      thumbColor: Color(0xffffc648),
                      overlayColor: Color.fromARGB(255, 250, 216, 142),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 24.0),
                    ),
                    child: Slider(
                      value: val,
                      min: 20,
                      max: 2000,
                      onChanged: (double newvalue) {
                        setState(() {
                          val = newvalue;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w / 18),
                    child: Row(
                      children: [
                        Text(
                          'Min 20',
                          style: GoogleFonts.poppins(
                              fontSize: 10, fontWeight: FontWeight.w200),
                        ),
                        Expanded(child: Container()),
                        Text(
                          'Max 2000',
                          style: GoogleFonts.poppins(
                              fontSize: 10, fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Txt(h: h, w: w, t: 'Photos'),
                  Row(
                    children: [
                      Container(
                        height: h / 8,
                        width: w / 3,
                        child: Image.asset('images/food.png'),
                      ),
                      Container(
                        height: h / 14,
                        width: w / 4,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: Color(0xffffc648))),
                        child: Icon(
                          Icons.add,
                          size: h / 20,
                          color: Color(0xffffc648),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: k,
                          onChanged: (val) {
                            setState(() {
                              k = val!;
                            });
                          }),
                      Text(
                        'I assure that the food quality and hygiene has been \nmaintained',
                        style: GoogleFonts.poppins(
                            fontSize: 10, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  Container(
                    height: h / 25,
                    width: w / 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffffc648)),
                    child: Center(
                      child: Text(
                        'Submit',
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Txt extends StatelessWidget {
  const Txt({
    Key? key,
    required this.h,
    required this.w,
    required this.t,
  }) : super(key: key);

  final double h;
  final double w;
  final String t;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: h / 100, top: h / 100),
      child: Row(
        children: [
          SizedBox(
            width: w / 25,
          ),
          Text(
            t,
            style:
                GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
