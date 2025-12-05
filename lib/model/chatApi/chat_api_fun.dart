import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Map<String, dynamic>> startChat() async {
    final response = await http.get(Uri.parse('http://192.168.0.25:8002/start_chat'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load question');
    }
  }

  Future<Map<String, dynamic>> sendAnswer(int questionId, String userAnswer) async {
    final response = await http.post(
      Uri.parse('http://192.168.0.25:8002/next_question'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'question_id': questionId,
        'answer': userAnswer,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load next question');
    }
  }
}
