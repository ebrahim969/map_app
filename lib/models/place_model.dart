import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  final int id;
  final String name;
  final LatLng latLong;

  PlaceModel({required this.id, required this.name, required this.latLong});
}

List<PlaceModel> places = [
  PlaceModel(
      id: 1,
      name: "شركه الغزل والنسيج",
      latLong: const LatLng(30.980035942586557, 31.183629925947834)),
  PlaceModel(
      id: 1,
      name: "استاد غزل المحله",
      latLong: const LatLng(30.960618149275017, 31.17249903304541)),
  PlaceModel(
      id: 1,
      name: "مدرسه السيده زينب الثانويه بنات",
      latLong: const LatLng(30.973901950003963, 31.169878216940184)),
];
