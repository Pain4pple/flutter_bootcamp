import 'package:fave_places/models/place.dart';
import 'package:riverpod/riverpod.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  void addPlace(Place place) {
    state = [place, ...state];
  }
}

// final UserPlacesNotifier = NotifierProvider<,>();
final userPlacesProvider = StateNotifierProvider<UserPlacesNotifier, List<Place>>((ref) => UserPlacesNotifier());
