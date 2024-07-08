import 'package:http/http.dart' as http;
import 'dart:convert';

class AgeEstimatorApi {
  final String baseUrl = 'https://api.agify.io';

  Future<int?> getAgeEstimate(String name) async {
    try {
      var response = await http.get(Uri.parse('$baseUrl?name=$name'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data['age'] as int?;
      }
      return null;
    } catch (e) {
      print('Error fetching age: $e');
      return null;
    }
  }
}
