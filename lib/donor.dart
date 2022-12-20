import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DonorScreen extends StatelessWidget {
  const DonorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: Text(
          'DonorScreen',
          style: GoogleFonts.poppins(
              fontSize: 40,
              fontWeight: FontWeight.w600,
              color: Color(0xff4B56FE)),
        ),
      )),
    );
    ;
  }
}
