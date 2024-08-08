import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../repositories/product_repository.dart';
import 'package:equatable/equatable.dart';
import '../entities/product_entity.dart';

class GetDetailUseCase implements UseCase<ProductEntity, String> {
  final ProductRepository abstractProductRepository;

  GetDetailUseCase(this.abstractProductRepository);

  Future<Either<Failure,ProductEntity>> call(String id) async {
    return await abstractProductRepository.getProduct(id);
  }
}