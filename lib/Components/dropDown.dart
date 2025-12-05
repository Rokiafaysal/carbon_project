import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String? initialValue; // Initial selected value
  final List<String> items; // Dropdown options
  final ValueChanged<String> onChanged; // Callback for value change
  final String text; // Label text
final String  hintText;
  const CustomDropdown({
    super.key,
    required this.initialValue,
    required this.items,
    required this.onChanged,
    required this.text, required this.hintText,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String? selectedValue;

  @override
  void initState() {
    super.initState();
    // Ensure the initial value exists in the list of items
    selectedValue = widget.items.contains(widget.initialValue)
        ? widget.initialValue
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xff393939),
          ),
        ),
        const SizedBox(height: 8), // Add spacing between the label and dropdown
        SizedBox(
          height: 53,
          child: DropdownButtonFormField<String>(
            hint:Text(widget.hintText),
            value: selectedValue,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            items: widget.items.map((String value) {
              return DropdownMenuItem<String>(
                
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
              widget.onChanged(value!);
            },
          ),
        ),
      ],
    );
  }
}
