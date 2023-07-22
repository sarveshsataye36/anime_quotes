import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
class RandomAnimeQuotesApi{

  Future<Map<String, dynamic>?> randomQuotesCall() async{
    try {
      var client = http.Client();
      var url = Uri.parse('https://animechan.xyz/api/random');
      var response = await client.get(url);
      Map<String, dynamic> result = jsonDecode(response.body);
      return result;
    } catch (e) {
      print(e);
    }
  }

}