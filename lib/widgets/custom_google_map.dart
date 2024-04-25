import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_app/models/place_model.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;
  late GoogleMapController mapController;

  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
        target: LatLng(31.040705053739128, 31.372596256949702), zoom: 15);
    initMarkers();
    super.initState();
  }

  Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          markers: markers,
          onMapCreated: (controller) {
            mapController = controller;
            initMapStyle();
          },
          initialCameraPosition: initialCameraPosition,
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: ElevatedButton(
            onPressed: () {
              mapController.animateCamera(CameraUpdate.newLatLng(
                  const LatLng(31.013195879633763, 31.383673053779518)));
            },
            child: const Text("Change Location"),
          ),
        ),
      ],
    );
  }

  void initMapStyle() async {
    var mapStyle = await DefaultAssetBundle.of(context)
        .loadString("assets/map_styles/map_style_1.json");
    mapController.setMapStyle(mapStyle);
  }

  void initMarkers() {
    var myMarkers = places
        .map(
          (placeModel) => Marker(
              markerId: MarkerId(
                placeModel.id.toString(),
              ),
              position: placeModel.latLong),
        )
        .toSet();

    markers.addAll(myMarkers);
  }
}
