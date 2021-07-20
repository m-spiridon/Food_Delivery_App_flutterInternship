import 'package:flutter/cupertino.dart';

abstract class LocationsEvent {}

class DeliveryLocationLoadEvent extends LocationsEvent {
  String userName;
  DeliveryLocationLoadEvent({@required this.userName});
}

class ProducerLocationLoadEvent extends LocationsEvent {
  String producerName;
  ProducerLocationLoadEvent({@required this.producerName});
}
