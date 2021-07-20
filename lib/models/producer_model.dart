import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Producer extends Equatable {
  final String id;
  final String name;
  final String description;
  final String image;
  Producer({
    this.id,
    this.name,
    this.description,
    this.image,
  });

  @override
  List<Object> get props => [id, name, description, image];

  Map<String, dynamic> toDocumnet() {
    return {
      'name': name,
      'description': description,
      'image': image,
    };
  }

  factory Producer.fromSnapshot(DocumentSnapshot doc) {
    if (doc == null) return null;
    final data = doc.data();
    return Producer(
      id: doc.id,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      image: data['image'] ?? '',
    );
  }
}
