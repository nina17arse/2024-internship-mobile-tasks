
import 'package:flutter/material.dart';

import 'package:flutter_application_5/features/presentation//pages/add_update.dart';
import 'package:flutter_application_5/features/presentation//pages/details.dart';
import 'package:flutter_application_5/features/presentation//pages/home.dart';
import 'package:flutter_application_5/features/presentation//pages/search.dart';
import 'package:flutter_application_5/features/presentation/pages/update.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import './features/data/models/product.dart';
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
      routes: {
          '/home' : (context) => homePage(),
          '/detail': (context) => DetailsPage(item: ProductModel.prd_list[2],),
          '/add': (context) => AddUpdate(),
          '/search' : (context) => searchPage(),
          '/update' : (context) => UpdatePage(),
        },
      home: homePage(),
      onGenerateRoute: (settings) {
    switch (settings.name) {
      case '/addUpdate':
        return PageTransition(child: AddUpdate(), type: PageTransitionType.bottomToTopJoined);
            break;
      default:
        return null;
    }
  },
    );
  }
}