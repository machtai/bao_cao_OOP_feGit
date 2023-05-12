import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'package:http/http.dart' as http;
class NearbyPlacesScreen extends StatefulWidget {
  @override
  _NearbyPlacesScreenState createState() => _NearbyPlacesScreenState();
}

class _NearbyPlacesScreenState extends State<NearbyPlacesScreen> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  List<Place> _places = [];
 late Position _currentPosition;

  static final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(0, 0),
    zoom: 2,
  );

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Places'),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        mapType: MapType.normal,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentPosition = position;
      });
      _getNearbyPlaces();
    } catch (e) {
      print(e);
    }
  }

  Future<void> _getNearbyPlaces() async {
    // Replace your Google Maps API key here
    final apiKey = 'YOUR_API_KEY';
    final placesUrl =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${_currentPosition.latitude},${_currentPosition.longitude}&radius=1000&type=restaurant&key=$apiKey';
    final response = await http.get(Uri.parse(placesUrl));
    final json = jsonDecode(response.body);
    final placesJson = json['results'] as List<dynamic>;
    final places = placesJson.map((placeJson) => Place.fromJson(placeJson)).toList();
    setState(() {
      _places = places;
      _markers = _places.map((place) => Marker(
        markerId: MarkerId(place.id!),
        position: LatLng(place.latitude!, place.longitude!),
        infoWindow: InfoWindow(title: place.name),
      )).toSet();
    });
  }
}

class Place {
  final String? id;
  final String? name;
  final double? latitude;
  final double? longitude;

  Place({this.id, this.name, this.latitude, this.longitude});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['place_id'],
      name: json['name'],
      latitude: json['geometry']['location']['lat'],
      longitude: json['geometry']['location']['lng'],
    );
  }
}
