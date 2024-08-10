import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_5/core/constants/constants.dart';
import 'package:get/get.dart';
import  'package:http/http.dart' as http;
import 'package:flutter_application_5/features/product/data/models/product_models.dart';
import '../../../../../core/errors/failure/failures.dart';
import '../../../domain/entities/product_entity.dart';



abstract class ProductRemoteDataSource {

  Future <ProductModel> getProduct(String id);
  Future<ProductModel> addProduct(ProductModel product);
  Future<String> deleteProduct(String id);
  Future<ProductModel> updateProduct(ProductModel product);
  Future<List<ProductEntity>> getProducts();
 
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final http.Client client;
  ProductRemoteDataSourceImpl({required this.client});
  
  @override
  Future<ProductModel> getProduct(String id) async {
    final response = await client.get(Uri.parse(Urls.getProduct(id)));
    if (response.statusCode == 200) {
      return ProductModel.fromJson(jsonDecode(response.body));
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

  @override
  Future<ProductModel> addProduct(ProductModel product) async {
    var request = http.MultipartRequest('POST', Uri.parse(Urls.addProduct(product)));

    request.fields.addAll(product.toJson());

    request.files.add(await http.MultipartFile.fromPath('image', 'Temporary file path'));//

    var response = await request.send();

    if (response.statusCode == 201) {
      var responseBody = await response.stream.bytesToString();
      return ProductModel.fromJson(jsonDecode(responseBody[0]));
    } else {
      throw Exception('Failed to load data');
    }
  //  To be edited with the image picker if needed also the response has to be product entity changed using from json
  }

  Future<String> deleteProduct(String id) async {
    final response = await client.delete(Uri.parse(Urls.deleteProduct(id)));
    if (response.statusCode == 200) {
      return 'Product deleted successfully';
    } else {
      throw Exception('Failed to delete product');
    }
  }

  @override
  Future<ProductModel> updateProduct(ProductModel product) async {
    var request = http.MultipartRequest('PUT', Uri.parse(Urls.updateProduct(product)));

    request.fields.addAll(product.toJson());

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      return ProductModel.fromJson(jsonDecode(responseBody)['data']);
    } else {
      throw Exception('Failed to update product');
    }

    // the response has to be product entity changed using from json
  }


}