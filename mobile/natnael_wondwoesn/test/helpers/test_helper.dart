import 'package:mockito/annotations.dart';
import 'package:flutter_application_5/features/product/domain/repositories/product_repository.dart';
import 'package:http/http.dart' as http;

@GenerateMocks(
  [
    ProductRepository
  ], 
  customMocks: [
    MockSpec<http.Client>(as: #MockHttpClient),
  ],
  )

void main() {}