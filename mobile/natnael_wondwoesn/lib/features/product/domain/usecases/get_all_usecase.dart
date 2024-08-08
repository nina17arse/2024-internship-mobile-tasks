import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../repositories/product_repository.dart';
import 'package:equatable/equatable.dart';
import '../entities/product_entity.dart';
import 'add_usecase.dart';

class GetAllUsecase implements UseCase<List<ProductEntity>, NoParams> {
  final ProductRepository abstractProductRepository;

  GetAllUsecase(this.abstractProductRepository);

  @override
  Future<Either<Failure, List<ProductEntity>> > call(NoParams params) async {
    return await abstractProductRepository.getProducts();
  }
}