//import 'package:ema/Screens/map_screen.dart';
import 'package:ema/Screens/search_places_screen.dart';
import 'package:ema/blocs/ema_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'Screens/map_screen2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //final emaBloc = Provider.of<EmaBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
      ),
      body: Center(
       // width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Image.asset("assets/logo2.png", fit: BoxFit.contain),
              ),
              Text("Welcome Back",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Name",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600
                ),
              ),
              Text("Email",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ActionChip(label: Text("Logout"), onPressed: () {}),
              ActionChip(label: Text("Start Application"), onPressed: () {
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MapScreen2()));
    },
              ),
            ],
          )
        ),


          /*[
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return const MapScreen2();
              }));
            }, child: const Text('Start Application')),

          ],*/
        ),
      );
      /*body: GoogleMap(
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

        //ElevatedButton(onPressed: (){
          //Na
        //}
        //),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('Location'),
      ),
      //
      //
      // icon: Icon(Icons),
*/

  }
}
