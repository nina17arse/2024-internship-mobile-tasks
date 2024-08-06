import 'package:dartz/dartz.dart';
import '../entities/product_entity.dart';
import '../../../../core/errors/failure/failures.dart';


abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, ProductEntity>> getProduct(String id);
  Future<Either<Failure, String>> addProduct(
    String name,String description, double price);
  Future<Either<Failure, void>> updateProduct(
    String name,String description, double price);
  Future<Either<Failure, void>> deleteProduct(String id);
} 