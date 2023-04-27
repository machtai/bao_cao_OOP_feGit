import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_food/color.dart';
import 'package:smart_food/login/index.dart';
import 'package:smart_food/login/view/input.dart';
import 'package:smart_food/login/view/wave.dart';
import 'package:smart_food/register/view/success.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // int selectedRadio = 0; // khởi tạo giá trị ban đầu cho biến selectedRadio
    String? selectedOption;
    // void setSelectedRadio(int val) {
    //   initState() {
    //     setState(() {
    //       selectedRadio = val;
    //     });
    //   }
    // }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.9,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 117, 225, 121),
                            ColorApp
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.1,
                    child: FadeInRight(
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
                              textInputType: TextInputType.numberWithOptions(),
                              text: "Số điện thoại",
                              icon: Icon(
                                Icons.person,
                                color: Colors.green.shade300,
                              )),
                          SizedBox(height: size.height * 0.03),
                          FieldInput(
                              check: true,
                              textInputType: TextInputType.text,
                              text: "Mật khẩu",
                              icon: Icon(
                                Icons.lock,
                                color: Colors.green.shade300,
                              )),
                          SizedBox(height: size.height * 0.03),
                          FieldInput(
                              check: true,
                              textInputType: TextInputType.text,
                              text: "Nhập lại mật khẩu",
                              icon: Icon(
                                Icons.lock,
                                color: Colors.green.shade300,
                              )),
                          SizedBox(height: size.height * 0.03),
                          FieldInput(
                              check: false,
                              textInputType: TextInputType.text,
                              text: "Gmail",
                              icon: Icon(
                                Icons.mail,
                                color: Colors.green.shade300,
                              )),
                          SizedBox(height: size.height * 0.01),
                          Text('Chọn vai trò: ',
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        Container(
                          height: 200,
                          width: double.infinity,
                          child: Row(
                        
                              children: <Widget>[
                                Flexible(
                                  child: RadioListTile(
                                    title: Text('Nhà hàng'),
                                    value: 'option1',
                                    groupValue: selectedOption,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedOption = value;
                                      });
                                    },
                                  ),
                                ),
                                Flexible(
                                  child: RadioListTile(
                                    title: Text('Nông trại'),
                                    value: 'option2',
                                    groupValue: selectedOption,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedOption = value;
                                      });
                                    },
                                  ),
                                ),
                                Flexible(
                                  child: RadioListTile(
                                    title: Text('Khác'),
                                    value: 'option3',
                                    groupValue: selectedOption,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedOption = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                        ),
                          SizedBox(height: size.height * 0.02),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Success(),
                                  ));
                            },
                            child: Text('Đăng ký'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF1CD1DD),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 80),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()),
                                );
                              },
                              child: Text(
                                'Bạn đã có tài khoản? Đăng nhập',
                                style: GoogleFonts.roboto(
                                    color: Color.fromARGB(255, 112, 126, 255),
                                    fontSize: 12),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
