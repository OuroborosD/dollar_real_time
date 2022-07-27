import 'package:http/http.dart' as http;
import 'dart:convert';



Uri request = Uri.parse("https://api.hgbrasil.com/finance?key=3c137a9a");// tem que converter para Uri a String

Future<Map> getfinance() async{
    http.Response respose = await http.get(request);
    Map<String,dynamic> body = json.decode(respose.body);
    //print(body['results']['currencies']["USD"]);
    return body['results']['currencies'];
  }