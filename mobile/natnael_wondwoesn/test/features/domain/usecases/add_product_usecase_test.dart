import 'package:dartz/dartz.dart';
import 'package:flutter_application_5/features/product/domain/entities/product_entity.dart';
import 'package:flutter_application_5/features/product/domain/usecases/add_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
// Import for Web

import '../../../helpers/test_helper.mocks.dart';

void main(){
  AddProductUseCase addProductUseCase = AddProductUseCase(MockProductRepository());
  MockProductRepository mockProductRepository = MockProductRepository(); 

  setUp(){
    mockProductRepository = MockProductRepository();
    addProductUseCase = AddProductUseCase(mockProductRepository);
  }
   
  const tProduct = ProductEntity(
    id: '1',
    name: 'Test Product',
    description: 'Test Description',
    price: 10.0,
    imagePath: 'test.jpg',
  );

  test(
    'should add a product to the repository',
    () async {
      // Arrange
      when(mockProductRepository.addProduct(tProduct.name,tProduct.description,tProduct.price.toDouble(),tProduct.imagePath))
          .thenAnswer((_) async => const Right('Success'));

      // Act
      final result = await addProductUseCase.call(tProduct);

      // Assert
      expect(result, const Right('Success'));
      // verify(mockProductRepository.addProduct(tProduct.name,tProduct.description,tProduct.price.toDouble(),tProduct.imagePath));
      // verifyNoMoreInteractions(mockProductRepository);
    },
  );



}