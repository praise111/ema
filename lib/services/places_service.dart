import 'package:ema/modules/place_search.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlacesService{
  final key = 'AIzaSyCJHWpbw4Pd-95EvBI6NRHIodEPK363NCQ';
  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?key=$key&input=$search&types=(cities)';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
}
}