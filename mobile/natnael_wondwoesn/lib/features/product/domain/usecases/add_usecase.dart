import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../repositories/product_repository.dart';
import 'package:equatable/equatable.dart';
import '../entities/product_entity.dart';

class AddProductUseCase implements UseCase<String, ProductParams> {
  final ProductRepository abstractProductRepository;

  AddProductUseCase(this.abstractProductRepository);

  @override
  Future<Either<Failure, String>> call(ProductParams product) async {
    return await abstractProductRepository.addProduct(
        product.name, product.description, product.price
    );
  }
}

class ProductParams extends Equatable {
  final String name;
  final String description;
  final double price;
  const ProductParams(
      {required this.name, required this.description, required this.price});

  @override
  List<Object?> get props => [id, name, description, price];
}
