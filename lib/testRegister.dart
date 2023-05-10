import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Restaurant {
  final String id;
  final String name;
  final String address;

  Restaurant({required this.id, required this.name, required this.address});

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      address: json['address'],
    );
  }
}

class RestaurantList extends StatefulWidget {
  @override
  _RestaurantListState createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  List<Restaurant> _restaurants = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchRestaurants();
  }

  Future<void> _fetchRestaurants() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.get(Uri.parse('http://14.225.205.198:8989/restaurants/getAll'));

      if (response.statusCode == 200) {
        setState(() {
          _isLoading = false;
          _restaurants = (json.decode(response.body) as List)
              .map((data) => Restaurant.fromJson(data))
              .toList();
        });
      } else {
        throw Exception('Failed to load restaurants');
      }
    } catch (error) {
      throw Exception('Failed to connect to the server');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant List'),
      ),
      body: _isLoading
          ? Center(
              child: Text('lỗi'),
            )
          : ListView.builder(
              itemCount: _restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = _restaurants[index];
                return ListTile(
                  title: Text(restaurant.name),
                  subtitle: Text(restaurant.address),
                );
              },
            ),
    );
  }
}
