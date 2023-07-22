import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
class SpecificAnimeQuotesApi{

  Future<Map<String, dynamic>?> specificQuotesCall(String type, String parameter) async{
    try {
      var url;
      var client = http.Client();
      if(type == 'character'){
         url = Uri.parse('https://animechan.xyz/api/random/character?name=$parameter');
      }else{
         url = Uri.parse('https://animechan.xyz/api/random/anime?title=$parameter');
      }
      var response = await client.get(url);
      Map<String, dynamic> result = jsonDecode(response.body);
      return result;
    } catch (e) {
      print(e);
    }
  }
}