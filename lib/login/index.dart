import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_food/color.dart';
import 'package:smart_food/loadpage/index.dart';
import 'package:smart_food/login/view/input.dart';
import 'package:smart_food/login/view/wave.dart';
import 'package:smart_food/register/index.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String _username, _password;
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.75,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    decoration:   BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                         
                          const Color.fromARGB(255, 88, 214, 95),
                           ColorApp,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.1,
                  child: FadeInLeft(
                    child: Column(
                      children: [
                        SizedBox(
                          width: size.height * 0.2434782608695652,
                          height: size.height * 0.2186335403726708,
                          child: Image.asset(
                            'img/logo.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        FieldInput(
                           check: false,
                          textInputType: TextInputType.number,
                            text: "Số điện thoại",
                            icon: Icon(
                              Icons.person,
                              color:  ColorApp,
                            )),
                        SizedBox(height: size.height * 0.03),
                        FieldInput(
                           check: true,
                          textInputType: TextInputType.text,
                            text: "Mật khẩu",
                            icon: Icon(
                              Icons.lock,
                              color:  ColorApp,
                            )),
                        SizedBox(height: size.height * 0.05),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadPage()));
                          },
                          child: Text('Đăng nhập'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1CD1DD),
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Bạn quên mật khẩu?',
                              style: GoogleFonts.roboto(
                                  color: Colors.white, fontSize: 14),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonLogIn(
                    text: "Facebook",
                    icon: Icon(Icons.facebook), 
                    color: Color(0xFF35A6EF),
                  ),
                  ButtonLogIn(
                      text: "Google   ",
                      icon: Icon(Icons.chrome_reader_mode_outlined),
                      color: Color(0xFF5073B5)),
                ]),
          ),
          SizedBox(height: size.height * 0.01),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Register()),
                );
              },
              child: Text(
                'Bạn chưa có tài khoản? Đăng ký',
                style:
                    GoogleFonts.roboto(color: Color(0xFF6A74CF), fontSize: 14),
              ))
        ],
      ),
    );
  }
}
