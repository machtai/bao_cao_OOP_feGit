import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_food/color.dart';
import 'package:image_picker/image_picker.dart';

class bottomNavigatorBar extends StatefulWidget {
  const bottomNavigatorBar({super.key});

  @override
  State<bottomNavigatorBar> createState() => _bottomNavigatorBarState();
}

class _bottomNavigatorBarState extends State<bottomNavigatorBar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
            color: Color.fromARGB(255, 255, 255, 255),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 246, 253, 247),
                      minimumSize: Size(100, 50),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: ColorApp,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Trang chủ',
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.shopping_cart,
                            color: ColorApp,
                          )),
                      IconButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     CupertinoPageRoute(
                            //         builder: (context) => const ));
                          },
                          icon: Icon(
                            Icons.camera_alt,
                            color: ColorApp,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.person,
                            color: ColorApp,
                          )),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}



  // BottomNavigationBar(
          
  //           items: const <BottomNavigationBarItem>[
  //             BottomNavigationBarItem(
  //               icon: Icon(Icons.home),
  //             label: 'Trang chủ',
  //             ),
  //             BottomNavigationBarItem(
  //               icon: Icon(Icons.business),
  //               label: 'Business',
  //             ),
  //             BottomNavigationBarItem(
  //               icon: Icon(Icons.school),
  //               label: 'School',
  //             ),
  //           ],
  //           currentIndex: _selectedIndex,
  //           selectedItemColor: Colors.amber[800],
  //           onTap: _onItemTapped,
  //         ),