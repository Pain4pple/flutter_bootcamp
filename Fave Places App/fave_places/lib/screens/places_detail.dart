import 'package:fave_places/models/place.dart';
import 'package:flutter/material.dart';

class PlacesDetailScreen extends StatelessWidget {
  const PlacesDetailScreen({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton.extended(backgroundColor: ,onPressed: () {}, label: Icon(Icons.add, color: Colors.black54), shape: CircleBorder()),
      backgroundColor: const Color.fromARGB(255, 234, 234, 238),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 234, 234, 238), Color.fromARGB(30, 232, 126, 55)],
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
                    ClipRRect(borderRadius: BorderRadius.circular(34), child: Image.network(place.imageUrl, fit: BoxFit.cover)),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Text(place.name, style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 30)),
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
