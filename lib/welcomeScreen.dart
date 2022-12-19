import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:handsforhunger/donor.dart';
import 'package:handsforhunger/ngo.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffFAFAFC),
        padding: EdgeInsets.only(top: 100, left: 25, right: 25),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 14,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 13),
                  height: 70,
                  width: 68,
                  child: Image.asset('images/WelcomeScreenIcon.png'),
                ),
                Txt(txt: 'Hands', colour: Color(0xff4B56FE)),
                Txt(txt: 'for', colour: Color(0xff686A8A)),
                Txt(txt: 'Hunger', colour: Color(0xff4B56FE)),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              height: 460,
              width: 330,
              margin: EdgeInsets.only(bottom: 15),
              padding: EdgeInsets.only(top: 50, left: 40, right: 40),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: shadow,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Image.asset('images/WelcomeScreenImage.png'),
                  SizedBox(height: 20),
                  Text(
                    'Improving Lives Together',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff353767)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    'Lend a hand to end hunger, with Hands',
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff67698F)),
                  )),
                  Center(
                      child: Text(
                    'for Hunger.',
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff67698F)),
                  ))
                ],
              ),
            ),
            BottomButton(txt: 'Ngo', path: NgoScreen()),
            BottomButton(txt: 'Donor', path: DonorScreen()),
          ],
        ),
      ),
    );
  }
}

class Txt extends StatelessWidget {
  Txt({required this.txt, required this.colour});
  String txt;
  Color colour;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: GoogleFonts.poppins(
          fontSize: 28, fontWeight: FontWeight.w600, color: colour),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({required this.txt, required this.path});
  String txt;
  Widget path;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => path));
      },
      child: Container(
        margin: EdgeInsets.only(top: 25),
        height: 52,
        width: 320,
        child: Center(
          child: Text(
            txt,
            style: GoogleFonts.poppins(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff4BB0FE), Color(0xff4B56FE)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
            borderRadius: BorderRadius.circular(12),
            color: Color(0xff4BB0FE)),
      ),
    );
  }
}

List<BoxShadow> shadow = [
  BoxShadow(color: Colors.grey[600]!, blurRadius: 10, offset: Offset(0, 10))
];
