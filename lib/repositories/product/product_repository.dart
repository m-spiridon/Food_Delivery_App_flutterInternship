import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internship_project_1/models/product_model.dart';
import 'package:internship_project_1/repositories/product/base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  @override
  Future<Product> getProductWithId(int id) async {
    final productSnap = await FirebaseFirestore.instance
        .collection('Product')
        .where('id', isEqualTo: id)
        .get();
    final product = productSnap.docs.first;

    return Product.fromSnapshot(product);
  }

  @override
  Future<List<Product>> getProducts() async {
    List<Product> productsList;
    final productCollection =
        await FirebaseFirestore.instance.collection('Products').get();
    final products = productCollection.docs;
    productsList = products.map((doc) => Product.fromSnapshot(doc)).toList();

    return productsList;
  }
}
