import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiUrl = 'http://localhost:5000/api';

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('$apiUrl/data'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> sendData(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$apiUrl/data'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to send data');
    }
  }
}