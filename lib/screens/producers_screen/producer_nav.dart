import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/models/producer_model.dart';
import 'package:internship_project_1/screens/producers_screen/bloc/nav_cubit.dart';
import 'package:internship_project_1/screens/producers_screen/producers.dart';
import 'package:internship_project_1/screens/producers_screen/producers_horizontal.dart';

class ProducerNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, Producer>(builder: ((context, state) {
      return Navigator(
        pages: [
          MaterialPage(child: ProducerHorizontal()),
          MaterialPage(child: OurProducers()),
          if (state != null)
            MaterialPage(child: ProducerDetails(producer: state))
        ],
        onPopPage: (route, result) {
          BlocProvider.of<NavCubit>(context).popToProducers();
          return route.didPop(result);
        },
      );
    }));
  }
}
