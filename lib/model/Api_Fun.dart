import 'dart:convert';
import 'package:carbon/model/carbon_Model.dart';
import 'package:http/http.dart' as http;

class ApiFun {
  static Future<String> sendCarbonEmissionData(CarbonEmissionData data) async {
    final url = Uri.parse('http://192.168.0.25:8000/predict_carbon_emission/');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data.toJson()), // Convert data to JSON
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print('API Response: $responseData'); 
      return responseData['predicted_carbon_emission'].toString();
    } else {
      print('Failed to fetch data. Status Code: ${response.statusCode}');
      return 'No prediction available';
    }
  }
}
