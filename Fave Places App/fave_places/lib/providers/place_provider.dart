import 'dart:io';

import 'package:fave_places/data/dummy_places.dart';
import 'package:fave_places/models/place.dart';
import 'package:fave_places/screens/places_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart' as path;

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, 'places.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE user_places(id TEXT PRIMARY KEY, name TEXT, description TEXT, image TEXT, date TEXT, lat REAL, long REAL, address TEXT)',
      );
    },
    version: 1,
  );
  return db;
}

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super([]);

  void addPlace(Place place) async {
    final db = await _getDatabase();
    db.insert('user_places', {
      'id': place.id,
      'name': place.name,
      'date': DateTime.now().toIso8601String(),
      'description': place.description,
      'image': place.imageUrl.path,
      'lat': place.location.lat,
      'long': place.location.long,
      'address': place.location.address,
    });
    state = [place, ...state];
  }

  Future<void> loadPlaces() async {
    final db = await _getDatabase();
    final data = await db.query('user_places');
    final places =
        data
            .map(
              (row) => Place(
                id: row['id'] as String,
                name: row['name'] as String,
                location: PlaceLocation(lat: row['lat'] as double, long: row['long'] as double, address: row['address'] as String),
                date: DateTime.parse(row['date'] as String),
                imageUrl: File(row['image'] as String),
                description: row['description'] as String,
              ),
            )
            .toList();

    state = places;
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
