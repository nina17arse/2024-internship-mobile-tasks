import "package:flutter/material.dart";
import 'package:flutter_application_5/extra/overflow_card.dart';
import '../extra/search_func.dart';
import './home.dart';
import '../extra/resusetext.dart';
import '../extra/search_func.dart';
import 'package:flutter_application_5/pages/details.dart';
// import 'home.dart';

class searchPage extends StatefulWidget {
  const searchPage({super.key});

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () { Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new,color: Color.fromARGB(255, 63, 81, 243),size: 20,)),
              const Center(
                child: Text("Search  Product"),
              ),
              const SizedBox(
                height: 60,
                width: 60,
              )
            ],
          ),
        ),


        // Body Starts Here
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 32),
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){SearchFunc();},
                      child: SizedBox(
                        width: 300,
                        height: 48,
                        child: TextField(
                          
                          decoration: InputDecoration(
                            
                            hintText: "Leather",
                          ), 
                        ),
                      ) 
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(63, 81, 243, 1),
                        
                      ),
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        
                          child: Container(
                            decoration: BoxDecoration(
                              // border: Border.all(width: 2,color: Color.fromRGBO(63, 81, 243, 1)),
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: IconButton(onPressed: (){}, icon: Icon(Icons.filter_list,color: Colors.white,))),
                        ),
                    ),
                    
                
                  ],),
                  SizedBox(height: 36, ),
                  Container(
                    margin: EdgeInsets.only(right: 32),
                    child: SizedBox(
                    height: 300,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 2, 
                      itemBuilder: (context,idx)=> GestureDetector(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> DetailsPage(),),);},
                        child: shoeCard(),
                      )),
                                  ),
                  ),
          
                  Column(
                    children: [
                      SizedBox(
                        height: 300,
                        child: const about_product())
                              ])
                    
              ],
            ),
          ),
        ) ,
    );
  }
}