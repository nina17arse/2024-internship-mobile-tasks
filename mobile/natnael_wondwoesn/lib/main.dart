import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_application_5/features/product/presentation/pages/add_update.dart';
import 'package:flutter_application_5/features/product/presentation/pages/details.dart';
import 'package:flutter_application_5/features/product/presentation/pages/home.dart';
import 'package:flutter_application_5/features/product/presentation/pages/search.dart';
import 'package:flutter_application_5/features/product/presentation/pages/update.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/product/data/data_sources/local_data_source/local_data_source.dart';
import 'features/product/data/data_sources/remote_data_source/remote_data_source.dart';
import 'features/product/data/models/product_models.dart';
// import 'models/product.dart';
import 'package:provider/provider.dart';

import 'features/product/domain/entities/product_entity.dart';
import 'features/product/domain/repositories/product_repository.dart';
import 'features/product/domain/usecases/get_all_usecase.dart';
import 'features/product/domain/usecases/get_detail_usecase.dart';
import 'features/product/presentation/bloc/home_bloc.dart';
import 'features/product/presentation/bloc/home_event.dart';
import 'models/product.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  /* Test the data sources
  var sharedPreference = await SharedPreferences.getInstance();

  var localData = ProductLocalDataSourceImpl(sharedPreferences: sharedPreference);

  var client = http.Client();

  var remoteData = ProductRemoteDataSourceImpl(client: client);
  

  var product = ProductModel(
    id: '66b0b23928f63adda72ab38a',
    name: 'PC', 
    description: 'long description', 
    price: 123, 
    imagePath:  File('bcdd/pda'),);

    var product_1 = ProductModel(
    id: '66b0b23928f63adda72ab38a',
    name: 'PC', 
    description: 'long description', 
    price: 124, 
    imagePath: File('/home/wonde/Pictures/photo_2024-07-30_10-50-46.jpg'),);

    Local Data Source
    var ab = await localData.addProduct(product);
    var acr_17 = await localData.updateProduct(product_1);
    print(acr_1);
    
    print(ac);  Local Data Source
    var aby = await localData.addProduct(product);
    var acr_1y = await localData.updateProduct(product_1);
    print(acr_1);
    var ai = await localData.addProduct(product_1);
    var acr2 = await localData.deleteProduct("66b0b23928f63adda72ab38a1");
    var ace = await localData.getProducts();
    print(ac);
    var acr12 = await localData.getProduct("66b0b23928f63adda72ab38a");
    print(acr1);
    Check Update mETHOD TOO unCHECKED
    var acr13 = await localData.getProduct("66b0b23928f63adda72ab38");
    print(acr1);
    Check Update mETHOD TOO unCHECKED

    Remote Data Source
    var c1 = await remoteData.getProducts();
    var c2 = await remoteData.getProduct('66b71cbc1ca792aa49e49056');
    var cr1 = await remoteData.getProduct("66b0b23928f63adda72ab38a");
    var bc = await remoteData.addProduct(product);
    print(bc);
    var b = await remoteData.addProduct(product_1);
    print(b);
    var c = await remoteData.deleteProduct("66b0b23928f63adda72ab38a1");
    print(c);
    var cr = await remoteData.updateProduct(product_1);
    print(cr);
    print(cr1);
    var c23 = await remoteData.addProduct(product_1);
    print(c23);
  */

  runApp(
    const Main(),
  );
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          final item = settings.arguments as Product;
          return MaterialPageRoute(
            builder: (context) {
              return DetailsPage(item: item as Product);
            },
          );
        }
        // Handle other routes here
        return null;
      },
      routes: {
        '/home': (context) => BlocProvider(
              create: (context) => HomeBloc()..add(GetProductsEvent()),
              child: HomePage(),
            ),
        '/add': (context) => AddUpdate(),
        '/search': (context) => searchPage(),
        '/update': (context) => UpdatePage(),
      },
    );
  }
}
