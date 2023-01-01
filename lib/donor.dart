import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonorPage extends StatefulWidget {
  const DonorPage({super.key});

  @override
  State<DonorPage> createState() => _DonorPageState();
}

class _DonorPageState extends State<DonorPage> {
  final locationController = TextEditingController(),
      contactController = TextEditingController();
  late var location = "", contactNo = "";
  String Veg = "";
  double quantity = 20;
  bool veg = true, nonveg = false, k = false;
  int latitude = 0, longitude = 0;
  int capacity = 20;
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
                      onChanged: ((value) {
                        location = locationController.text;
                      }),
                      controller: locationController,
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
                      controller: contactController,
                      onChanged: (value) {
                        contactNo = contactController.text;
                      },
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
                          value: veg,
                          onChanged: (val) {
                            setState(() {
                              veg = val!;
                              if (veg == true && nonveg == true) {
                                nonveg = false;
                              }
                              Veg = "veg";
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
                          value: nonveg,
                          onChanged: (val) {
                            setState(() {
                              nonveg = val!;
                              if (veg == true && nonveg == true) {
                                veg = false;
                              }
                              Veg = "nonveg";
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
                      Txt(h: h, w: w, t: quantity.toInt().toString()),
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
                      value: quantity,
                      min: 20,
                      max: 2000,
                      onChanged: (double newvalue) {
                        setState(() {
                          quantity = newvalue;
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
                  GestureDetector(
                    onTap: () {
                      createUser(
                        veg: Veg,
                        date: selectedDate.day.toString() +
                            '/' +
                            selectedDate.month.toString() +
                            '/' +
                            selectedDate.year.toString() +
                            '/',
                        capacity: quantity.toString(),
                        latitude: latitude.toString(),
                        longitude: longitude.toString(),
                      );
                    },
                    child: Container(
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
// Stream<List<User>> readUsers() => FirebaseFirestore.instance
//     .collection('Inventory')
//     .snapshots()
//     .map((snapshot) =>
//         snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

Future createUser(
    {required String capacity,
    required String date,
    required String latitude,
    required String longitude,
    required String veg}) async {
  final docUser = FirebaseFirestore.instance.collection('Inventory').doc();
  final user = User(
    id: docUser.id,
    veg: veg,
    date: date,
    capacity: capacity,
    latitude: latitude,
    longitude: longitude,
  );
  final json = user.toJson();
  await docUser.set(json);
}

class User {
  late String id;
  final String veg, date, capacity, latitude, longitude;
  User(
      {this.id = '',
      required this.veg,
      required this.date,
      required this.capacity,
      required this.longitude,
      required this.latitude});

  Map<String, dynamic> toJson() => {
        'userid': id,
        'veg': veg,
        'capacity': capacity,
        'latitude': latitude,
        'longitude': longitude,
        'date': date
      };
  static User fromJson(Map<String, dynamic> json) => User(
      id: json['userid'],
      veg: json['veg'],
      date: json['date'],
      capacity: json['capacity'],
      latitude: json['latitude'],
      longitude: json['longitude']);
}
