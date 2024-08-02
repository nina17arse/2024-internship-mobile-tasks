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
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color.fromRGBO(217, 217, 217, 1)),
                            borderRadius: BorderRadius.all(Radius.circular(8))
                            ),
                          child: const Expanded(
              
                            child: TextField(
                      
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.arrow_forward),
                                border: InputBorder.none,
                                hintText: "  Leather",
                                
                              ), 
                            ),
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
                        height: 48,
                        width: 48,
                        
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 4,color: Color.fromRGBO(63, 81, 243, 1)),
                              borderRadius: BorderRadius.all(Radius.circular(8))
                            ),
                            child: IconButton(
                              onPressed: (){
                                showModalBottomSheet
                                (context: context, 
                                builder: (BuildContext context){
                                  return const SizedBox(
                                      height: 338,
                                      child: const about_product());
                                            
                                });
                              }, 
                              icon: Icon(Icons.filter_list,color: Colors.white,))),
                        ),
                    ),
                    
                
                  ],),
                  SizedBox(height:31),
                  Container(
                    margin: EdgeInsets.only(right: 32),
                    child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4, 
                      itemBuilder: (context,idx)=> GestureDetector(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> DetailsPage(),),);},
                        child: shoeCard(),
                      )),
                                  ),
                  ),
                    
              ],
            ),
          ),
        ) ,
    );
  }
}