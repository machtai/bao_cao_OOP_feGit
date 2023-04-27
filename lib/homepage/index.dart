import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_food/color.dart';
import 'package:smart_food/homepage/view/botomnavigaterbar.dart';
import 'package:smart_food/login/index.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePage();
}

class _homePage extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
    
            children: [
              SizedBox(height: 10,),
             IconButton(onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
             },icon:Icon(Icons.arrow_back,color: Colors.orange,)),
   
             SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    'Các nhà hàng ngon gần đây',
                    style: GoogleFonts.roboto(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.notifications,
                    color: ColorApp,
                    size: 30,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 239, 224),
                  hintText: 'Tìm kiếm',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.orange,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Danh sách',
                style: GoogleFonts.roboto(fontSize: 18),
              ),
              Expanded(
                child: FadeIn(
                  duration: Duration(milliseconds: 1000),
                  child: ListView(
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            'img/nhahang.jpg',
                            fit: BoxFit.fill,
                          ),
                          title: Text(
                            'Nhà hàng Lộc Minh',
                            style: GoogleFonts.roboto(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          trailing: Text(
                            ' 2 KM',
                            style: GoogleFonts.roboto(
                                fontSize: 15, color: Colors.orange),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            'img/nhahang.jpg',
                            fit: BoxFit.fill,
                          ),
                          title: Text(
                            'Nhà hàng Lộc Minh',
                            style: GoogleFonts.roboto(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          trailing: Text(
                            ' 2 KM',
                            style: GoogleFonts.roboto(
                                fontSize: 15, color: Colors.orange),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            'img/nhahang.jpg',
                            fit: BoxFit.fill,
                          ),
                          title: Text(
                            'Nhà hàng Lộc Minh',
                            style: GoogleFonts.roboto(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          trailing: Text(
                            ' 2 KM',
                            style: GoogleFonts.roboto(
                                fontSize: 15, color: Colors.orange),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      
                    ],
                  ),
                
                ),
              ),
             
            ],
          ),
        ),
        bottomNavigationBar: bottomNavigatorBar());
  }
}
