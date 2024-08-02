// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import "package:flutter/material.dart";
import 'package:flutter_application_5/pages/add_update.dart';
import 'package:flutter_application_5/pages/details.dart';
import 'package:google_fonts/google_fonts.dart';
import 'search.dart';
import 'package:image_picker/image_picker.dart';
import '../extra/icon_img.dart';


class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
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
          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> AddUpdate(),),);},
        
          ),
      ),

      // Code actually starts here
      // backgroundColor: Color.fromARGB(255, 250, 250, 250),
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

                        // IconButton(
                        //   onPressed: () {
                        //     ImagePickerExample();
                        //   },
                        //   icon: Icon(Icons.rectangle_rounded,size: 45.0,color: Color.fromARGB(255, 204, 204, 204),)),
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
                        child: IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> searchPage(),),);}, icon: Icon(Icons.search),color: Color.fromARGB(255, 217, 217, 217),iconSize: 29))
                    ],
                ),
            ),
            // Products
          SizedBox(
            height: 11,
          ),
            SingleChildScrollView(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height*0.8,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3, 
                    itemBuilder: (context,idx)=> GestureDetector(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> DetailsPage(),),);},
                      child: shoeCard(),
                    )),
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


// Custom widget
Widget shoeCard(){
  return Card(
    child: Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
                child:Image(
          // height: 300.0,
          image: AssetImage('assets/shoes.jpg'),
        
        ),
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text("Derby Leather Shoes",style:TextStyle(fontFamily: "Poppins", fontSize: 20,fontWeight: FontWeight.w500),),
                    ),
                    Text("Men" +"’" +"s"  + " shoe",style: TextStyle(fontFamily: "Poppins", fontSize: 12,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 170, 170, 170)),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text("\$120",style: GoogleFonts.sora(fontSize: 14,fontWeight: FontWeight.w500),),
                    ),
                    Row(children: [
                      Icon(Icons.star,size: 24 ,color: Color.fromARGB(255, 255, 215, 0),),
                      Text("(4.0)",style:GoogleFonts.sora(fontSize: 12,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 170, 170, 170))),
                      
                    ],)
                  ],
                ),
              )
            ],
        )
      ]
      ,),
  );
}
      
      