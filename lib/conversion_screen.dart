import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class ConvertLatLong extends StatefulWidget {
  const ConvertLatLong({super.key});

  @override
  State<ConvertLatLong> createState() => _ConvertLatLongState();
}

class _ConvertLatLongState extends State<ConvertLatLong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map address'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              final List<Placemark> placemarks = await placemarkFromCoordinates(
                  18.6137315,
                  73.8782588 // Using Google Maps Geocoding API (replace with other service call if needed)
                  );

              if (placemarks.isNotEmpty) {
                final Placemark placemark = placemarks[0];
                String address = '';

                // Format address components as needed (street, locality, administrative area, postal code, etc.)
                address += '${placemark.street}, ';
                address += '${placemark.locality}, ';
                address += '${placemark.administrativeArea}, ';
                address += '${placemark.postalCode}';
                print(address);
              }
              List<Location> locations =
                  await locationFromAddress("Ganesh Marg, Pimpri Chinchwad");
              if (locations.isNotEmpty) {
                print(
                    'Latitude: ${locations.first.latitude}, Longitude: ${locations.first.longitude}');
              } else {
                print('No location found for the address.');
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.cyanAccent,
                ),
                height: 50,
                child: const Center(
                  child: Text('convert'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
