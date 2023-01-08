import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:handsforhunger/logIn.dart';
import 'Registration.dart';
import 'donor.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = (MediaQuery.of(context).size.height),
        w = (MediaQuery.of(context).size.width);
    return Scaffold(
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
                  Text(
                    'Food items',
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w500),
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
                            Icon(
                              Icons.sort,
                              color: Colors.grey,
                            ),
                            Text('People')
                          ],
                        ),
                      )
                    ],
                  ),
                  SingleChildScrollView(
                    child: HomeScreen(),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                stream: readUsers(),
                builder: ((context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong! ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final users = snapshot.data!;
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
                      user.capacity + ' people',
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
