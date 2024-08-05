
import 'package:flutter/material.dart';

import 'package:flutter_application_5/pages/add_update.dart';
import 'package:flutter_application_5/pages/details.dart';
import 'package:flutter_application_5/pages/home.dart';
import 'package:flutter_application_5/pages/search.dart';
import 'package:flutter_application_5/pages/update.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'models/product.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductModel(),
      child: const Main(),
    ),
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