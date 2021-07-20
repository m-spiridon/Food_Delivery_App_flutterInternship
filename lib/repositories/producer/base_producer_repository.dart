import 'package:internship_project_1/models/models.dart';

abstract class BaseProducerRepository {
  Future<List<Producer>> getProducers();
}
