import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  @override
  void initState() {
        super.initState();
        Future.delayed(
          Duration(seconds: 10),
          () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        );
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(63, 81, 243, 1),
      body:SafeArea(
        child: Column(
          children: [
            Container(
                          width: 170,
                          height: 70,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Color.fromRGBO(63, 81, 243, 1)),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'ECOM',
                            style: GoogleFonts.caveatBrush(
                                fontSize: 48,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(63, 81, 243, 1)),
                          ),
                        ),
              Text(
                'Welcome to ECOM',
                style: GoogleFonts.caveatBrush(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      )
    );
  }
}