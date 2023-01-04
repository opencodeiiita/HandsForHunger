import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:handsforhunger/logIn.dart';
import 'Registration.dart';
import 'donor.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = (MediaQuery.of(context).size.height),
        w = (MediaQuery.of(context).size.width);
    return Scaffold(
      backgroundColor: Color(0xffFAFAFC),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
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
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUser(User user) => Container(
        // height: 100,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: shadow,
            borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Approx ' + user.capacity + ' people',
              style: GoogleFonts.poppins(fontSize: 16),
            ),
            Text(
              user.address,
              style: GoogleFonts.poppins(fontSize: 16),
            ),
            Text(
              user.veg,
              style: GoogleFonts.poppins(),
            )
          ],
        ),
      );
}
