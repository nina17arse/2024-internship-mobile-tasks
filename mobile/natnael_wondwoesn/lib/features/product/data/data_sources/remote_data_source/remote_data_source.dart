import 'dart:convert';
import 'package:flutter_application_5/core/constants/constants.dart';
import 'package:get/get.dart';
import  'package:http/http.dart' as http;
import 'package:flutter_application_5/features/product/data/models/product_models.dart';
import '../../../domain/entities/product_entity.dart';



abstract class ProductRemoteDataSource {

  Future <ProductModel> getProduct(String id);
  Future<String> addProduct(ProductModel product);
  Future<String> deleteProduct(String id);
  Future<String> updateProduct(ProductModel product);
  Future<List<ProductEntity>> getProducts();
 
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final http.Client client;
  ProductRemoteDataSourceImpl({required this.client});
  
  @override
  Future<ProductModel> getProduct(String id) async {
    final response = await client.get(Uri.parse(Urls.getProduct(id)));
    if (response.statusCode == 200) {
      return 
      // return ProductModel.fromJson(jsonDecode(response.body)['data'][0]);// to be fixed
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<ProductEntity>> getProducts() async {
    final response = await client.get(Uri.parse(Urls.getProducts()));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['data'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<String> addProduct(ProductModel product) async {
    final response = await client.post(
      Uri.parse(Urls.getProducts()),
      // headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      // },
      body: (product.toJson()),
      
    );
    if (response.statusCode == 200) {
      return 'Product added successfully';
    } else {
      throw Exception('Failed to add product');
    }
  }

  Future<String> deleteProduct(String id) async {
    final response = await client.delete(Uri.parse(Urls.deleteProduct(id)));
    if (response.statusCode == 200) {
      return 'Product deleted successfully';
    } else {
      throw Exception('Failed to delete product');
    }
  }

  Future<String> updateProduct(ProductModel product) async {
    final response = await client.put(
      Uri.parse(Urls.updateProduct(product)),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },addProduct
      body: jsonEncode(product.toJson('update')),
    );
    if (response.statusCode == 200) {
      return 'Product updated successfully';
    } else {
      throw Exception('Failed to update product');
    }
  }


}