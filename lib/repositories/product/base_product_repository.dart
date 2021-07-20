import 'package:internship_project_1/models/models.dart';

abstract class BaseProductRepository {
  Future<List<Product>> getProducts();
  Future<Product> getProductWithId(int id);
}
