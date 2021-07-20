import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class LocationsState {}

//User Location
class DeliveryLocationLoadingState extends LocationsState {}

class DeliveryLocationLoadSuccessState extends LocationsState {
  LatLng deliveryLocation;
  DeliveryLocationLoadSuccessState({@required this.deliveryLocation})
      : assert(deliveryLocation != null);
}

class DeliveryLocationErrorState extends LocationsState {}

//Producer Location
class ProducerLocationLoadingState extends LocationsState {}

class ProducerLocationLoadSuccessState extends LocationsState {
  LatLng producerLocation;
  ProducerLocationLoadSuccessState({@required this.producerLocation})
      : assert(producerLocation != null);
}

class ProducerLocationErrorState extends LocationsState {}
