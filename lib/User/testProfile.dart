import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_food/User/userProvider.dart';
import 'package:smart_food/User/wave.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<UserProvider>(
        builder: (context, userProvider, _) {
          if (userProvider.user != null) {
            print('=======');
            print(userProvider.user!.last_name);

// Cắt ngày và giờ thành hai phần riêng biệt
            String date = userProvider.user!.createdAt.substring(0, 10);
            String time = userProvider.user!.createdAt.substring(11, 19);

// Chuyển đổi ngày thành định dạng 'dd-mm-yyyy'
            String day = date.substring(8, 10);
            String month = date.substring(5, 7);
            String year = date.substring(0, 4);
            String formattedDate = '$day/$month/$year';

// Tạo chuỗi đầu ra với định dạng mới
            String output = '$time $formattedDate';

            return Stack(
              children: [
                Positioned(
                  child: ClipPath(
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
                      height: size.height / 2.5,
                    ),
                    clipper: WaveClipper(),
                  ),
                ),
                Positioned(
                  child: Column(
                    children: [
                      Container(
                        height: size.height / 5,
                      ),
                      SizedBox(
                        child: CircleAvatar(
                          radius: size.width / 5,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: size.width / 5 / 4.5,
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 15.0,
                                  color: Color(0xFF404040),
                                ),
                              ),
                            ),
                            radius: size.width / 5.5,
                            backgroundImage:
                                NetworkImage(userProvider.user!.photo),
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: size.height / 30),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: size.width / 8,
                                height: 10,
                              ),
                              Icon(
                                Icons.person_2_outlined,
                                size: 24,
                                color: Color(0xff005AA7),
                              ),
                              Container(
                                width: size.width / 8,
                                height: 10,
                              ),
                              Text(
                                userProvider.user!.first_name +
                                    ' ' +
                                    userProvider.user!.last_name,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 138, 137, 137),
                                    fontSize: 18),
                              )
                            ]),
                      ),
                      Container(
                        height: 1,
                        width: size.width,
                        color: Colors.black,
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: size.height / 30),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: size.width / 8,
                                height: 10,
                              ),
                              Icon(
                                Icons.mail_outline,
                                size: 24,
                                color: Color(0xff005AA7),
                              ),
                              Container(
                                width: size.width / 8,
                                height: 10,
                              ),
                              Text(
                                userProvider.user!.email,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 138, 137, 137),
                                    fontSize: 18),
                              )
                            ]),
                      ),
                      Container(
                        height: 1,
                        width: size.width,
                        color: Colors.black,
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: size.height / 30),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: size.width / 8,
                                height: 10,
                              ),
                              Icon(
                                Icons.phone_outlined,
                                size: 24,
                                color: Color(0xff005AA7),
                              ),
                              Container(
                                width: size.width / 8,
                                height: 10,
                              ),
                              Text(
                                userProvider.user!.phoneNumber,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 138, 137, 137),
                                    fontSize: 18),
                              )
                            ]),
                      ),
                      Container(
                        height: 1,
                        width: size.width,
                        color: Colors.black,
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: size.height / 30),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: size.width / 8,
                                height: 10,
                              ),
                              Icon(
                                Icons.timer_outlined,
                                size: 24,
                                color: Color(0xff005AA7),
                              ),
                              Container(
                                width: size.width / 8,
                                height: 10,
                              ),
                              Text(
                                output,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 138, 137, 137),
                                    fontSize: 18),
                              )
                            ]),
                      ),
                      Container(
                        height: 1,
                        width: size.width,
                        color: Colors.black,
                      ),
                    ],
                  ),
                )
              ],
            );
          } else {
            return Text("Please login first");
          }
        },
      ),
    );
  }
}
