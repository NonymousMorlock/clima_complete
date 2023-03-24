import 'dart:convert';
import 'package:http/http.dart' as http;


class NetworkHelper {

  NetworkHelper(this.url);
  final String url;

  Future<Map<String, dynamic>> getDecoder() async {
    Uri url = Uri.parse(this.url);
    http.Response response = await http.get(url);
    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

}