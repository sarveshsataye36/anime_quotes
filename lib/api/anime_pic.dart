import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
class RandomAnimePicApi{

  Future<Map<String, dynamic>?> randomAnimePicCall() async{
    try {
      var client = http.Client();
      var url = Uri.parse('https://api.waifu.pics/sfw/waifu');
      var response = await client.get(url);
      Map<String, dynamic> result = jsonDecode(response.body);
      return result;
    } catch (e) {
      print(e);
    }
  }

}