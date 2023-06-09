import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_food/color.dart';
import 'package:smart_food/loadpage/index.dart';
import 'package:smart_food/login/view/input.dart';
import 'package:smart_food/login/view/wave.dart';
import 'package:smart_food/register/index.dart';
import 'package:http/http.dart' as http;

import '../User/testProfile.dart';
import '../User/userModal.dart';
import '../User/userProvider.dart';
import '../homepage/index.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  String _errorMessage = '';

  void _submitForm() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    const String apiUrl = 'http://14.225.205.198:8989/auth/login';

    try {
      final response = await http.post(Uri.parse(apiUrl), body: {
        'phoneNumber': _phoneController.text,
        'password': _passwordController.text,
      });

      if (response.statusCode == 201) {
        // Lấy thông tin truy cập từ phản hồi API

        final responseData = json.decode(response.body);
        print(responseData);
        final String accessToken = responseData['access_token'];

        final String refreshToken = responseData['refresh_token'];

        // Lưu thông tin truy cập vào UserProvider
        Provider.of<UserProvider>(context, listen: false)
            .setTokens(accessToken, refreshToken);

        // Lấy thông tin người dùng từ phản hồi API và lưu vào UserProvider
        final UserModel user = UserModel(
          phoneNumber: _phoneController.text,
          email: responseData['data']['email'] ?? '',
          first_name: responseData['data']['first_name'] ?? '',
          last_name: responseData['data']['last_name'],
          photo: responseData['data']['photo'] ?? '',
          createdAt: responseData['data']['createdAt'] ?? '',
        );

        Provider.of<UserProvider>(context, listen: false).setUser(user);

        // Chuyển hướng đến màn hình Profile
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => RestaurantPage()),
        );
      } else {
        // Xử lý lỗi phản hồi API
        setState(() {
          _errorMessage = 'Đăng nhập thất bại, vui lòng thử lại!';
        });
      }
    } catch (error) {
      // Xử lý lỗi kết nối mạng
      setState(() {
        print(error);
        _errorMessage =
            'Không thể kết nối đến máy chủ, vui lòng kiểm tra kết nối Internet và thử lại!';
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: size.height * 0.75,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipPath(
                      clipper: WaveClipper(),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff005AA7),
                              Color(0xffFFFDE4),
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
                                //  validator: validatePhoneNumber,
                                controller: _phoneController,
                                check: false,
                                textInputType: TextInputType.number,
                                text: "Số điện thoại",
                                icon: Icon(
                                  Icons.person,
                                  color: ColorApp,
                                )),
                            SizedBox(height: size.height * 0.03),
                            FieldInput(
                                //  validator: validatePassword,
                                controller: _passwordController,
                                check: true,
                                textInputType: TextInputType.text,
                                text: "Mật khẩu",
                                icon: Icon(
                                  Icons.lock,
                                  color: ColorApp,
                                )),
                            SizedBox(height: size.height * 0.05),
                            if (_isLoading)
                              const Center(
                                child: CircularProgressIndicator(),
                              )
                            else
                              ElevatedButton(
                                onPressed: _submitForm,
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
                    style: GoogleFonts.roboto(
                        color: Color(0xFF6A74CF), fontSize: 14),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
