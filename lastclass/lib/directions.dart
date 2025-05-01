import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;

  static final LatLng _center = LatLng(45.5144626, -73.6755719);
  LatLng _source = LatLng(45.5144626, -73.6755719);
  LatLng _destination = LatLng(45.501689, -73.567256);
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};
  List<LatLng> _polylineCoordinates = [];

  @override
  void initState() {
    super.initState();
    _addMarkers();
    _getDirections();
  }

  void _addMarkers() {
    _markers.add(Marker(
      markerId: MarkerId('source'),
      position: _source,
      infoWindow: InfoWindow(title: 'Source'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ));
    _markers.add(Marker(
      markerId: MarkerId('destination'),
      position: _destination,
      infoWindow: InfoWindow(title: 'Destination'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ));
  }

  Future<void> _getDirections() async {
    final String apiKey = 'YOUR - API - KEY';
    final String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${_source.latitude},${_source.longitude}&destination=${_destination.latitude},${_destination.longitude}&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> steps = data['routes'][0]['legs'][0]['steps'];

      _polylineCoordinates.clear();
      for (var step in steps) {
        _polylineCoordinates.add(LatLng(
          step['start_location']['lat'],
          step['start_location']['lng'],
        ));
        _polylineCoordinates.add(LatLng(
          step['end_location']['lat'],
          step['end_location']['lng'],
        ));
      }

      setState(() {
        _polylines.add(Polyline(
          polylineId: PolylineId('route'),
          points: _polylineCoordinates,
          color: Colors.blue,
          width: 5,
        ));
      });
    } else {
      print('Failed to fetch directions: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Maps Directions'),
          backgroundColor: Colors.green,
        ),
        body: GoogleMap(
          onMapCreated: (controller) => mapController = controller,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 12.0,
          ),
          markers: _markers,
          polylines: _polylines,
        ),
      ),
    );
  }
}