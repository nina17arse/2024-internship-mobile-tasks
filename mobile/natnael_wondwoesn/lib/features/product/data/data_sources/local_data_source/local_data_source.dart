import 'dart:async';
import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:flutter_application_5/features/product/data/data_sources/remote_data_source/remote_data_source.dart';
import 'package:flutter_application_5/features/product/domain/entities/product_entity.dart';
import '../../../../../core/errors/exceptions/exceptions.dart';
import '../../../../../core/errors/failure/failures.dart';
import '../../../domain/repositories/product_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ProductLocalDataSource extends ProductRepository {
  final SharedPreferences sharedPreferences;

  ProductLocalDataSource(this.sharedPreferences);
  


  @override
  Future<Either<Failure, String>> deleteProduct(String id) async {

    // Shared Pref instanse
    var sharedPref = await SharedPreferences.getInstance();

    await sharedPref.remove(id);
    if (sharedPref.containsKey(id)) {
      return Left(LocalDataSourceFailure('Failed to delete product'));
    } else {
      return Right('Product Successfully Deleted');
    }
  }
  @override
  Future<Either<Failure, String>> addProduct(String name, String description, double price, String imagePath) async {
    // Shared Pref instanse
    var sharedPref = await SharedPreferences.getInstance();
    // sharedPref.then((value) => value.setString(name, description));
    await sharedPref.setString(name, description);
    if (sharedPref.containsKey(name)) {
      return Left(LocalDataSourceFailure('Failed to add product'));
    }
    return Right('Product Successfully Added');

  }
  @override
  Future<Either<Failure, String>> updateProduct(String id, String name, String description, double price, String imagePath) async{
    var sharedPref_up = await SharedPreferences.getInstance();

    await sharedPref_up.setString(id, name);
    await sharedPref_up.setDouble(id, price);
    await sharedPref_up.setString(id, description);
    await sharedPref_up.setString(id, imagePath);

    if (sharedPref_up.containsKey(id) && sharedPref_up.containsKey(name) && sharedPref_up.containsKey(description) && sharedPref_up.containsKey(imagePath)) {
      return Right('Product Successfully Updated');
    } else {
      return Left(LocalDataSourceFailure('Failed to update product'));
    }
    
  }
  
  @override
  Future<Either<Failure, ProductEntity>> getProduct(String id) async {
    var sharedPref_get = await SharedPreferences.getInstance();
      if (sharedPref_get.containsKey(id)){
        return Right(sharedPref_get);
      }else{
        return Left(LocalDataSourceFailure("Failed to get product"));
      }
  }
  
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    var sharedPref_get = await SharedPreferences.getInstance();
      if (sharedPref_get.containsKey(id)){
        return Right(sharedPref_get.);
      }else{
        return Left(LocalDataSourceFailure("Failed to get product"));
      }
  }


}
