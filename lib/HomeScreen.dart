import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:handsforhunger/logIn.dart';
import 'Registration.dart';
import 'donor.dart';

bool onpressed = false;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int max = 100, min = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double h = (MediaQuery.of(context).size.height),
        w = (MediaQuery.of(context).size.width);
    String dropValue = 'all';
    const List<String> filter = <String>[
      '<10',
      '11-20',
      '20-50',
      '50-100',
      '>100',
      'all'
    ];
    return Scaffold(
      drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(top: h / 15, left: w / 18),
                height: h / 3.3,
                color: Color(0xffFFC648),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                        height: h / 8,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: h / 80, bottom: h / 80),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Monty Green',
                          style: GoogleFonts.poppins(
                              fontSize: 18, color: Colors.grey[800]),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'MontyGreen@gmail.com',
                        style: GoogleFonts.merriweather(
                            fontSize: 16, color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h / 50,
              ),
              ListWidget(
                  w: w,
                  h: h,
                  icon: Icon(
                    Icons.person,
                    size: 36,
                    color: Colors.grey[600],
                  ),
                  txt: "Profile"),
              ListWidget(
                  w: w,
                  h: h,
                  icon: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.grey[600],
                  ),
                  txt: 'Search'),
              ListWidget(
                  w: w,
                  h: h,
                  icon: Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.grey[600],
                  ),
                  txt: "Filter"),
              ListWidget(
                  w: w,
                  h: h,
                  icon: Icon(
                    Icons.notifications_active,
                    size: 30,
                    color: Colors.grey[600],
                  ),
                  txt: "Logout"),
              ListWidget(
                  w: w,
                  h: h,
                  icon: Icon(
                    Icons.settings,
                    size: 30,
                    color: Colors.grey[600],
                  ),
                  txt: "Settings"),
              Padding(
                  padding: EdgeInsets.only(top: h / 20),
                  child: SizedBox(
                      child: Divider(
                    thickness: 2,
                  ))),
              Container(
                padding: EdgeInsets.only(top: h / 40, left: w / 18),
                child: Text(
                  "Other",
                  style: GoogleFonts.poppins(
                      fontSize: 20, color: Colors.grey[500]),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: h / 40, left: w / 18),
                child: Text(
                  "About us",
                  style: GoogleFonts.poppins(
                      fontSize: 20, color: Colors.grey[700]),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: h / 40, left: w / 18),
                child: Text(
                  "Privacy",
                  style: GoogleFonts.poppins(
                      fontSize: 20, color: Colors.grey[700]),
                ),
              ),
            ],
          )),
      appBar: AppBar(backgroundColor: Color(0xffFFC648)),
      backgroundColor: Color(0xffFFFCF5),
      body: Padding(
        padding: EdgeInsets.all(0),
        child: SingleChildScrollView(
          child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: w / 20, vertical: h / 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Available Food',
                    style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFFC648)),
                  ),
                  SizedBox(
                    height: h / 40,
                  ),
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.all(w / 50),
                          child: Image.asset('images/food1.png')),
                      Container(
                          padding: EdgeInsets.all(w / 50),
                          child: Image.asset('images/food1.png')),
                      Container(
                          padding: EdgeInsets.all(w / 50),
                          child: Image.asset('images/food1.png')),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Food items',
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              onpressed = !onpressed;
                            });
                          },
                          icon: Icon(
                            onpressed == true
                                ? Icons.filter_alt_rounded
                                : Icons.filter_alt_off_rounded,
                            color: Colors.grey[600],
                          )),
                    ],
                  ),
                  SizedBox(
                    height: h / 80,
                  ),
                  Row(
                    children: [
                      Container(
                        height: h / 25,
                        margin: EdgeInsets.symmetric(horizontal: w / 80),
                        padding: EdgeInsets.symmetric(horizontal: w / 60),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Color(0xffF8993F), width: 2.0),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Checkbox(value: false, onChanged: (value) => () {}),
                            Text('Veg')
                          ],
                        ),
                      ),
                      Container(
                        height: h / 25,
                        margin: EdgeInsets.symmetric(horizontal: w / 80),
                        padding: EdgeInsets.symmetric(horizontal: w / 60),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Color(0xffF8993F), width: 2.0),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Checkbox(value: false, onChanged: (value) => () {}),
                            Text('Non Veg')
                          ],
                        ),
                      ),
                      DropdownButton<String>(
                        value: dropValue,
                        items: filter
                            .map<DropdownMenuItem<String>>((String filter) {
                          return DropdownMenuItem(
                            child: Text(filter),
                            value: filter,
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            dropValue = value!;
                            if (dropValue == filter[0]) {
                              print('0');
                              max = 10;
                              min = 0;
                            }
                            if (dropValue == filter[1]) {
                              print('1');
                              max = 20;
                              min = 10;
                            }
                            if (dropValue == filter[2]) {
                              print('2');
                              max = 50;
                              min = 20;
                            }
                            if (dropValue == filter[3]) {
                              print('3');
                              max = 100;
                              min = 50;
                            }
                            if (dropValue == filter[4]) {
                              print('4');
                              max = 2000;
                              min = 100;
                            }
                            if (dropValue == filter[5]) {
                              print('5');
                              max = 2000;
                              min = 0;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                      child: HomeScreen(
                    m: max,
                    n: min,
                  ))
                ],
              )),
        ),
      ),
    );
  }
}

class ListWidget extends StatelessWidget {
  const ListWidget(
      {Key? key,
      required this.w,
      required this.h,
      required this.icon,
      required this.txt})
      : super(key: key);

  final double w;
  final double h;
  final Icon icon;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: h / 40, left: w / 18),
      child: Row(
        children: [
          icon,
          SizedBox(
            width: w / 15,
          ),
          Text(
            txt,
            style: GoogleFonts.openSans(
              fontSize: 26,
              color: Colors.grey[600],
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({required this.m, required this.n});
  int m, n;

  @override
  Widget build(BuildContext context) {
    double h = (MediaQuery.of(context).size.height),
        w = (MediaQuery.of(context).size.width);
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
              height: h,
              margin: EdgeInsets.symmetric(vertical: h / 60),
              // color: Colors.white,
              child: StreamBuilder<List<User>>(
                stream: readUsersN(m, n),
                builder: ((context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong! ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final users = snapshot.data!;
                    print('object');
                    print(m + n);
                    return ListView(
                      children: users.map(buildUser).toList(),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
              )),
        ),
      ],
    );
  }

  Widget buildUser(User user) => Container(
        // height: 100,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: shadow,
            border: Border.all(color: Color(0xffF8993F), width: 2.0),
            borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(15),
        child: Row(
          children: [
            Image.asset('images/food2.png'),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      // 'Approx ' +
                      user.capacity.toString() + ' people',
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Text(
                  user.address,
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                (user.veg == "veg")
                    ? Image.asset('images/veg.png')
                    : Image.asset('images/nonVeg.png'),
              ],
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: Color(0xffF8993F),
            )
          ],
        ),
      );
}
