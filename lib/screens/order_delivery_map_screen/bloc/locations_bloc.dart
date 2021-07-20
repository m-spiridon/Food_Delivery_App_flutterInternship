import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:internship_project_1/screens/order_delivery_map_screen/bloc/locations_event.dart';
import 'package:internship_project_1/screens/order_delivery_map_screen/bloc/locations_state.dart';
import 'package:internship_project_1/screens/order_delivery_map_screen/services/locations_api_client.dart';

class LocationsBloc extends Bloc<LocationsEvent, LocationsState> {
  LocationsBloc() : super(DeliveryLocationLoadingState());

  LocationClient locationsClient = LocationClient();

  @override
  Stream<LocationsState> mapEventToState(LocationsEvent event) async* {
    if (event is DeliveryLocationLoadEvent) {
      try {
        final LatLng _loadedDeliveryLocation =
            await locationsClient.getDeliveryLocation(event.userName);
        yield DeliveryLocationLoadSuccessState(
            deliveryLocation: _loadedDeliveryLocation);
      } catch (e) {
        print(e);
        yield DeliveryLocationErrorState();
      }
    }

    if (event is ProducerLocationLoadEvent) {
      yield ProducerLocationLoadingState();
      try {
        final LatLng _loadedProducerLocation =
            await locationsClient.getProducerLocation(event.producerName);
        yield ProducerLocationLoadSuccessState(
            producerLocation: _loadedProducerLocation);
      } catch (e) {
        print(e);
        yield ProducerLocationErrorState();
      }
    }
  }
}
