import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/producers_screen/bloc/nav_cubit.dart';
import 'package:internship_project_1/screens/producers_screen/bloc/producer_bloc.dart';
import 'package:internship_project_1/screens/products/products_screen.dart';
import 'package:internship_project_1/shared/colors.dart';

class OurProducers extends StatelessWidget {
  const OurProducers({Key key}) : super(key: key);

  Widget ColorFilteredMy(state, context, index) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
      child: SizedBox(
        width: double.infinity,
        height: 200.0,
        child: Image.network(
          state.producers[index].image,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(S.of(context).ourProducersTitle),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ProductsScreen(),
                )),
          ),
        ),
        body: BlocBuilder<ProducerBloc, ProducerState>(
          builder: (context, state) {
            if (state is LoadingProducerState) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(orange),
                ),
              );
            } else if (state is LoadedProducerState) {
              return ListView.builder(
                itemCount: state.producers.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(5.0),
                    child: InkWell(
                      onTap: () => BlocProvider.of<NavCubit>(context)
                          .showProducerDetails(state.producers[index]),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ColorFilteredMy(state, context, index),
                          Text(
                            state.producers[index].name,
                            style:
                                TextStyle(color: Colors.white, fontSize: 24.0),
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
        ));
  }
}
