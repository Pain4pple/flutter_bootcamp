import 'package:fave_places/models/place.dart';
import 'package:fave_places/providers/place_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesCard extends ConsumerWidget {
  const PlacesCard({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goToFunc = ref.read(userPlacesProvider.notifier);

    return InkWell(
      onTap: () => goToFunc.specificPlace(context, place),
      child: Row(
        children: [
          Container(
            height: 400,
            width: 300,
            decoration: BoxDecoration(
              gradient: RadialGradient(colors: [Color(0xffF091F8), Color(0xffF55972)], center: Alignment.center, radius: 0.8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(borderRadius: BorderRadius.circular(16), child: Image.network(place.imageUrl, fit: BoxFit.cover)),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [const Color.fromARGB(79, 35, 2, 31), const Color.fromARGB(0, 69, 7, 255)],
                        end: Alignment.topCenter,
                        begin: Alignment.bottomCenter,
                        stops: [0.01, 0.9],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 5,
                    child: Expanded(
                      child: Row(
                        children: [
                          Padding(padding: const EdgeInsets.all(8.0), child: Text(place.name, style: TextStyle(color: Colors.white))),
                          Icon(Icons.favorite, color: Colors.pink),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
