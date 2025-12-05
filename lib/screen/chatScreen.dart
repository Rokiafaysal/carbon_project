import 'dart:convert';
import 'package:carbon/Components/appColor.dart';
import 'package:carbon/Components/defaultButton.dart';
import 'package:carbon/Components/messageBubble.dart';
import 'package:carbon/model/chatApi/chat_api_fun.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String question = '';
  int questionId = 0;
  List<String> choices = [];
  bool isLoading = false;
  bool isFreeText = false;
  String? selectedChoice; 
  final TextEditingController _inputController = TextEditingController();
  String? finalMessage;
  String? predictedEmission;
  List<String> tips = [];

  List<Map<String, String>> messages = [];

  final ApiService _apiService = ApiService();

  Future<void> fetchQuestion() async {
    setState(() {
      isLoading = true;
      finalMessage = null;
      predictedEmission = null;
      tips.clear();
    });

    try {
      final data = await _apiService.startChat();
      setState(() {
        questionId = data['question_id'];
        question = data['question'];
        choices = List<String>.from(data['choices'] ?? []);
        isFreeText = choices.isEmpty;

        messages.add({'text': question, 'isUser': 'false'});
      });
    } catch (error) {
      setState(() {
        question = 'Error fetching question';
        choices = [];
        isFreeText = false;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

 Future<void> sendAnswer(String userAnswer) async {
  if (isFreeText && double.tryParse(userAnswer) == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Invalid input. Please enter a valid number.')),
    );
    return;
  }

  // Add user input to messages
  setState(() {
    messages.add({'text': userAnswer, 'isUser': 'true'});
    isLoading = true;
  });

  try {
    final data = await _apiService.sendAnswer(questionId, userAnswer);

    // Handle the response
    if (data.containsKey('message') && data['message'] != null) {
      setState(() {
        // Add the API message (carbon footprint information) to the chat
        finalMessage = data['message'];
        messages.add({'text': finalMessage!, 'isUser': 'false'});
      });
    }

    if (data.containsKey('question_id') && data['question_id'] != null) {
      setState(() {
        questionId = data['question_id'];
        question = data['question'];
        choices = List<String>.from(data['choices'] ?? []);
        isFreeText = choices.isEmpty;

        // Add the next question to the messages
        messages.add({'text': question, 'isUser': 'false'});
      });
    }

    if (data.containsKey('Predicted Carbon Emission')) {
      setState(() {
        predictedEmission = data['Predicted Carbon Emission'];
        if (predictedEmission != null) {
          messages.add({'text': 'Predicted Carbon Emission: $predictedEmission', 'isUser': 'false'});
        }
      });
    }

    if (data.containsKey('tips')) {
      setState(() {
        tips = List<String>.from(data['tips'] ?? []);
        if (tips.isNotEmpty) {
          tips.forEach((tip) {
            messages.add({'text': 'Tip: $tip', 'isUser': 'false'});
          });
        }
      });
    }
  } catch (error) {
    setState(() {
      question = 'Error fetching next question';
      choices = [];
      isFreeText = false;
    });
  } finally {
    setState(() {
      isLoading = false;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: const Text('Chatbot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: question.isEmpty && !isLoading && finalMessage == null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome to Chatbot',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 54, 54, 54),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
                        child: DefaultButton(
                          colored: true,
                          text: 'Start Chat',
                          onClick: fetchQuestion,
                        ),
                      ),
                    ],
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      final isUser = message['isUser'] == 'true';
                      return buildChatBubble(message['text']!, isUser);
                    },
                  ),
          ),
          if (isLoading) const Center(child: CircularProgressIndicator()),
          if (!isLoading && question.isNotEmpty) ...[
            if (isFreeText)
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      const BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _inputController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                            hintText: 'Type your answer here...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send, color: AppColors.primaryColor),
                        onPressed: () {
                          final userInput = _inputController.text.trim();
                          if (userInput.isNotEmpty) {
                            _inputController.clear();
                            sendAnswer(userInput);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            if (!isFreeText)
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(78, 244, 244, 244),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                    child: buildChoicesRow(choices, selectedChoice, (choice) {
                      setState(() {
                        selectedChoice = choice;
                      });
                      sendAnswer(choice);
                    }),
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }
}
