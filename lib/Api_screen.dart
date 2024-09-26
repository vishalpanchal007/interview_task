import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:untitled/model_class.dart';

Future<List<Product>>FetchData()async{
  final Response =await http.get(Uri.parse("https://fakestoreapi.com/products"));
  if(Response.statusCode == 200){
    List<dynamic>Jsondata=json.decode(Response.body);
    return Jsondata.map((item)=>Product.fromJson(item)).toList();
  }else{

    throw Exception("Failed to fetch data from API");
  }

}