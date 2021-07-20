part of 'producer_bloc.dart';

abstract class ProducerState {}

class LoadingProducerState extends ProducerState {}

class LoadedProducerState extends ProducerState {
  List<Producer> producers;
  LoadedProducerState({this.producers});
}

class FailedToLoadProducerState extends ProducerState {
  Error error;
  FailedToLoadProducerState({this.error});
}
