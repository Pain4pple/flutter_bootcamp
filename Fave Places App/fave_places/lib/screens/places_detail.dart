import 'package:fave_places/models/place.dart';
import 'package:fave_places/screens/map.dart';
import 'package:flutter/material.dart';

class PlacesDetailScreen extends StatelessWidget {
  const PlacesDetailScreen({super.key, required this.place});

  final Place place;

  String simplifyAddress(String fullAddress) {
    List<String> parts = fullAddress.split(',');
    if (parts.length >= 2) {
      return "${parts[0]}, ${parts[1]}";
    }
    return fullAddress;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton.extended(backgroundColor: ,onPressed: () {}, label: Icon(Icons.add, color: Colors.black54), shape: CircleBorder()),
      backgroundColor: const Color.fromARGB(255, 234, 234, 238),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 234, 234, 238), Color.fromARGB(30, 251, 224, 206)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //header row
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Hero(
                      tag: place.id,
                      child: ClipRRect(borderRadius: BorderRadius.circular(34), child: Image.file(place.imageUrl, fit: BoxFit.cover)),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(place.name, style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 30)),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MapScreen(location: place.location, isSelecting: false)),
                              );
                            },
                            child: Text(
                              simplifyAddress(place.location.address),
                              style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(children: [Text(place.description != null ? place.description! : 'No found desc for this')]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
