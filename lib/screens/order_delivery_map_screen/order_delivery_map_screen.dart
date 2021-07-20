import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:internship_project_1/mocks/delivery_map_screens_mock.dart';
import 'package:internship_project_1/screens/order_delivery_map_screen/bloc/locations_bloc.dart';
import 'package:internship_project_1/screens/order_delivery_map_screen/widgets/arrow_back_in_square.dart';
import 'package:internship_project_1/screens/order_delivery_map_screen/widgets/delivery_status_bar.dart';
import 'package:internship_project_1/screens/order_delivery_map_screen/widgets/order_delivery_map.dart';

class OrderDeliveryMapScreen extends StatelessWidget {
  final LatLng deliveryLocation;
  OrderDeliveryMapScreen({@required this.deliveryLocation});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationsBloc>(
      create: (context) => LocationsBloc(),
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Stack(children: [
                OrderDeliveryMap(
                  producerName: deliveryMock['producerName'],
                  deliveryLocation: deliveryLocation,
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.07,
                  left: 24.0,
                  child: ArrowBackInSquare(),
                )
              ]),
            ),
            DeliveryStatusBar(),
          ],
        ),
      ),
    );
  }
}
