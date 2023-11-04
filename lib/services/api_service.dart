import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl;

  ApiService(this.apiUrl);

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Mengonversi respons dari JSON ke List<dynamic>
      List<dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Gagal memuat data');
    }
  }
}
