import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NgoScreen extends StatelessWidget {
  const NgoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: Text(
          'NgoScreen',
          style: GoogleFonts.poppins(
              fontSize: 40,
              fontWeight: FontWeight.w600,
              color: Color(0xff4B56FE)),
        ),
      )),
    );
  }
}
