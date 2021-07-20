import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:internship_project_1/models/models.dart';
import 'package:internship_project_1/repositories/repositories.dart';

part 'producer_event.dart';
part 'producer_state.dart';

class ProducerBloc extends Bloc<ProducerEvent, ProducerState> {
  final _producerRepository = ProducerRepository();

  ProducerBloc() : super(LoadingProducerState());

  @override
  Stream<ProducerState> mapEventToState(
    ProducerEvent event,
  ) async* {
    if (event is LoadProducerEvent) {
      yield LoadingProducerState();

      try {
        final data = await _producerRepository.getProducers();
        yield LoadedProducerState(producers: data);
      } catch (e) {
        yield FailedToLoadProducerState(error: e);
      }
    }
  }
}
