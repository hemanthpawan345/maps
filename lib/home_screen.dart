import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Marker> _marker = [];
  final List<Marker> _list = const [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(33.6864, 73.0479),
      infoWindow: InfoWindow(
        title: 'My Current Location',
      ),
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(33.738045, 73.044488),
      infoWindow: InfoWindow(
        title: 'e-1 sector',
      ),
    ),
    Marker(
      markerId: MarkerId('3'),
      position: LatLng(33.708045, 73.040488),
      infoWindow: InfoWindow(
        title: 'e-2 sector',
      ),
    ),
    Marker(
      markerId: MarkerId('4'),
      position: LatLng(33.658045, 73.0479),
      infoWindow: InfoWindow(
        title: 'e-3 sector',
      ),
    ),
    Marker(
      markerId: MarkerId('5'),
      position: LatLng(35.6764, 139.6500),
      infoWindow: InfoWindow(
        title: 'e-4 sector',
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _marker.addAll(_list);
  }

  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.6864, 73.0479),
    zoom: 14.4746,
  );

// CameraPosition
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          compassEnabled: false,
          markers: Set<Marker>.of(_marker),
          myLocationEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          GoogleMapController controller = await _controller.future;
          controller.animateCamera(
            CameraUpdate.newCameraPosition(
              const CameraPosition(
                target: LatLng(18.6137315, 73.8782588),
                zoom: 14,
              ),
            ),
          );
          setState(() {});
        },
        child: const Icon(Icons.location_disabled_outlined),
      ),
    );
  }
}
