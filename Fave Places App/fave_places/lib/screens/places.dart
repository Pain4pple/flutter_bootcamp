import 'package:fave_places/data/dummy_places.dart';
import 'package:fave_places/providers/place_provider.dart';
import 'package:fave_places/screens/add_places.dart';
import 'package:fave_places/widgets/places_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvider);
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
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text('Hello ', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 17, 9, 33))),
                          const Text('Lara!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 17, 9, 33))),
                          const Spacer(),
                          CircleAvatar(radius: 30, backgroundImage: AssetImage('assets/images/user.jpg')),
                        ],
                      ),
                      SizedBox(height: 15),

                      //search bar
                      Row(
                        children: [
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              height: 50,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color.fromARGB(55, 127, 125, 136)),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Search for your favorite places',
                                  hintStyle: TextStyle(color: const Color.fromARGB(91, 0, 0, 0)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
                ),

                Row(
                  children: [
                    const Text('Favorite Places', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 17, 9, 33))),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddPlaces()));
                      },
                      icon: Icon(Icons.add, color: const Color.fromARGB(157, 28, 26, 50)),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                // SizedBox(height: 25),
                //extra buttons
                Row(
                  children: [
                    // ListView.builder(itemBuilder: (context, index) {}),
                  ],
                ),
                SizedBox(height: 12),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: userPlaces.length,
                    itemBuilder: (context, index) {
                      return PlacesCard(place: userPlaces[index]);
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
