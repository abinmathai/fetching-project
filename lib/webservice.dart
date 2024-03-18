  
import 'package:flutter_fetching_product/model.dart';
import 'package:http/http.dart' as http;


  import 'dart:convert';




Future<List<Album>> fetchAlbums() async{
 
 final response= await http.get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
 if(response.statusCode == 200){
  List<dynamic> data = jsonDecode(response.body);
   List<Album> albums =
        data.map((albumJson) => Album.fromjason(albumJson)).toList();
    return albums;
 }
 else{
  throw Exception('failed to load albums');

 }

}