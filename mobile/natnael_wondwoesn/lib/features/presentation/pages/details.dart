// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_5/features/presentation/pages/add_update.dart';
import 'package:flutter_application_5/features/presentation/pages/update.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_5/features/extra/resusetext.dart';
import 'package:flutter_application_5/features/data/models/product.dart';
import 'package:flutter_application_5/features/data/models/ext_product.dart';



class DetailsPage extends StatefulWidget {
  final Product item;
  const DetailsPage({required this.item, super.key});

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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              height: 286,
              width: 430,
              fit: BoxFit.cover,
              image:AssetImage(widget.item.imagePath),),
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
                        children: [Container(margin: EdgeInsets.only(left: 32), child: Text(widget.item.category,style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 170, 170, 170)),)),
                          Container(margin: EdgeInsets.only(top: 16,left: 32),child: Text(widget.item.name,style:GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w600),)),
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
                          
                              Text("(${widget.item.rating})",style:GoogleFonts.sora(fontSize: 16,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 170, 170, 170))),
                            ],
                          ),
                        ),
                        Container(margin: EdgeInsets.only(top: 23,right: 32), child: Text("\$"+widget.item.price.toString(),style: GoogleFonts.sora(fontSize: 16,fontWeight: FontWeight.w500),))
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
                            child: Text(widget.item.description,style: GoogleFonts.poppins(color: Color.fromRGBO(102, 102, 102, 1),fontSize: 14,fontWeight: FontWeight.w500),),
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
                            onPressed: (){Navigator.pushNamed(context, '/home');}, 
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
                            onPressed: (){Navigator.pushNamed(context, '/update',);}, 
                            child: Text("Update",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500),)),
                          ),
                    
                      ],),
                  ) // End of Paragraph
                  
              ],
            )
          ],
                ),
        )
      
    );
  }
}

//End of Details Page