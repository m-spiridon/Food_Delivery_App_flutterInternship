import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/models/models.dart';

class NavCubit extends Cubit<Producer> {
  NavCubit() : super(null);

  void showProducerDetails(Producer producer) => emit(producer);

  void popToProducers() => emit(null);
}
