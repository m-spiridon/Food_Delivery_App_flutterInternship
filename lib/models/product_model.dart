import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String title;
  final String subtitle;
  final String image;
  final String foodType;
  final String category;
  final String amount;
  final String produced;
  final String shelf;
  final String company;
  final double price;
  int quantity;
  final List<String> wraps;
  bool isFavorite;

  Product({
    this.id,
    this.title,
    this.subtitle,
    this.image,
    this.foodType,
    this.category,
    this.amount,
    this.produced,
    this.shelf,
    this.company,
    this.price,
    this.wraps,
    this.isFavorite,
  });

  @override
  List<Object> get props => [
        id,
        title,
        subtitle,
        image,
        foodType,
        category,
        amount,
        produced,
        shelf,
        company,
        price,
        wraps,
        isFavorite,
      ];

  Map<String, dynamic> toDocumnet() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'image': image,
      'foodType': foodType,
      'category': category,
      'amount': amount,
      'produced': produced,
      'shelf': shelf,
      'company': company,
      'price': price,
      'wraps': wraps,
    };
  }

  factory Product.fromSnapshot(DocumentSnapshot doc) {
    if (doc == null) return null;
    final data = doc.data();
    return Product(
      title: data['title'],
      id: data['id'] ?? 1,
      subtitle: data['subtitle'] ?? '',
      image: data['image'] ?? '',
      foodType: data['foodType'] ?? '',
      category: data['category'] ?? '',
      amount: data['amount'] ?? '',
      produced: data['produced'] ?? '',
      shelf: data['shelf'] ?? '',
      company: data['company'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      wraps: data['wraps'] ?? [],
    );
  }
  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
  }
}
