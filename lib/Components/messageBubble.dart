// chat_widgets.dart
import 'package:flutter/material.dart';
import 'package:carbon/Components/appColor.dart';

Widget buildChatBubble(String text, bool isUser) {
  return Align(
    alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      width: 253,
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isUser ? AppColors.primaryColor : AppColors.gray1,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(12),
          topRight: const Radius.circular(12),
          bottomLeft: Radius.circular(isUser ? 12 : 0),
          bottomRight: Radius.circular(isUser ? 0 : 12),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: isUser ? Colors.white : Colors.black87,
        ),
      ),
    ),
  );
}

Widget buildChoicesRow(List<String> choices, String? selectedChoice, Function(String) onChoiceSelected) {
  return Wrap(
    spacing: 12.0,
    runSpacing: 12,
    children: choices.map(
      (choice) {
        bool isSelected = choice == selectedChoice;

        return GestureDetector(
          onTap: () {
            onChoiceSelected(choice); // Send the selected choice
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? Colors.grey[800] : Colors.transparent,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: isSelected ? Colors.grey[800]! : Colors.black26,
              ),
            ),
            child: Text(
              choice,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    ).toList(),
  );
}
