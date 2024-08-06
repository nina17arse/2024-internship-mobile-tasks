import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_5/core/errors/failure/failures.dart';
import 'package:flutter_application_5/features/product/domain/entities/product_entity.dart';
import 'package:flutter_application_5/features/product/domain/repositories/product_repository.dart';
import 'package:flutter_application_5/features/product/domain/usecases/add_usecase.dart';


// Mock class for ProductRepository
@GenerateMocks([ProductRepository])
void main() {
  late AddProductUseCase useCase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    useCase = AddProductUseCase(mockProductRepository);
  });

  final tProductParams = ProductParams(
    name: 'Test Product',
    description: 'Test Description',
    price: 10.0,
  );

  final tProductEntity = ProductEntity(
    id: '1',
    name: 'Test Product',
    description: 'Test Description',
    price: 10.0,
  );

  test(
    'should add product to the repository',
    () async {
      // Arrange
      when(mockProductRepository.addProduct(tProductParams.name, tProductParams.description, tProductParams.price))
          .thenAnswer((_) async => const Right('SUCCESS'));

      // Act
      final result = await useCase(tProductParams);

      // Assert
      expect(result, const Right('ERROR'));
      verify(mockProductRepository.addProduct(tProductParams.name, tProductParams.description, tProductParams.price));
      verifyNoMoreInteractions(mockProductRepository);
    },
  );

  test(
    'should return failure when repository fails',
    () async {
      // Arrange
      when(mockProductRepository.addProduct(tProductParams.name, tProductParams.description, tProductParams.price))
          .thenAnswer((_) async => Left(ServerFailure()));

      // Act
      final result = await useCase(tProductParams);

      // Assert
      expect(result, Left(ServerFailure()));
      verify(mockProductRepository.addProduct(tProductParams.name, tProductParams.description, tProductParams.price));
      verifyNoMoreInteractions(mockProductRepository);
    },
  );
}
