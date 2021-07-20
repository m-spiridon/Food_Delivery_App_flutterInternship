import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:internship_project_1/screens/order_delivery_map_screen/bloc/locations_bloc.dart';
import 'package:internship_project_1/screens/order_delivery_map_screen/bloc/locations_event.dart';
import 'package:internship_project_1/screens/order_delivery_map_screen/bloc/locations_state.dart';
import 'package:internship_project_1/shared/google_api_keys.dart';

class OrderDeliveryMap extends StatefulWidget {
  final String producerName;
  final LatLng deliveryLocation;
  const OrderDeliveryMap(
      {Key key, @required this.producerName, @required this.deliveryLocation})
      : super(key: key);

  @override
  _OrderDeliveryMapState createState() => _OrderDeliveryMapState();
}

class _OrderDeliveryMapState extends State<OrderDeliveryMap> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = {};
  BitmapDescriptor startIcon;
  BitmapDescriptor finishIcon;
  BitmapDescriptor courierIcon;
  Set<Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  void updateCamera(LatLng startPosition, LatLng endPosition,
      GoogleMapController controller) {
    LatLng customNortheast;
    LatLng customSouthwest;

    if (endPosition.latitude <= startPosition.latitude) {
      customNortheast = startPosition;
      customSouthwest = endPosition;
    } else {
      customNortheast = endPosition;
      customSouthwest = startPosition;
    }

    controller.animateCamera(CameraUpdate.newLatLngBounds(
        LatLngBounds(northeast: customNortheast, southwest: customSouthwest),
        70));
  }

  void setMarkerIcons() async {
    startIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/delivery_map_screen/start_pin.png');
    finishIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/delivery_map_screen/finish_pin.png');
    courierIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/delivery_map_screen/truck.png');
  }

  void setMarkers(
      LatLng startPosition, LatLng endPosition, LatLng courierPosition) {
    setState(() {
      markers = {
        Marker(
          markerId: MarkerId("start"),
          position: startPosition,
          icon: startIcon,
        ),
        Marker(
          markerId: MarkerId("finish"),
          position: endPosition,
          icon: finishIcon,
        ),
        Marker(
          markerId: MarkerId("courier"),
          position: courierPosition,
          icon: courierIcon,
        )
      };
    });
  }

  void setPolylines(LatLng startPosition, LatLng endPosition) async {
    String googleApiKey;

    if (Platform.isAndroid) {
      googleApiKey = GoogleApiKeys.android;
    } else if (Platform.isIOS) {
      googleApiKey = GoogleApiKeys.iOS;
    }

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey,
      PointLatLng(startPosition.latitude, startPosition.longitude),
      PointLatLng(endPosition.latitude, endPosition.longitude),
    );

    if (result.errorMessage.isEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }

    Polyline polyline = Polyline(
        polylineId: PolylineId('poly'),
        width: 2,
        color: Color(0xFFEF9D3A),
        points: polylineCoordinates);

    setState(() {
      polylines.add(polyline);
    });
  }

  void startMoving(LatLng startPosition, LatLng endPosition) async {
    print(polylineCoordinates.length);
    for (int i = 0; i < polylineCoordinates.length; i++) {
      await Future.delayed(Duration(milliseconds: 100), () {
        LatLng courierPosition = polylineCoordinates[i];
        setMarkers(startPosition, endPosition, courierPosition);
        print(markers.last.position);
      });
    }
  }

  @override
  initState() {
    super.initState();
    setMarkerIcons();
    final LocationsBloc locationsBloc = BlocProvider.of<LocationsBloc>(context);
    locationsBloc
        .add(ProducerLocationLoadEvent(producerName: widget.producerName));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationsBloc, LocationsState>(
        builder: (context, state) {
      if (state is ProducerLocationLoadingState) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is ProducerLocationLoadSuccessState) {
        return GoogleMap(
          onCameraMoveStarted: () {
            startMoving(state.producerLocation, widget.deliveryLocation);
          },
          myLocationButtonEnabled: false,
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: widget.deliveryLocation,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            updateCamera(
                state.producerLocation, widget.deliveryLocation, controller);
            setMarkers(state.producerLocation, widget.deliveryLocation,
                state.producerLocation);
            setPolylines(state.producerLocation, widget.deliveryLocation);
          },
          markers: markers,
          polylines: polylines,
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
