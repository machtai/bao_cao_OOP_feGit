import 'package:flutter/material.dart';
import 'package:smart_food/login/index.dart';
import 'package:smart_food/register/index.dart';
import 'package:smart_food/Map.dart';
import 'package:smart_food/testMap.dart';
import 'package:smart_food/filterSortRating.dart';
import 'package:smart_food/testdistance.dart';

import 'homepage/index.dart';


void main() {
  runApp( MyApp());
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
 NearbyPlacesScreen(),
  //filter sort
MyAppp(),
//login
  Login(),
  const Register(),
  const homePage(),
MapLauncherDemo()
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
      )
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Google Maps Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   final String address = '1600 Amphitheatre Parkway, Mountain View, CA 94043, United States';

//   void _launchMapsUrl() async {
//     final url = 'https://www.google.com/maps/search/?api=1&query=$address';
//     if (await canLaunchUrl(Uri.parse(url))) {
//       await launchUrl(Uri.parse(url));
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google Maps Demo'),
//       ),
//       body: Center(
//         child: GestureDetector(
//           onTap: _launchMapsUrl,
//           child: Icon(Icons.map),
//         ),
//       ),
//     );
//   }
// }
