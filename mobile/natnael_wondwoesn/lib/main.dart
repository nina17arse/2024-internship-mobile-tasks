
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_application_5/pages/add_update.dart';
import 'package:flutter_application_5/pages/details.dart';
import 'package:flutter_application_5/pages/home.dart';
import 'package:flutter_application_5/pages/search.dart';
import 'package:flutter_application_5/pages/update.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/product/data/data_sources/local_data_source/local_data_source.dart';
import 'features/product/data/models/product_models.dart';
// import 'models/product.dart';
import 'package:provider/provider.dart';

import 'features/product/domain/entities/product_entity.dart';
import 'models/product.dart';



void main() async  {
  var sharedPreference = await SharedPreferences.getInstance();

  var localData = ProductLocalDataSourceImpl(sharedPreferences: sharedPreference);

  // var remoteData = await ProductRemoteDataSourceImpl();

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
    imagePath: File('bcdd/pda'),);


    var ab = await localData.addProduct(product);
    var acr_1 = await localData.updateProduct(product_1);
    print(acr_1);
    // var a = await localData.addProduct(product_1);
    // var acr = await localData.deleteProduct("66b0b23928f63adda72ab38a1");
    // var ac = await localData.getProducts();
    // print(ac);
    // var acr1 = await localData.getProduct("66b0b23928f63adda72ab38a");
    // print(acr1);
    // Check Update mETHOD TOO unCHECKED
    // var acr_1 = await localData.updateProduct(product);



  runApp(
    const Main(),
    );
}


class Main extends StatelessWidget {
  
const Main({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
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
          '/home' : (context) => homePage(),
          '/add': (context) => AddUpdate(),
          '/search' : (context) => searchPage(),
          '/update' : (context) => UpdatePage(),
        },
      home: homePage(),
      
    );
  }
}