// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_5/pages/add_update.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:expandable_text/expandable_text.dart';
import '../extra/resusetext.dart';



class DetailsPage extends StatefulWidget {
  const DetailsPage({ Key? key }) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<DetailsPage> {
    var list = List<int>.generate(7, (i) => i + 1 + 38);
    int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: Container(
        margin: EdgeInsets.only(left: 20,top: 20),
        height: 40,
        width: 40 ,
        child: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: Colors.white,
          child: Center(child: Icon(Icons.arrow_back_ios_new,color: Color.fromARGB(255, 63, 81, 243),size: 20,)),
          onPressed: () { Navigator.pop(context);}),
      ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(image: AssetImage('assets/shoes.jpg')),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.,
                children: [

                  Container(
                    margin: EdgeInsets.only(top: 21),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Container(margin: EdgeInsets.only(left: 32), child: Text("Men" +"’" +"s"  + " shoe",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 170, 170, 170)),)),
                        Container(margin: EdgeInsets.only(top: 16,left: 32),child: Text("Derby Leather",style:GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w600),)),
                      ],
                    ),
                  ),

                  Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 32),
                        child: Row(
                          children: [
                            Icon(Icons.star,size: 26 ,color: Color.fromARGB(255, 255, 215, 0),),
                        
                            Text("(4.0)",style:GoogleFonts.sora(fontSize: 16,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 170, 170, 170))),
                          ],
                        ),
                      ),
                      Container(margin: EdgeInsets.only(top: 23,right: 32), child: Text("\$120",style: GoogleFonts.sora(fontSize: 16,fontWeight: FontWeight.w500),))
                    ],
                  ),

                  
                ],
              ),
              SizedBox( 
                    height: 10,
                  ),
              Container(margin: EdgeInsets.only(right: 298,left: 10), child: Text("Sizes:",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),),
                  // SIZES PART
                  Container(
                    margin: EdgeInsets.only(left: 32),
                    child: Row(
                      children: [
                       SizedBox(
                        height: 60,
                       width: 378 ,
                      child: ListView.builder(
                          itemCount: 7,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = index;
                            });
                          },
                          child: Card(
                            color: selected == index
                                ? const Color(0xff3F51F3)
                                : Colors.white,
                            child: SizedBox(
                                height: 60,
                                width: 60,
                                child: Center(
                                    child: reusableText(
                                        "${list[index]}",
                                        FontWeight.w500,
                                        17,
                                        selected == index
                                            ? Colors.white
                                            : Colors.black))),
                          ),
                        );
                      },
                    ),
                                    ),
                    
                      ],
                    ),
                  ),// END OF SIZES Part 
                    
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 32,right: 32,top: 15,bottom: 5),
                        child: Center(
                          child: reusableTextpar("A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe."
                                              ,FontWeight.w500,14),
                        ),
                      )
                    )

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32,right: 32,top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 152,
                        height: 50,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            side: BorderSide(color: Colors.red),
                            overlayColor: Colors.red,
                            foregroundColor: Colors.red,
                          ),
                          onPressed: (){}, 
                          child: Text("Delete",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500))),
                      ),
                        SizedBox(
                          width: 152,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              side: BorderSide(color: Color(0xff3F51F3)),
                              // overlayColor: Colors.red,
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0xff3F51F3),
                            ),
                          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> AddUpdate(),),);}, 
                          child: Text("Update",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500),)),
                        ),
                  
                    ],),
                ) // End of Paragraph
                
            ],
          )
        ],
      )
      
    );
  }
}




