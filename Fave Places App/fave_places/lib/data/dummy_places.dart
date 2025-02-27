import 'package:fave_places/data/categories.dart';
import 'package:fave_places/models/category.dart';
import 'package:fave_places/models/place.dart';

List<Place> dummyPlaces = [
  Place(
    name: 'Arroceros Forest Park',
    date: DateTime.utc(2024, 11, 24),
    imageUrl: 'https://images.summitmedia-digital.com/spotph/images/2018/08/22/arroceros-park-longform-Main_inside.jpg',
    lat: '14.5942347',
    long: '120.9813612',
    category: categories[Categories.parks]!,
    description: '',
  ),
  Place(
    name: 'IKEA Swedish Bistro',
    date: DateTime.utc(2024, 02, 14),
    imageUrl: 'https://cdn.trendhunterstatic.com/thumbs/550/ikea-restaurant.jpeg',
    lat: '14.5317306',
    long: '120.9826794',
    category: categories[Categories.restaurant]!,
    description: '',
  ),
];
