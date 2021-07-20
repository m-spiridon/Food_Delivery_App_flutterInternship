import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:internship_project_1/mocks/delivery_map_screens_mock.dart';
import 'package:internship_project_1/screens/order_delivery_map_screen/bloc/locations_bloc.dart';
import 'package:internship_project_1/screens/order_delivery_map_screen/bloc/locations_event.dart';
import 'package:internship_project_1/screens/order_delivery_map_screen/bloc/locations_state.dart';

class DeliveryLocationMap extends StatefulWidget {
  DeliveryLocationMap({Key key}) : super(key: key);

  @override
  State<DeliveryLocationMap> createState() => _DeliveryLocationMapState();
}

class _DeliveryLocationMapState extends State<DeliveryLocationMap> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = {};
  BitmapDescriptor finishIcon;

  void setMarkerIcons() async {
    finishIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/delivery_map_screen/finish_pin.png');
  }

  void setMarkers(LatLng endPosition) {
    setState(() {
      markers = {
        Marker(
          markerId: MarkerId("finish"),
          position: endPosition,
          icon: finishIcon,
        ),
      };
    });
  }

  @override
  initState() {
    super.initState();
    setMarkerIcons();
    final LocationsBloc locationsBloc = BlocProvider.of<LocationsBloc>(context);
    locationsBloc
        .add(DeliveryLocationLoadEvent(userName: deliveryMock['userName']));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationsBloc, LocationsState>(
        builder: (context, state) {
      if (state is DeliveryLocationLoadingState) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is DeliveryLocationLoadSuccessState) {
        deliveryMock['deliveryLocation'] = state.deliveryLocation;
        return GoogleMap(
          myLocationButtonEnabled: false,
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: state.deliveryLocation,
            zoom: 15.0,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            setMarkers(state.deliveryLocation);
          },
          markers: markers,
        );
      }
      if (state is ProducerLocationErrorState) {
        print('Failure loading Delivery location');
        return Center(
          child: Text(
              'Oops...an error occurred. Maybe there is something with your internet connection'),
        );
      }
      return Center(child: Text('Loading...'));
    });
  }
}
