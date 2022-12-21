import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:handsforhunger/welcomeScreen.dart';

bool pressed = false;
Icon Icn = Icon(Icons.remove_red_eye);

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    double h = (MediaQuery.of(context).size.height),
        w = (MediaQuery.of(context).size.width);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffFAFAFC),
          padding: EdgeInsets.only(
              top: h / 9, bottom: h / 15, left: w / 16, right: w / 16),
          child: Column(
            children: [
              TopText(),
              SizedBox(
                height: h / 25,
              ),
              Row(
                children: [
                  SizedBox(
                    width: w / 18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      textAlign: TextAlign.left,
                      'Log In',
                      style: GoogleFonts.poppins(
                          fontSize: w / 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff4B56FE)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h / 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: h / 80),
                height: h / 17,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: Shadow,
                ),
                child: Center(
                  child: TextFormField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email or Phone Number',
                        hintStyle: GoogleFonts.poppins(
                            fontSize: w / 25, color: Colors.grey[500]),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey[500],
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: h / 35,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: h / 80),
                height: h / 17,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: Shadow,
                ),
                child: Center(
                  child: TextFormField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      hintStyle: GoogleFonts.poppins(
                          fontSize: w / 25, color: Colors.grey[500]),
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: Colors.grey[500],
                      ),
                      suffixIcon: IconButton(
                          icon: Icn,
                          color: Colors.grey[500],
                          onPressed: () {
                            setState(() {
                              pressed = !pressed;
                            });
                          }),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h / 15,
              ),
              Text(
                'or',
                style: GoogleFonts.inter(
                    fontSize: w / 28, color: Color(0xffABAEB0)),
              ),
              SizedBox(
                height: h / 20,
              ),
              BottomButton(
                  txt: 'Get Started', path: WelcomeScreen(), h: h, w: w),
              SizedBox(
                height: h / 30,
              ),
              Text(
                'Forgot Password',
                style: GoogleFonts.poppins(
                    fontSize: w / 28,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff67698F)),
              ),
              SizedBox(
                height: h / 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: w / 20),
                child: Row(
                  children: [
                    SizedBox(
                        width: w / 3,
                        height: h / 50,
                        child: Divider(
                          thickness: 1.5,
                        )),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: w / 30),
                      child: Text(
                        'or',
                        style: GoogleFonts.inter(
                            fontSize: w / 28,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff67698F)),
                      ),
                    ),
                    SizedBox(
                        width: w / 3,
                        height: h / 50,
                        child: Divider(
                          thickness: 1.5,
                        )),
                  ],
                ),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: w / 7, vertical: h / 40),
                child: Row(
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: GoogleFonts.inter(
                          fontSize: h / 60,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff67698F)),
                    ),
                    Text(
                      'Sign up!',
                      style: GoogleFonts.poppins(
                          fontSize: h / 60,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff67698E)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<BoxShadow> Shadow = [
  BoxShadow(color: Colors.grey[300]!, blurRadius: 10, offset: Offset(0, 10))
];
