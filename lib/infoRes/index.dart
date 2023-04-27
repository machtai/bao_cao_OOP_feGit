import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../var.dart';
import 'components/ButtonComfirm.dart';

class ImageBottomSheet extends StatefulWidget {
  const ImageBottomSheet({super.key});

  @override
  _ImageBottomSheetState createState() => _ImageBottomSheetState();
}

class _ImageBottomSheetState extends State<ImageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Hiển thị ảnh phía trên
            Stack(
              children: [
                Container(
                  height: size.height / 1.9,
                  width: double.infinity,
                  child: Image.asset(
                    'img/nhahang.jpg', // Đường dẫn đến ảnh
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: size.height / 2,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.only(
                            topLeft:
                                Radius.circular(20.0), // Border radius top left
                            topRight: Radius.circular(
                                20.0), // Border radius top right
                          )),
                      height: size.height / 2,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 35),
                          Row(
                            children: [
                              Text("Thực phẩm hỗn hợp",
                                  style: GoogleFonts.roboto(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w300)),
                              SizedBox(
                                width: 40,
                              ),
                              Icon(
                                Icons.location_on,
                                size: 30,
                              ),
                              Icon(
                                Icons.location_on,
                                size: 30,
                              ),
                            ],
                          ),
                          Container(
                            color: Colors.white,
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Miêu tả",
                                style: textStyleInput,
                              ),
                            ],
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  title: Text('Item $index'),
                                  onTap: () {},
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "200.000 đ",
                                  style: textStyleInput,
                                ),
                              ],
                            ),
                          ),
                          const ButtonConfirm(),
                          SizedBox(
                            height: size.width / 20,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
