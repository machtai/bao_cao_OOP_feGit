import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smart_food/color.dart';
import 'package:smart_food/login/index.dart';

import '../homepage/index.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({super.key});
  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  @override
  void initState() {
    super.initState();
    setState(() {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => homePage()));
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitSpinningLines(
              color: ColorApp,
              size: 150,
            ),
            SizedBox(
              height: 20,
            ),
            Text('Hệ thống đang lấy dữ liệu'),
          ],
        ),
      ),
    );
  }
}
