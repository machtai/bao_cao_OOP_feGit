import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyAppp extends StatefulWidget {
  @override
  _MyApppState createState() => _MyApppState();
}

class _MyApppState extends State<MyAppp> {
  String dropdownValue = '5 sao';
  List<String> ratings = ['1 sao', '2 sao', '3 sao', '4 sao', '5 sao'];
  List<dynamic> restaurants = [];
  List<dynamic> filteredRestaurants = [];

  Future<void> fetchRestaurants() async {
    final response = await http.get(Uri.parse('http://14.225.205.198:8989/restaurants/getAll'));
    final decoded = json.decode(response.body) as List<dynamic>;
    setState(() {
      restaurants = decoded;
      filteredRestaurants = restaurants.where((restaurant) => restaurant['rating'] == 5).toList();
    });
  }

  void filterRestaurantsByRating(String rating) {
    final filtered = restaurants.where((restaurant) => restaurant['rating'] == int.parse(rating.split(' ')[0])).toList();
    setState(() {
      filteredRestaurants = filtered;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dropdown Button Example'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String?newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
                filterRestaurantsByRating(newValue!);
              },
              items: ratings.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredRestaurants.length,
                itemBuilder: (BuildContext context, int index) {
                  final restaurant = filteredRestaurants[index];
                  return ListTile(
                    title: Text(restaurant['name']),
                    subtitle: Text(restaurant['description']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
