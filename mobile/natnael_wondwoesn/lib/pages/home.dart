// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_5/pages/add_update.dart';
import 'package:flutter_application_5/pages/details.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_5/extra/icon_img.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_application_5/models/product.dart';
import 'package:flutter_application_5/extra/overflow_card.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_5/pages/search.dart';
import 'package:flutter_application_5/extra/resusetext.dart';
import 'package:flutter_application_5/models/ext_product.dart';



class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final prd = ProductModel();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 72,
        height: 72,
        child: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: Color.fromARGB(255, 63, 81, 243),
          child: Icon(Icons.add_rounded,color: Colors.white,size: 55),
          // Named ROute Implementation
          onPressed: (){Navigator.pushNamed(context, '/add');
},
          ),
      ),


      body: SafeArea(
        // ignore: prefer_const_constructors
        child: Padding(
          padding: const EdgeInsets.only(left: 21.0,right: 21.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        child: SizedBox(
                          
                          width: 80,
                          height: 80,
                          child: ImagePickerIconButton()),
                      ),

                        Container(
                            padding: EdgeInsets.only(top: 4,left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("July 31, 2024",style: GoogleFonts.syne(fontWeight: FontWeight.w500,color: Color.fromARGB(255, 170, 170, 170)),),
                                Row(
                                  children: [
                                    Text("Hello,", style: GoogleFonts.sora(fontWeight: FontWeight.w400,color: Color.fromARGB(255, 102, 102, 102))),
                                    Text("Natnael", style: GoogleFonts.sora(fontWeight: FontWeight.w600)),])]),),
                            
                                

                  ],),


                Container(decoration: BoxDecoration(
                          border: Border.all(color: Color.fromRGBO(221, 221, 221, 1),width: 2),
                          borderRadius: BorderRadius.circular(9)
                        ),child: Image(
                          width: 40,
                          height: 40,
                          image: AssetImage('assets/icons8-notification-bell-24.png')))],
              ),

            Container(
              height: MediaQuery.of(context).size.height*0.052,
               child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Available Products", style: TextStyle(fontFamily: "Poppins", fontSize: 24,fontWeight: FontWeight.w600),),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey,width: 1),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.only(right: 2),
                        child: IconButton(onPressed:  (){Navigator.push(context, PageTransition(
                    alignment: Alignment.bottomCenter,
                        curve: Curves.easeInOut,
                        duration: Duration(milliseconds: 1200),
                        reverseDuration: Duration(milliseconds: 400),
                        type: PageTransitionType.leftToRightPop,
                        child: searchPage(), 
                        childCurrent: homePage()),);}, icon: Icon(Icons.search),color: Color.fromARGB(255, 217, 217, 217),iconSize: 29))
                    ],
                ),
            ),
            // Products
          SizedBox(
            height: 11,
          ),

          
            Consumer<ProductModel>(
              builder: (context, prd, child) => Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height*0.8,
                      child: ListView.builder(
                       itemCount: ProductModel.prd_list.length,
                      itemBuilder: (context, index) {
                        return ItemCard(item: ProductModel.prd_list[index],);
                      },),
                    ),
                ),
              ),
              ),
            ),
             
            //  Button Blue
            
                // onPressed: onPressed)
            ],
          ),
        )
      ),
    );
  }
}

// end of home page