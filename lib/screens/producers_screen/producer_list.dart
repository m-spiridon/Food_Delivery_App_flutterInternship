import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/screens/producers_screen/bloc/producer_bloc.dart';
import 'package:internship_project_1/screens/producers_screen/producer_nav.dart';
import 'bloc/nav_cubit.dart';

class ProducerList extends StatelessWidget {
  //final producerRepository = ProducerRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => NavCubit()),
      BlocProvider(
          create: (context) => ProducerBloc()..add(LoadProducerEvent())),
    ], child: ProducerNavigator());
  }
}
