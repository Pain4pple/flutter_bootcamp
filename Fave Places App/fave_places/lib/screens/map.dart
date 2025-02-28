import 'package:fave_places/models/place.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, this.location = const PlaceLocation(lat: 37.422, long: -122.084, address: ''), this.isSelecting = true});

  final PlaceLocation location;
  final bool isSelecting;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton.filled(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(backgroundColor: WidgetStateProperty.all(const Color.fromARGB(139, 52, 44, 43))),
                    splashColor: const Color.fromARGB(72, 109, 107, 102),
                    icon: Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    widget.isSelecting ? 'Choose ' : 'Your ',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 17, 9, 33)),
                  ),
                  const Text('location', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 17, 9, 33))),
                  const Spacer(),
                  widget.isSelecting
                      ? IconButton.filled(
                        onPressed: () {
                          Navigator.of(context).pop(_pickedLocation);
                        },
                        style: ButtonStyle(backgroundColor: WidgetStateProperty.all(const Color.fromARGB(139, 52, 44, 43))),
                        splashColor: const Color.fromARGB(72, 109, 107, 102),
                        icon: Icon(Icons.save),
                      )
                      : const Spacer(),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(34),
                  child: GoogleMap(
                    onTap:
                        widget.isSelecting == false
                            ? null
                            : (position) {
                              setState(() {
                                _pickedLocation = position;
                              });
                            },
                    initialCameraPosition: CameraPosition(target: LatLng(widget.location.lat, widget.location.long), zoom: 16),
                    markers:
                        (_pickedLocation == null && widget.isSelecting)
                            ? {}
                            : {
                              Marker(markerId: const MarkerId('m1'), position: _pickedLocation ?? LatLng(widget.location.lat, widget.location.long)),
                            },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
