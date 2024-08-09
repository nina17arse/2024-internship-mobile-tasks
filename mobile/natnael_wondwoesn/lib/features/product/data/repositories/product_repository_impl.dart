import 'package:dartz/dartz.dart';
import 'package:flutter_application_5/features/product/data/data_sources/remote_data_source/remote_data_source.dart';
import 'package:flutter_application_5/features/product/domain/entities/product_entity.dart';
import '../../../../core/errors/failure/failures.dart';
import '../../domain/repositories/product_repository.dart';
import '../data_sources/local_data_source/local_data_source.dart';
import 'package:flutter_application_5/core/network/network_info.dart';


class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSourceImpl remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl(this.remoteDataSource, this.localDataSource, this.networkInfo);

  @override
  Future<Either<Failure,List<ProductEntity>>> getProducts() async {
     if(await networkInfo.isConnected){
       try{
        final products = await remoteDataSource.getProducts();
        localDataSource.addProduct(products);
        return Right(products);
      } on ServerFailure {
        return Left(ServerFailure("Server Failure"));
      }
     }else {
      try{
        final products = await localDataSource.getProducts();
        return Right(products);
      }on LocalDataSourceFailure {
        return Left(LocalDataSourceFailure('Failed to get products'));
      }
     }
  }// Get Products impl




  @override
  Future<Either<Failure,ProductEntity>> getProduct(String productId) async {
    if(await networkInfo.isConnected){
       try{
        final product = await remoteDataSource.getProduct(productId);
        localDataSource.addProduct(product);
        return Right(product);
      } on ServerFailure {
        return Left(ServerFailure());
      }
     }else {
      try{
        final product = await localDataSource.getProduct(productId);
        return Right(product);
      }on LocalDataSourceFailure {
        return Left(LocalDataSourceFailure('Failed to get product'));
      }
     }
  }// Get Product impl

  @override
  Future<Either<Failure,String>> addProduct(String name, String description, double price, String imageUrl) async {
    try{
        final products = await remoteDataSource.addProduct(product);
        return Right(products);
      } on Exception {
        return Left(ServerFailure('Server: Failed to add product'));
      } 
  } // Add Product impl




  @override
  Future<Either<Failure,String>> updateProduct(String productId, String name, String description, double price, String imageUrl) async {
    try{
        final products = await remoteDataSource.updateProduct();
        return Right(products);
      } on Exception {
        return Left(ServerFailure('Server: Failed to update product'));
      } 
      } // Update Product impl

  @override
  Future<Either<Failure,String>> deleteProduct(String productId) async {
    try{
        final products = await remoteDataSource.deleteProduct(productId);
        return Right(products);
      } on Exception {
        return Left(ServerFailure('Server: Failed to delete product'));
      } 
      } // Delete Product impl
  
}
