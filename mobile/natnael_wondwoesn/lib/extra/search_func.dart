import 'package:flutter/material.dart';

// class SearchFunc extends StatefulWidget {
//   const SearchFunc({ Key? key }) : super(key: key);

//   @override
//   _SearchFuncState createState() => _SearchFuncState();
// }

// class _SearchFuncState extends State<SearchFunc> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }

class SearchFunc extends SearchDelegate{
  List<String> terms=[
    'Derby',
    'Leather Shoes',
    'Shoes',
    'Size,'
    ];
  @override
  List<Widget> buildActions(BuildContext context)  {
    return [
      IconButton(onPressed: (){
        query = '';
      }, icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context)  {
    return 
      IconButton(onPressed: (){
        close(context, null);
      }, icon: Icon(Icons.arrow_back)); 
    
  }

  @override
  Widget buildResults(BuildContext context)  {
    List<String> matchQuery =[];
    for (var items in terms){
      if (items.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(items);

      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context,index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
      );
  }
  @override
  Widget buildSuggestions (BuildContext context) {
    List<String> matchQuery =[];
    for (var items in terms){
      if (items.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(items);

      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context,index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
      );

  }


  

}