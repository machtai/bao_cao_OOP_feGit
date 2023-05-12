import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class MapUtils {
  MapUtils._();
  static Future<void> openMap(double lat, double lng) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$lng';

    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      throw 'Count not open the map.';
    }
  }
}
