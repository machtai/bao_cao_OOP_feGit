import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_food/color.dart';
import 'package:http/http.dart' as http;
import 'package:smart_food/homepage/view/botomnavigaterbar.dart';

import '../menuRestaurant/index.dart';

class Restaurant {
  final double lat;
  final double lng;
  final String id;
  final String name;
  final String address;
  final double rating;
  final String img;
  Restaurant(
      {required this.id,
      required this.name,
      required this.address,
      required this.lat,
      required this.lng,
      required this.img,
      required this.rating});

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      img: json['img'].toString(),
      rating: json['rating']?.toDouble() ?? 0.0,
      lat: json['lat']?.toDouble() ?? 0.0,
      lng: json['lng']?.toDouble() ?? 0.0,
    );
  }
}

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({Key? key});

  @override
  State<RestaurantPage> createState() => _RestaurantPage();
}

class _RestaurantPage extends State<RestaurantPage> {
  String _searchQuery = '';
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
      final response = await http
          .get(Uri.parse('http://14.225.205.198:8989/restaurants/getAll'));

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
    List<Restaurant> filteredRestaurants = _restaurants.where((restaurant) {
      return restaurant.name.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('img/pattern-gXz.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Text(
                          'Các nhà hàng ngon gần đây',
                          style: GoogleFonts.roboto(
                              fontSize: 25, fontWeight: FontWeight.w600),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.notifications,
                          color: Color(0xff005AA7),
                          size: 30,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
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
                      height: 30,
                    ),
                    Expanded(
                        child: FadeIn(
                            duration: Duration(milliseconds: 1000),
                            child: ListView.builder(
                                itemCount: filteredRestaurants.length,
                                itemBuilder: (context, index) {
                                  final restaurant = filteredRestaurants[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MenuRes(
                                                  restaurantId: restaurant.id,
                                                  lat: restaurant.lat,
                                                  lng: restaurant.lng,
                                                )),
                                      );
                                    },
                                    child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 0),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 10),
                                        decoration: BoxDecoration(
                                            boxShadow: kElevationToShadow[2],
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: ListTile(
                                            leading:
                                                Image.asset('img/nhahang.jpg',
                                                    // restaurant.img,
                                                    fit: BoxFit.cover),
                                            title: Text(restaurant.name,
                                                style: GoogleFonts.roboto(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            subtitle: Container(
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                child: Column(children: [
                                                  Text(restaurant.address,
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 10,
                                                          color: const Color
                                                                  .fromARGB(255,
                                                              170, 187, 186))),
                                                  SizedBox(height: 5),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Spacer(),
                                                      RatingBar.builder(
                                                        initialRating:
                                                            restaurant.rating,
                                                        minRating: 1,
                                                        itemSize: 12,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 5,
                                                        itemPadding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    0.5),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                Icon(
                                                          Icons.star,
                                                          color: Colors.amber,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {
                                                          print(rating);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ])))),
                                  );
                                }))),
                  ])),
        ),
        bottomNavigationBar: bottomNavigatorBar(),
      ),
    );
  }
}
