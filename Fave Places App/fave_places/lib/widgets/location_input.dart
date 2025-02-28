import 'dart:convert';

import 'package:fave_places/models/place.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  LocationInput({super.key, required this.getLocation});

  void Function(PlaceLocation location) getLocation;
  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocation? pickedLocation;
  var _isGettingLocation = false;
  String googleMapsApiKey = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';

  String get locationImage {
    final lat = pickedLocation!.lat;
    final long = pickedLocation!.long;
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$long&zoom=16&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C$lat,$long&key=$googleMapsApiKey';
  }

  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      _isGettingLocation = true;
    });

    locationData = await location.getLocation();
    var lat = locationData.latitude;
    var long = locationData.longitude;

    if (lat == null || long == null) {
      return;
    }

    final url = Uri.parse('https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=$googleMapsApiKey');
    final response = await http.get(url);
    final resData = jsonDecode(response.body);
    final address = resData['results'][0]['formatted_address'];
    setState(() {
      pickedLocation = PlaceLocation(lat: lat, long: long, address: address);
      _isGettingLocation = false;
      widget.getLocation(pickedLocation!);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Text("No location chosen", style: TextStyle(color: const Color.fromARGB(91, 0, 0, 0), fontSize: 17));
    if (_isGettingLocation != false) {
      content = Align(alignment: Alignment.center, child: SizedBox(width: 30, height: 30, child: CircularProgressIndicator()));
    }
    if (pickedLocation != null) {
      // var locationData = pickedLocation?.getLocation();
      content = Image.network(locationImage, fit: BoxFit.cover, width: double.infinity, height: double.infinity);
    }
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(10),
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color.fromARGB(55, 127, 125, 136)),
            child: content,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(onPressed: _getCurrentLocation, icon: const Icon(Icons.location_searching_sharp), label: Text('Current Location')),
            TextButton.icon(onPressed: () {}, icon: const Icon(Icons.location_on_rounded), label: Text('Select Location')),
          ],
        ),
      ],
    );
  }
}
