import 'package:dartz/dartz.dart';
import '../../data/models/product_models.dart';
import '../entities/product_entity.dart';
import '../../../../core/errors/failure/failures.dart';


abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, ProductEntity>> getProduct(String id);
  Future<Either<Failure, String>> addProduct(
    String name,String description, double price,String imagePath);
  Future<Either<Failure, String>> updateProduct(
    String id,String name,String description, double price,String imagePath);
  Future<Either<Failure, String>> deleteProduct(String id);
} 