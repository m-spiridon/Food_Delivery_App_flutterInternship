import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internship_project_1/screens/products/models/food_type.dart';
import 'package:internship_project_1/screens/products/models/product.dart';

class ProductsClient {
  Future<List<FoodType>> getFoodTypes() async {
    QuerySnapshot foodTypesDocs;
    List<QueryDocumentSnapshot> foodTypes;
    List<FoodType> foodTypesList = [];

    foodTypesDocs =
        await FirebaseFirestore.instance.collection('FoodTypes').get();

    foodTypes = foodTypesDocs.docs;

    foodTypes.forEach((docSnap) {
      foodTypesList.add(
          FoodType(name: docSnap['name'], background: docSnap['background']));
    });

    return foodTypesList;
  }

  Future<List<Product>> getProductsByFoodType(String foodType) async {
    QuerySnapshot productsDocs;
    List<QueryDocumentSnapshot> products;
    List<Product> productsList = [];

    productsDocs = await FirebaseFirestore.instance
        .collection('Product')
        .where('foodType', isEqualTo: foodType.toLowerCase())
        .get();

    products = productsDocs.docs;

    products.forEach((docSnap) {
      productsList.add(Product(
        title: docSnap.id,
        id: docSnap['id'],
        image: docSnap['image'],
        subtitle: docSnap['subtitle'],
        price: docSnap['price'],
        amount: docSnap['amount'],
        category: docSnap['category'],
        foodType: docSnap['foodType'],
      ));
    });

    return productsList;
  }

  Future<List<Product>> getProductsByName(String searchQuery) async {
    QuerySnapshot productsDocs;
    List<QueryDocumentSnapshot> products;
    List<Product> productsList = [];

    if (searchQuery != null && searchQuery.trim().isNotEmpty) {
      productsDocs = await FirebaseFirestore.instance
          .collection('Product')
          .where('title', isGreaterThanOrEqualTo: searchQuery.toLowerCase())
          .where('title', isLessThan: searchQuery.toLowerCase() + '\uf8ff')
          .get();
    } else {
      productsDocs =
          await FirebaseFirestore.instance.collection('Product').get();
    }

    products = productsDocs.docs;

    products.forEach((docSnap) {
      productsList.add(Product(
        title: docSnap.id,
        id: docSnap['id'],
        image: docSnap['image'],
        subtitle: docSnap['subtitle'],
        price: docSnap['price'],
        amount: docSnap['amount'],
        category: docSnap['category'],
        foodType: docSnap['foodType'],
      ));
    });

    return productsList;
  }
}
