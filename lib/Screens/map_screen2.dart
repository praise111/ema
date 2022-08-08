
import 'dart:async';
import 'dart:core';
import 'dart:ffi';
import 'dart:typed_data';
import 'dart:ui' as ui;

//import 'package:google_maps_webservice/places.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:ema/Screens/search_places_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
//import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../blocs/ema_bloc.dart';

class MapScreen2 extends StatefulWidget {
  const MapScreen2({Key? key}) : super(key: key);

  @override
  State<MapScreen2> createState() => _MapScreenState();
}



class _MapScreenState extends State<MapScreen2> {



  //BitmapDescriptor mm = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), "assets/medicine.png");
  final Completer<GoogleMapController> _controller = Completer();
  Uint8List? markerImage;
  late FirebaseFirestore db;
  late GoogleMapController googleMapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();
  //final Mode _mode = Mode.overlay;
  List<String> images = ['assets/medicine1.png', 'assets/medicine1.png', 'assets/medicine1.png',
    'assets/medicine1.png', 'assets/medicine1.png', 'assets/badge1.png', 'assets/badge1.png', 'assets/badge1.png',
    'assets/badge1.png', 'assets/badge1.png'
  ];

  final List<Marker> _markers = <Marker>[];
  final List<LatLng> _latlng = <LatLng>[
    LatLng(8.8466291, 7.884746), LatLng(9.022138, 7.587819), LatLng(8.5548572, 7.7191333),
    LatLng(8.8951973, 7.5788873), LatLng(8.9970246, 7.5797242), LatLng(8.48594, 8.52903), LatLng(8.84706, 7.9115), LatLng(8.84844, 7.89611),
    LatLng(8.85271, 7.89607), LatLng(8.49567, 8.5168)
  ];
  //late BitmapDescriptor mapMarker;
  //Set<Marker> _kGooglePlexMarker = {};

  Future<Uint8List> getMarkerIcon(String image, int size) async{
    ByteData data = await rootBundle.load(image);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetHeight:size);
    ui.FrameInfo info = await codec.getNextFrame();
    return(await info.image.toByteData(format: ui. ImageByteFormat.png))!.buffer.asUint8List();
  }

  /*Future<Uint8List> getBytesFromAssets(String path, int width) async{
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetHeight:width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return(await fi.image.toByteData(format: ui. ImageByteFormat.png))!.buffer.asUint8List();
  }*/

  @override
  void initState(){
    //intilize();
   // getMapId();
    super.initState();

    loadData();
  }

  loadData () async {
    /*for(int i = 0; i< images.length; i++){

      final Uint8List markerIcon = await getBytesFromAssets(images[i], 100);
      _markers.add(
        Marker(markerId: MarkerId(i.toString()),
        position: _latlng[i],
            icon: BitmapDescriptor.fromBytes(markerIcon),
          infoWindow: InfoWindow(
            title: 'This is title marker: '+i.toString()
          )
        )
      );
      setState(() {

      });
    }*/
  }




  //bitmapdescriptor custom icons
  intilize(specify, specifyId) async {
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
   // BitmapDescriptor med = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), "assets/hospital.png");
    final Uint8List newIcon = await getMarkerIcon("assets/hospital.png", 500);
    //BitmapDescriptor police = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), "assets/badges.png");
    final Uint8List newIcon1 = await getMarkerIcon("assets/fire-station.png", 100);
    final Uint8List police = await getMarkerIcon("assets/badges.png", 450);
    Marker _kGooglePlexMarker = Marker(markerId: MarkerId('kGooglePlex'),
          infoWindow: InfoWindow(title: 'My Location'),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueBlue
          ),
          position: LatLng(8.5475, 7.7118));


      Marker Marker1 = Marker(
        markerId: MarkerId('FederalMedicalCenter'),
        position: LatLng(8.8466291, 7.884746),
        icon: BitmapDescriptor.fromBytes(newIcon),
        infoWindow: InfoWindow(title: 'Federal Medical Center',
            snippet: 'Hospital'),


      );

      Marker Marker2 = Marker(
        markerId: MarkerId('Pjhealthcareandmaternity'),
        position: LatLng(9.022138, 7.587819),
        infoWindow: InfoWindow(title: 'Pj healthcare and maternity',
            snippet: 'Hospital'),
        icon: BitmapDescriptor.fromBytes(newIcon),
      );

      Marker Marker3 = Marker(
        markerId: MarkerId('HenadMedicalCentre'),
        position: LatLng(8.5548572, 7.7191333),
        infoWindow: InfoWindow(title: 'Henad Medical Centre',
            snippet: 'Hospital'),
        icon: BitmapDescriptor.fromBytes(newIcon),

      );

      Marker Marker4 = Marker(
        markerId: MarkerId('SocuHospital'),
        position: LatLng(8.8951973, 7.5788873),
        infoWindow: InfoWindow(title: 'Socu Hospital',
            snippet: 'Hospital'),
        icon: BitmapDescriptor.fromBytes(newIcon),
      );

      Marker Marker5 = Marker(
        markerId: MarkerId('GograceHospital'),
        position: LatLng(8.9970246, 7.5797242),
        infoWindow: InfoWindow(title: 'Gograce Hospital',
            snippet: 'Hospital'),
      icon: BitmapDescriptor.fromBytes(newIcon),
      );

      Marker Marker6 = Marker(
        markerId: MarkerId('PoliceNPF-Headquaters'),
        position: LatLng(8.48594, 8.52903),
        infoWindow: InfoWindow(title: 'Police NPF - Headquaters',
            snippet: 'Police Station'),
        icon: BitmapDescriptor.fromBytes(police),

      );

      Marker Marker7 = Marker(
        markerId: MarkerId('PoliceStationAngwanLanbu'),
        position: LatLng(8.84706, 7.9115),
        infoWindow: InfoWindow(title: 'Police Station Angwan Lanbu',
            snippet: 'Police Station'),
        icon: BitmapDescriptor.fromBytes(police),
      );

      Marker Marker8 = Marker(
        markerId: MarkerId('NigeriaPoliceForceAreaCommandHeadquarters'),
        position: LatLng(8.84844, 7.89611),
        infoWindow: InfoWindow(
            title: 'Nigeria Police Force Area Command Headquarters',
            snippet: 'Police Station'),
        icon: BitmapDescriptor.fromBytes(police),
      );

      Marker Marker9 = Marker(
        markerId: MarkerId('NigeriaPoliceForceGraPoliceStation'),
        position: LatLng(8.85271, 7.89607),
        infoWindow: InfoWindow(title: 'Nigeria Police Force Gra Police Station',
            snippet: 'Police Station'),
        icon: BitmapDescriptor.fromBytes(police),
      );

      Marker Marker10 = Marker(
        markerId: MarkerId('PoliceNPF-ADivision'),
        position: LatLng(8.49567, 8.5168),
        infoWindow: InfoWindow(title: 'Police NPF - A Division',
            snippet: 'Police Station'),
        icon: BitmapDescriptor.fromBytes(police),
      );

    Marker Marker11 = Marker(
      markerId: MarkerId('KeffiFireService'),
      position: LatLng(8.84485, 7.87158),
      infoWindow: InfoWindow(title: 'Keffi Fire Service',
          snippet: 'Police Station'),
      icon: BitmapDescriptor.fromBytes(newIcon1),
    );

      _markers.add(_kGooglePlexMarker);
      _markers.add(Marker1);
      _markers.add(Marker2);
      _markers.add(Marker3);
      _markers.add(Marker4);
      _markers.add(Marker5);
      _markers.add(Marker6);
      _markers.add(Marker7);
      _markers.add(Marker8);
      _markers.add(Marker9);
      _markers.add(Marker10);
    _markers.add(Marker11);

      setState(() {

      });
    }


  /*setMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/hospitallogo.png');

  }*/


  static const CameraPosition _kGooglePlex =  CameraPosition(
    target: LatLng(8.5475, 7.7118),
    zoom: 14.4746,
  );

  /*void _onMapCreated(GoogleMapController controller){
    setState(() {
      _markers.add(
        Marker(markerId: MarkerId('id-1'), position: LatLng(8.8466291, 7.884746)),
      );
      _kGooglePlexMarker.add(
        Marker(markerId: MarkerId('id-1'), position: LatLng(8.5475, 7.7118), infoWindow: InfoWindow(title: 'Your Location')),
      );
    }
    );
  }*/

  static final CameraPosition _GooglePlex = CameraPosition(
    target: LatLng(8.5475, 7.7118),
    zoom: 14.4746,
  );

  /*static const Marker _kGooglePlexMarker = Marker(markerId: MarkerId('kGooglePlex'),
    infoWindow: InfoWindow(title: 'Your Location'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(8.5475, 7.7118),);*/

  static const CameraPosition initialPosition = CameraPosition(target: LatLng(8.5475, 7.7118), zoom: 14.0);

  static const CameraPosition targetPosition = CameraPosition(target: LatLng(8.6475, 7.8118), zoom: 14.0, bearing: 192.0, tilt: 60);
  FirebaseFirestore Firestore = FirebaseFirestore.instance;

  /*void getMarkers (double lat, double long) async {
    final Uint8List newIcon = await getMarkerIcon("assets/hospital.png", 500);
    MarkerId markerId = MarkerId(lat.toString() + long.toString());
    Marker _marker = Marker(
      markerId: markerId,
      position: LatLng(lat, long),
      icon: BitmapDescriptor.fromBytes(newIcon),
      infoWindow: InfoWindow(title: 'Federal Medical Center',
          snippet: 'Hospital'),
    );
    setState(() {
      markers[markerId] = _marker;
    });
  }*/
  void initMarker(request , requestId) async {
    var markerIdVal = requestId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(request['coords'].latitude , request['coords'].longitude),
      infoWindow: InfoWindow(title: 'Pj healthcare and maternity' , snippet: request['place']),
    );
    setState(() {
      markers[markerId] = marker;
    });
  }

  /*getMapId() async {
    FirebaseFirestore.instance.collection('markers').get().then((myMarkers) {
      if(myMarkers.docs.isNotEmpty) {
        for(int i = 0; i < myMarkers.docs.length; i++){
          initMarker(myMarkers.docs[i].data, myMarkers.docs[i].id);
        }
      }
    });

  }*/

  @override
  Widget build(BuildContext context) {
    //createMarker(context);
    //final emaBloc = Provider.of<EmaBloc>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Google Map"), centerTitle: true,),
      body: Stack(
            children: [
              Container(
                height: 500,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(target: LatLng(8.5475, 7.7118), zoom:14 ),
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                    //_customInfoWindowController.googleMapController = controller;
                    //getMarkers(, long)

                    },
                  //myLocationButtonEnabled: true,
                  //myLocationEnabled: true,
                  zoomControlsEnabled: true,
                  zoomGesturesEnabled: true,
                  compassEnabled: true,
                  markers: Set<Marker>.of(
                    markers.values
                  ),
                  //markers: _markers.map((e) => e).toSet(),
                  onTap: (position){
                    _customInfoWindowController.hideInfoWindow!();
                  },
                  onCameraMove: (position){
                    _customInfoWindowController.onCameraMove!();
                  },
                  //markers: Set<Marker>.of(_markers),
                ),
              ),
              CustomInfoWindow(
                controller: _customInfoWindowController,
                height: 100,
                width: 300,
                offset: 35,
              )

              //ElevatedButton(onPressed: _handlePressButton, child: const Text('Search Places'))
             ]
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _Location,
        label: const Text('My Location'),
        icon: const Icon(Icons.location_history),
      ),
    );
  }




  // ignore: non_constant_identifier_names
  Future<void> locate() async{

  }
  Future<Position> _Location() async {

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if(!serviceEnabled){
      return Future.error('Location service are disabled');
    }

    permission = await Geolocator.checkPermission();

    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();

      if(permission == LocationPermission.denied){
        return Future.error("Location permission denied");
      }
    }

    if(permission == LocationPermission.deniedForever){
      return Future.error("Location permission are permanently denied");
    }

    Position position = await Geolocator.getCurrentPosition();

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_GooglePlex));

    //googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(8.5475, 7.7118), zoom: 14)));

    //markers.clear();
    //markers.add(Marker(markerId:const  MarkerId('myLocation'), position: LatLng(8.6475, 7.8118), icon: BitmapDescriptor.defaultMarker,));
    //

    return position;
  }
}
