import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_otp/email_otp.dart';

import 'Registration.dart';
import 'welcomeScreen.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

late String _txt = "";
late String _OTP = "";

class _VerifyState extends State<Verify> {
  EmailOTP myauth = EmailOTP();

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
                      'Verification',
                      style: GoogleFonts.poppins(
                          fontSize: w / 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffFFBA25)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h / 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: h / 80),
                padding: EdgeInsets.only(left: w / 80),
                height: h / 13,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: Shadow,
                ),
                child: Center(
                  child: TextFormField(
                    onChanged: (value) {
                      _txt = value;
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                        hintStyle: GoogleFonts.poppins(
                            fontSize: w / 25, color: Colors.grey[500]),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey[500],
                        )),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: () async {
                      myauth.setConfig(
                          appEmail: "me@rohitchouhan.com",
                          appName: "Email OTP",
                          userEmail: _txt,
                          otpLength: 6,
                          otpType: OTPType.digitsOnly);
                      if (await myauth.sendOTP() == true) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("OTP has been sent"),
                        ));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Oops, OTP send failed"),
                        ));
                      }
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: w / 15, vertical: h / 80),
                        child: Text(
                          'SendOtp',
                        ))),
              ),
              SizedBox(
                height: h / 35,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: h / 80),
                height: h / 13,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: Shadow,
                ),
                child: Center(
                  child: TextFormField(
                    onChanged: (value) {
                      _OTP = value;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'OTP',
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
              GestureDetector(
                onTap: () async {
                  setState(() async {
                    if (await myauth.verifyOTP(otp: _OTP) == true) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("OTP is verified"),
                      ));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Registpage()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Invalid OTP"),
                      ));
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    height: h / 14,
                    width: w / 1.18,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0xffFFDA94), Color(0xffFF942F)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xff4BB0FE)),
                    child: Center(
                      child: Text(
                        'Verify',
                        style: GoogleFonts.poppins(
                            fontSize: w / 24.5,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
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
