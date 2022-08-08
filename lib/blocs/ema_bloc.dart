//@dart=2.9
import 'package:ema/services/places_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

import '../modules/place_search.dart';
import '../services/geolocator_service.dart';

class EmaBloc with ChangeNotifier{
  final geolocatorService = GeolocatorService();
  final placesService = PlacesService();

  Position currentLocation;
  List<PlaceSearch> searchResults;

  EmaBloc(){
    setCurrentLocation();
  }

  setCurrentLocation() async {
    currentLocation = await geolocatorService.getCurrentLocation();
    notifyListeners();
  }

  searchPlaces(String searchTerm) async{
   searchResults = await placesService.getAutocomplete(searchTerm);
   notifyListeners();
  }
}