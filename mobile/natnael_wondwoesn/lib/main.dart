import 'package:flutter/material.dart';
import 'package:flutter_application_5/pages/add_update.dart';
import 'package:flutter_application_5/pages/details.dart';
import 'package:flutter_application_5/pages/home.dart';
import 'package:flutter_application_5/pages/search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Main());
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
          '/details': (context) => DetailsPage(),
          '/addUpdate': (context) => AddUpdate(),
          '/search' : (context) => searchPage(),
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