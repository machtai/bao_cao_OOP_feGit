import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:map_launcher/map_launcher.dart';


class MenuRes extends StatefulWidget {
  final String restaurantId;
  final double lat;
  final double lng;
  const MenuRes({
    required this.lat,
    required this.lng,
    required this.restaurantId,
    Key? key,
  }) : super(key: key);

  @override
  State<MenuRes> createState() => _MenuResState();
}

class _MenuResState extends State<MenuRes> {
  bool _isExpanded = false;
  late Future<Restaurant> _restaurantFuture;

  @override
  void initState() {
    super.initState();
    _restaurantFuture = fetchRestaurant(widget.restaurantId);
  }

  Future<Restaurant> fetchRestaurant(String restaurantId) async {
    final response = await http.get(Uri.parse(
        'http://14.225.205.198:8989/restaurants/get?id=$restaurantId'));

    if (response.statusCode == 200) {
      print(response.body);
      return Restaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant');
    }
  }

  @override
  Widget build(BuildContext context) {
    final img = '';
    final Size size = MediaQuery.of(context).size;
    final maxLines = _isExpanded ? null : 2;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
          // Hiển thị ảnh phía trên
          Stack(children: [
            Container(
              height: size.height / 2.5,
              width: double.infinity,
              child: img == ''
                  ? Image.asset(
                      'img/nhahang.jpg',
                      height: size.height / 3,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    )
                  : Container(
                      height: size.height / 3,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(File(img)),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
            ),
            Column(children: [
              SizedBox(
                height: size.height / 3.0,
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    //color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0), // Border radius top left
                      topRight:
                          Radius.circular(30.0), // Border radius top right
                    )),
                //  height: size.height /3.2,
                child: Divider(
                  thickness: 2.2,
                  color: Colors.grey[300],
                  indent: size.width / 3.2,
                  endIndent: size.width / 3.2,
                ),
              ),
              Container(
                  color: Color.fromARGB(255, 252, 251, 250),
                  height: size.height / 1.8,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: FutureBuilder<Restaurant>(
                      future: _restaurantFuture,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView(children: [
                            ListTile(
                              title: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data!.name,
                                      style: GoogleFonts.roboto(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400)),
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red[100]),
                                    child: const Icon(
                                      color: Color(0xffFF1D1D),
                                      Icons.favorite,
                                      size: 24,
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Row(children: [
                                GestureDetector(
                                    onTap: () {
                                      openMapsSheet(
                                          context, widget.lat, widget.lng);
                                      //        Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           MapLauncherDemo(lat: snapshot.data!.lat,lng: snapshot.data!.lng))
                                      // );
                                      // MapUtils.openMap(
                                      //     snapshot.data!.lat,  snapshot.data!.lng);
                                    },
                                    child: Row(children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 24,
                                        color: Color(0xff53E88B),
                                      ),
                                      Text(' Google Map ')
                                    ])),
                                Spacer(),
                                RatingBar.builder(
                                  initialRating: snapshot.data!.rating,
                                  minRating: 1,
                                  itemSize: 12,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 0.5),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ]),
                            ),
                            ListTile(
                              title: Column(
                                children: [
                                  Wrap(
                                    children: [
                                      if (_isExpanded)
                                        Text('${snapshot.data!.description}',
                                            style: GoogleFonts.roboto(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w300)),
                                      if (!_isExpanded)
                                        Text(
                                          '${snapshot.data!.description}'
                                              .split('\n')
                                              .first,
                                          style: GoogleFonts.roboto(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _isExpanded = !_isExpanded;
                                          });
                                        },
                                        child: Text(
                                          _isExpanded ? 'Thu gọn' : 'Xem thêm',
                                          style: GoogleFonts.roboto(
                                              fontSize: 14,
                                              color: Color(0xff53E88B),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),

                            ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Danh sách món ăn',
                                    style: GoogleFonts.roboto(
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 32, 44, 37),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    'Xem tất cả',
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color:
                                            Color.fromARGB(255, 253, 121, 106),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            ...snapshot.data!.products.map((product) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 0),
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 0),
                                decoration: BoxDecoration(
                                    boxShadow: kElevationToShadow[2],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: ListTile(
                                  leading: Image.asset('img/nhahang.jpg',
                                      // restaurant.img,
                                      fit: BoxFit.cover),
                                  title: Text('${product.title}',
                                      style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('${product.description}',
                                          style: GoogleFonts.roboto(
                                              fontSize: 10,
                                              color: const Color.fromARGB(
                                                  255, 170, 187, 186))),
                                      SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Spacer(),
                                          Text('${product.price}',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 10,
                                                  color: Color.fromARGB(
                                                      255, 251, 116, 116)))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                            // Add more ListTile to display other information
                          ]);
                        } else if (snapshot.hasError) {
                          return Center(child: Text('${snapshot.error}'));
                        }

                        return Center(child: CircularProgressIndicator());
                      }))
            ])
          ])
        ]))));
  }

  openMapsSheet(BuildContext context, double lat, double lng) async {
    try {
      final title = "";
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: Coords(lat, lng),
                          title: title,
                        ),
                        title: Text(map.mapName),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }
}

class Restaurant {
  final String id;
  final String name;
  final String address;
  final String? description;
  final double rating;
  final double lat;
  final double lng;
  final List<Product> products;

  Restaurant({
    required this.rating,
    required this.lat,
    required this.lng,
    required this.id,
    required this.name,
    required this.address,
    required this.description,
    required this.products,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    final productsJson = json['products'] as List<dynamic>;
    final productsList = productsJson
        .map((productJson) => Product.fromJson(productJson))
        .toList();
    return Restaurant(
      rating: json['rating']?.toDouble() ?? 0.0,
      lat: json['lat']?.toDouble() ?? 0.0,
      lng: json['lng']?.toDouble() ?? 0.0,
      id: json['id'],
      name: json['name'],
      address: json['address'],
      description: json['description'],
      products: productsList,
    );
  }
}

class Product {
  final String? id;
  final String? title;
  final String? description;
  final num? price;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      // Parse other fields from JSON
    );
  }
}
