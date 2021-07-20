import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/components/producer_card.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/producers_screen/bloc/nav_cubit.dart';
import 'package:internship_project_1/screens/producers_screen/bloc/producer_bloc.dart';
import 'package:internship_project_1/shared/colors.dart';

class ProducerHorizontal extends StatelessWidget {
  const ProducerHorizontal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProducerBloc, ProducerState>(
      builder: (context, state) {
        if (state is LoadingProducerState) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(orange),
            ),
          );
        } else if (state is LoadedProducerState) {
          return Container(
            height: MediaQuery.of(context).size.height / 2.5,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.producers.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: InkWell(
                      onTap: () => BlocProvider.of<NavCubit>(context)
                          .showProducerDetails(state.producers[index]),
                      child: ProducerCard(
                        producerName: state.producers[index].name,
                        producerDescription: state.producers[index].description,
                        producerImage: state.producers[index].image,
                      ),
                    ),
                  );
                }),
          );
        } else if (state is FailedToLoadProducerState) {
          return Center(
            child: Text(S.of(context).errorState),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(orange),
            ),
          );
        }
      },
    );
  }
}
