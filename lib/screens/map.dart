import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:prawo_jazdy_app/main.dart';

class MapHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'MAPA',
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, ProfileRoute);
                },
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ))
          ],
        ),
        body: Container(
          child: MapboxMap(
            initialCameraPosition: const CameraPosition(
                target: LatLng(52.16253, 21.038477), zoom: 14.0),
            accessToken: getKey(context, 'MAPBOX_APIKEY').toString(),
            myLocationEnabled: true,
            myLocationRenderMode: MyLocationRenderMode.GPS,
            myLocationTrackingMode: MyLocationTrackingMode.TrackingGPS,
          ),
        ));
  }

  getKey(BuildContext context, String name) async {
    PermissionStatus permission =
        await LocationPermissions().checkPermissionStatus();
    if (permission == PermissionStatus.denied) {
      LocationPermissions().requestPermissions();
    }
    var result =
        await DefaultAssetBundle.of(context).loadString('util/secrets.json');
    return jsonDecode(result)[name];
  }
}
