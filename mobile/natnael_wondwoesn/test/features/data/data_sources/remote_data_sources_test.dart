import 'package:flutter_application_5/core/constants/constants.dart';
import 'package:flutter_application_5/core/errors/failure/failures.dart';
import 'package:flutter_application_5/features/product/data/data_sources/remote_data_source/remote_data_source.dart';
import 'package:flutter_application_5/features/product/data/models/product_models.dart';

import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../helpers/read_json.dart';
import '../../../helpers/test_helper.mocks.dart';

void main(){
  late MockHttpClient mockHttpClient;
  late ProductRemoteDataSourceImpl productRemoteDataSourceImpl = ProductRemoteDataSourceImpl(client: mockHttpClient);

  setUp((){
    mockHttpClient = MockHttpClient();
    productRemoteDataSourceImpl = ProductRemoteDataSourceImpl(client: mockHttpClient);  
  });

  
  const testId = '6672776eb905525c145fe0bb';

  // final testProductModel = ProductModel(
  //   id: '66b0b23928f63adda72ab38a',
  //   name: 'PC', 
  //   description: 'long description', 
  //   price: 123, 
  //   imagePath: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1722855993/images/soyhb68osjiemyy2btte.png'
  //   );

  group('Api test', (){

    test(
      'should be a subclass of product model',
      ()  async {
    // Arrange
      when(mockHttpClient.get(Uri.parse(Urls.getProduct(testId)))).thenAnswer(
        (_) async => http.Response(
          jsonDec('helpers/dummy_data/response.json'),
          200
        )
      );
    // Act
    final result = await  productRemoteDataSourceImpl.getProduct(testId);

    // Assert
    expect(result, isA<ProductModel>());
      }
    );

    test('If Exception Happens', () async {
      // Arrange
      when(mockHttpClient.get(Uri.parse(Urls.getProduct(testId)))).thenAnswer(
        (_) async => http.Response(
          'NOT FOUND',
          404
        ));

      // Act
      final call = productRemoteDataSourceImpl.getProduct;

      // Assert
      expect(() => call(testId), throwsA(isA<ServerFailure>()));
    });
  

  });
  


  
  }