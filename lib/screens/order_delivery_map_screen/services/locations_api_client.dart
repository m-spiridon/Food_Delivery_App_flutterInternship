import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationClient {
  Future<LatLng> getDeliveryLocation(String userName) async {
    QuerySnapshot deliveryLocationDocs;
    GeoPoint deliveryGeoPoint;
    LatLng deliveryLocation;

    deliveryLocationDocs = await FirebaseFirestore.instance
        .collection('Users')
        .where('name', isEqualTo: userName)
        .get();

    deliveryGeoPoint = deliveryLocationDocs.docs.first['address'];
    deliveryLocation =
        LatLng(deliveryGeoPoint.latitude, deliveryGeoPoint.longitude);

    return deliveryLocation;
  }

  Future<LatLng> getProducerLocation(String producerName) async {
    QuerySnapshot producerLocationDocs;
    GeoPoint producerGeoPoint;
    LatLng producerLocation;

    producerLocationDocs = await FirebaseFirestore.instance
        .collection('Producers')
        .where('name', isEqualTo: producerName)
        .get();

    producerGeoPoint = producerLocationDocs.docs.first['location'];
    producerLocation =
        LatLng(producerGeoPoint.latitude, producerGeoPoint.longitude);

    return producerLocation;
  }
}
