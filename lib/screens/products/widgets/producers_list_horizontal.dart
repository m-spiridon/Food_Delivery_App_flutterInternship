import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/components/view_all_btn.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/producers_screen/bloc/nav_cubit.dart';
import 'package:internship_project_1/screens/producers_screen/bloc/producer_bloc.dart';
import 'package:internship_project_1/screens/producers_screen/producer_list.dart';
import 'package:internship_project_1/screens/producers_screen/producers.dart';
import 'package:internship_project_1/screens/producers_screen/producers_horizontal.dart';

class ProducersListHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).ourProducersTitle,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              ViewAllBtn(onClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProducerList()),
                );
              })
            ],
          ),
        ),
        MultiBlocProvider(providers: [
          BlocProvider(create: (context) => NavCubit()),
          BlocProvider(
              create: (context) => ProducerBloc()..add(LoadProducerEvent())),
        ], child: ProducerHorizontal())
      ],
    );
  }
}
