import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:handsforhunger/welcomeScreen.dart';

bool pressed = false;
Icon Icn = Icon(Icons.remove_red_eye);

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override

  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  String login_email="";
  String login_password="";
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
                height: h / 13,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: Shadow,
                ),
                child: Center(
                  child: TextFormField(
                    onChanged: (value) {
                        login_email = value;
                      }

                    ,
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
                height: h / 13,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: Shadow,
                ),
                child: Center(
                  child: TextFormField(
                    onChanged: (value) {
                      login_password = value;
                    },
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
              BottomButton(

                  txt: 'Login', path: LogInPage(), h: h, w: w , text : login_email , password: login_password,

              ),
              SizedBox(
                height: h / 30,
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
              SizedBox(
                height: h / 40,
              ),
              Text(
                'Sign Up With Google',
                style: GoogleFonts.inter(
                    fontSize: w / 25,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff67698F)),
              ),
              SizedBox(
                height: h / 40,
              ),
              RichText(
                text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: GoogleFonts.inter(
                        fontSize: h / 60,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff67698F)),
                    children: [
                      
                      TextSpan(
                        text: 'Sign up!',
                        style: GoogleFonts.poppins(
                            fontSize: h / 60,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff67698E)),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

}


class BottomButton extends StatelessWidget {
  BottomButton(
      {required this.txt,
        required this.path,
        required this.h,
        required this.w,
        required this.text,
        required this.password});
  double h, w;
  String txt,text,password;
  Widget path;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(text==""){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Please enter Email or Phone Number"),
          ));
        }
        else if (password==""){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Please enter password"),
          ));
        }
        else
        Navigator.push(context, MaterialPageRoute(builder: (context) => path));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          margin: EdgeInsets.only(top: 20),
          height: h / 14,
          width: w / 1.18,
          child: Center(
            child: Text(
              txt,
              style: GoogleFonts.poppins(
                  fontSize: w / 24.5,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffFFDA94), Color(0xffFF942F)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              borderRadius: BorderRadius.circular(12),
              color: Color(0xff4BB0FE)),
        ),
      ),
    );
  }
}

List<BoxShadow> shadow = [
  BoxShadow(color: Colors.grey, blurRadius: 10, offset: Offset(0, 10))
];

List<BoxShadow> Shadow = [
  BoxShadow(color: Colors.grey[300]!, blurRadius: 10, offset: Offset(0, 10))
];



