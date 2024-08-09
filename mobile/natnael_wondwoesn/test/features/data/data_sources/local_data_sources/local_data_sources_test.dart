import 'package:flutter_application_5/features/product/data/data_sources/local_data_source/local_data_source.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockLocalDataSource extends Mock implements SharedPreferences {

}

void main(){
  MockLocalDataSource mockLocalDataSource = MockLocalDataSource();
  

  setUp((){
    mockLocalDataSource = MockLocalDataSource();
  })

}