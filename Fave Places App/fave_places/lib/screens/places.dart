import 'package:fave_places/data/dummy_places.dart';
import 'package:fave_places/widgets/places_card.dart';
import 'package:flutter/material.dart';

class Places extends StatelessWidget {
  const Places({super.key});

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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //header row
                Row(
                  children: [
                    const Text('Hello ', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 17, 9, 33))),
                    const Text('Lara!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 17, 9, 33))),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: CircleAvatar(radius: 30, backgroundImage: AssetImage('assets/images/user.jpg')),
                    ),
                  ],
                ),
                SizedBox(height: 12),

                //search bar
                Row(children: [
                  ],
                ),
                SizedBox(height: 12),

                //extra buttons
                Row(
                  children: [
                    // ListView.builder(itemBuilder: (context, index) {}),
                  ],
                ),
                SizedBox(height: 25),

                Row(
                  children: [
                    const Text('Favorite Places', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 17, 9, 33))),
                    const Spacer(),
                    IconButton(onPressed: () {}, icon: Icon(Icons.add, color: const Color.fromARGB(157, 28, 26, 50))),
                  ],
                ),
                SizedBox(height: 12),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dummyPlaces.length,
                    itemBuilder: (context, index) {
                      return PlacesCard(place: dummyPlaces[index]);
                    },
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
