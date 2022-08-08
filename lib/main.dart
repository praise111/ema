import 'dart:async';

import 'package:ema/Screens/login_screen.dart';
import 'package:ema/Screens/map_screen2.dart';
import 'package:ema/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'blocs/ema_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EmaBloc(),
      child: MaterialApp(
        title: 'Email and Password Login',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: MapScreen2(),
      ),
    );
  }
}

/*class MapSample extends StatefulWidget {
  @override
  //State<MapSample> createState() => MapSampleState();
}*/

/*class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(8.5475, 7.7118),
    zoom: 14.4746,
  );*/

   /*late GoogleMapController _googleMapController;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }*/

  /*static final Marker _kGooglePlexMarker = Marker(markerId: MarkerId('kGooglePlex'),
    infoWindow: InfoWindow(title: 'Google Plex'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(8.5475, 7.7118),

  );*/

  /*static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(8.6475, 7.8118),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  static final Marker _kPlexMarker = Marker(markerId: MarkerId('_kLake'),
    infoWindow: InfoWindow(title: 'k Plex'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    position: LatLng(8.5575, 7.7218),

  );
*/
  /*static final Polyline _kPolyline = Polyline(polylineId: PolylineId('_kPolyline'),
    points: [
    LatLng(8.5475, 7.7118),
    LatLng(8.6475, 7.8118),
    ]
  );*/

  //@override
  /*Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: true,
        zoomControlsEnabled: false,
        zoomGesturesEnabled: true,
        compassEnabled: true,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.width*0.55
        ),
        mapType: MapType.normal,
        markers: {
          _kGooglePlexMarker,
          *//*_kPlexMarker,*//*},
        polylines: {
          *//*_kPolyline,*//*
        },
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },

        ElevatedButton(onPressed: (){
          Na
        }
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('Location'),
        ),
       //
       //
       // icon: Icon(Icons),

    );*/
  //}

  /*Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
  }
//}*/