import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_food/color.dart';
import 'package:smart_food/login/index.dart';
import 'package:smart_food/login/view/input.dart';
import 'package:smart_food/login/view/wave.dart';
import 'package:smart_food/register/view/success.dart';

import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _phoneController = TextEditingController();
 final TextEditingController _passwordController = TextEditingController();
 final TextEditingController _emailController = TextEditingController();

 
  String _errorMessage = '';
  final _formKey = GlobalKey<FormState>();
  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _errorMessage = '';
      });

      final String apiUrl = 'http://14.225.205.198:8989/auth/register';

      final response = await http.post(Uri.parse(apiUrl), body: {
        'phoneNumber': _phoneController.text,
        'password': _passwordController.text,
        'email': _emailController.text,
        'roleId': "23551088-2422-4083-91b8-8d3870e67526"
      });

      if (response.statusCode == 201) {
        // Xử lý đăng ký thành công
        // Nếu API trả về thông tin người dùng, có thể lấy thông tin đó và chuyển hướng đến trang thông tin cá nhân
        // Nếu không có thông tin trả về, có thể hiển thị thông báo thành công và chuyển hướng đến trang đăng nhập
        print('Đăng ký thành công');
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Success(),
            ));
      } else {
        // Xử lý lỗi phản hồi API
        setState(() {
          print("==============================");
          print(response.statusCode);
          print("==============================");
          print(response.body);
          print("==============================");
          _errorMessage = 'Đăng ký thất bại, vui lòng thử lại!';
        });
      }

      setState(() {
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    String? selectedOption;

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
                      child: Form(
                        key: _formKey,
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
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: FieldInput(
                                // validator: validatePhoneNumber,
                                check: false,
                                textInputType: TextInputType.numberWithOptions(),
                                text: "Số điện thoại",
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.green.shade300,
                                ),
                                controller: _phoneController,
                              ),
                            ),
                           // SizedBox(height: size.height * 0.03),
                            Container(
                               padding: EdgeInsets.symmetric(vertical: 10),
                              child: FieldInput(
                              //  validator: validatePassword,
                                check: true,
                                textInputType: TextInputType.text,
                                text: "Mật khẩu",
                                icon: Icon(
                                  Icons.lock,
                                  color: Colors.green.shade300,
                                ),
                                controller: _passwordController,
                              ),
                            ),
                            Container(
                               padding: EdgeInsets.symmetric(vertical: 10),
                              child: FieldInput(
                              //  validator: validateEmail,
                                check: false,
                                textInputType: TextInputType.text,
                                text: "Gmail",
                                icon: Icon(
                                  Icons.mail,
                                  color: Colors.green.shade300,
                                ),
                                controller: _emailController,
                              ),
                            ),
                            SizedBox(height: size.height * 0.01),
                            SizedBox(height: size.height * 0.02),
                            ElevatedButton(
                              onPressed: _submitForm,
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
                            if (_errorMessage.isNotEmpty)
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  _errorMessage,
                                  style: TextStyle(
                                    color: Colors.red,
                                    
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            SizedBox(height: size.height *0.03),
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
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 12),
                                ))
                          ],
                        ),
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
