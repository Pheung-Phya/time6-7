import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  GoogleMapController? googleMapController;
  LatLng? _initialPosition;
  Marker? _marker;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.requestPermission();
    }

    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      // ignore: deprecated_member_use
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      _marker = Marker(
        markerId: const MarkerId('current_location'),
        position: _initialPosition!,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
        infoWindow: const InfoWindow(title: 'Your Selected Location'),
      );
    });
    googleMapController?.animateCamera(
      CameraUpdate.newLatLngZoom(_initialPosition!, 15),
    );
  }

  void _onMapTap(LatLng tappedPoint) {
    setState(() {
      _initialPosition = tappedPoint;
      _marker = Marker(
        markerId: const MarkerId('selectedLocation'),
        position: tappedPoint,
        infoWindow: const InfoWindow(title: 'Selected Location'),
      );
    });

    googleMapController?.animateCamera(
      CameraUpdate.newLatLngZoom(tappedPoint, 15),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _initialPosition == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  googleMapController = controller;
                },
                initialCameraPosition: CameraPosition(
                  target: _initialPosition!,
                  zoom: 15,
                ),
                markers: _marker != null ? {_marker!} : {},
                myLocationEnabled: true,
                onTap: _onMapTap,
              ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: () => _onMapTap,
              child: const Text("Select map"),
            ),
            FloatingActionButton(
              onPressed: _getCurrentLocation,
              child: const Text("Curren map"),
            ),
          ],
        ));
  }
}
