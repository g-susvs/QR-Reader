import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

    MapType mapType = MapType.normal;
  @override
  Widget build(BuildContext context) {
    final scan = ModalRoute.of(context)!.settings.arguments as ScanModel;
    final CameraPosition position = CameraPosition(
      target: scan.getLatLng(),
      tilt: 50,
      zoom: 17,
    );

    // marcadores
    Set<Marker> markers = <Marker>{};
    markers.add(Marker(
      markerId: const MarkerId('geo-location'),
      position: scan.getLatLng(),
    ));

    return Scaffold(
        appBar: AppBar(
          title: const Text('Mapa'),
          actions: [
            IconButton(
              icon: const Icon(Icons.location_searching_outlined),
              onPressed: () async {
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(
                    CameraUpdate.newCameraPosition(CameraPosition(
                  target: scan.getLatLng(),
                  tilt: 50,
                  zoom: 17,
                )));
              },
            )
          ],
        ),
        body: GoogleMap(
          mapType: mapType,
          myLocationButtonEnabled: false,
          initialCameraPosition: position,
          markers: markers,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.layers),
          onPressed: (){
            if(mapType == MapType.normal){
              mapType = MapType.satellite;
            }else{
              mapType = MapType.normal;
            }
            setState(() {});

          },
        ),
        );
  }
}
