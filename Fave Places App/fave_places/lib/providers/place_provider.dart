import 'package:fave_places/data/dummy_places.dart';
import 'package:fave_places/models/place.dart';
import 'package:fave_places/screens/places_detail.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(dummyPlaces);

  void addPlace(Place place) {
    state = [place, ...state];
  }

  void specificPlace(BuildContext context, Place place) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return PlacesDetailScreen(place: place);
        },
      ),
    );
  }
}

// final UserPlacesNotifier = NotifierProvider<,>();
final userPlacesProvider = StateNotifierProvider<UserPlacesNotifier, List<Place>>((ref) => UserPlacesNotifier());
