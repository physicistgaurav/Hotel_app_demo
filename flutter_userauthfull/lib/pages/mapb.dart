// ignore_for_file: unnecessary_import, implementation_imports, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapBottom extends StatefulWidget {
  @override
  _MapBottomState createState() => _MapBottomState();
}

class _MapBottomState extends State<MapBottom> {
  late GoogleMapController _mapController;
  Location _location = Location();
  bool _permissionGranted = false;
  late LatLng _currentPosition;

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  void _checkLocationPermission() async {
    final locationStatus = await _location.requestPermission();
    setState(() {
      _permissionGranted = locationStatus == PermissionStatus.granted;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _getCurrentLocation() async {
    final currentLocation = await _location.getLocation();
    setState(() {
      _currentPosition = LatLng(
        currentLocation.latitude!,
        currentLocation.longitude!,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentLocation,
        child: Icon(Icons.my_location),
      ),
      body: _permissionGranted
          ? GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(27.6195, 85.5386),
                zoom: 12,
              ),
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
            )
          : Center(
              child: Text('Permission not granted'),
            ),
    );
  }
}
