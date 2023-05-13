import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_food/color.dart';
import 'package:smart_food/login/index.dart';

class Success extends StatefulWidget {
  const Success({super.key});

  @override
  State<Success> createState() => _SuccessState();
  
}

class _SuccessState extends State<Success> {
  @override
   void initState() {
    super.initState();
    setState(() {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Đăng ký thành công',style: GoogleFonts.roboto(fontSize: 20),),
          const SizedBox(height: 20,),
          SpinKitWave(
              color: ColorApp,
              size: 100,
            ),
            const SizedBox(height: 50,),
            const Text('Hệ thống sẽ tự động quay về trang đăng nhập sau 2s',style: TextStyle(fontSize: 10),)
        ],
        ),
      ),
    );
  }
}