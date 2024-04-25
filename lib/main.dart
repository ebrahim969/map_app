import 'package:flutter/material.dart';
import 'package:map_app/widgets/custom_google_map.dart';

void main() {
  runApp(const MapApp());
}

class MapApp extends StatelessWidget {
  const MapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CustomGoogleMap(),
    );
  }
}
