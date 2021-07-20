import 'package:internship_project_1/models/producer_model.dart';
import 'package:internship_project_1/repositories/producer/base_producer_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProducerRepository extends BaseProducerRepository {
  @override
  Future<List<Producer>> getProducers() async {
    List<Producer> producerList;
    final producerCollection =
        await FirebaseFirestore.instance.collection('Producers').get();
    final producers = producerCollection.docs;
    producerList = producers.map((doc) => Producer.fromSnapshot(doc)).toList();
    return producerList;
  }
}
