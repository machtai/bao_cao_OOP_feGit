import 'package:flutter/material.dart';
import 'package:smart_food/login/index.dart';
import 'package:smart_food/register/index.dart';
import 'package:smart_food/register/view/success.dart';
import 'package:smart_food/infoRes/index.dart';

import 'homepage/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

final List<Widget> pages = [
  const Login(),
  const Register(),
  const homePage(),
  const Success(),
 const ImageBottomSheet()
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MaterialApp(
      
        home: pages[4],
      ),
    );
  }
}
