// To parse this JSON data, do
//
//     final scanModel = scanModelFromMap(jsonString);

import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class ScanModel {
    ScanModel({
      this.id,
      this.type,
      required this.value,
    }){
      if(value.contains('http')){
        type = 'http';
      }else{
        type = 'geo';
      }

    }

    int? id;
    String? type;
    String value;

    LatLng getLatLng () {
      final latlng = value.substring(4).split(",");
      final lat = double.parse(latlng[0]);
      final lng = double.parse(latlng[1]);
      return LatLng(lat, lng);
    }

    factory ScanModel.fromJson(String str) => ScanModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ScanModel.fromMap(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        type: json["type"],
        value: json["value"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "type": type,
        "value": value,
    };
}
