import '../../features/product/domain/entities/product_entity.dart';

class Urls {
  static const url_path = 'https://g5-flutter-learning-path-be.onrender.com/api/v1';
  static String getProduct(String id)=>
      '$url_path/products/$id';
  static String getProducts()=>
      '$url_path/products';
  static String addProduct(ProductEntity product) =>
      '$url_path/products';
  static String deleteProduct(String id) =>
      '$url_path/products/$id';
  static String updateProduct(ProductEntity product) =>
      '$url_path/products/$product';

}