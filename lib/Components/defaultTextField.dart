import 'package:carbon/Components/appColor.dart';
import 'package:flutter/material.dart';

class DefaultTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final IconData icon;
  final bool isPasswordField;
  final TextEditingController textController;
  final TextInputType type;
  final String? Function(String?)? validator; // Add a validator callback

  const DefaultTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.icon,
    this.isPasswordField = false,
    required this.textController,
    required this.type,
    this.validator, // Initialize it as optional
  });

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    var mywidth = MediaQuery.of(context).size.width;
    var myheight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: myheight * (4 / 853)),
          child: Text(
            widget.label,
            style: TextStyle(
              color: AppColors.gray7.withOpacity(0.8),
              fontSize: mywidth * (11 / 393),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        TextFormField( // Use TextFormField for validation support
          controller: widget.textController,
          keyboardType: widget.type,
          obscureText: widget.isPasswordField && !_isPasswordVisible,
          decoration: InputDecoration(
            hintText: widget.hintText,
            contentPadding: EdgeInsets.only(top: myheight * (20 / 853)),
            hintStyle: TextStyle(
              fontSize: mywidth * (14 / 393),
              color: AppColors.gray7,
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: Icon(
              widget.icon,
              color: AppColors.gray7,
            ),
            suffixIcon: widget.isPasswordField
                ? IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.gray7,
                    ),
                    onPressed: _togglePasswordVisibility,
                  )
                : null,
            filled: true,
            fillColor: AppColors.gray1,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
          ),
          validator: widget.validator, // Pass the validator to the TextFormField
        ),
      ],
    );
  }
}
