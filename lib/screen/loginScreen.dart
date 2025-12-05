import 'package:carbon/Components/appColor.dart';
import 'package:carbon/Components/defaultButton.dart';
import 'package:carbon/Components/defaultTextField.dart';
import 'package:carbon/screen/SignUP.dart';
import 'package:carbon/screen/homePage.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _formKey = GlobalKey<FormState>(); // Key for the Form widget
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double mywidth = MediaQuery.of(context).size.width;
    double myheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: myheight * 0.18,
              left: mywidth * 0.04,
              right: mywidth * 0.04),
          child: Form( // Wrap the Column with a Form widget
            key: _formKey, // Assign the key to the form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Welcome Back',
                    style: TextStyle(
                        color: AppColors.primaryDark,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.only(top: myheight * (96 / 853)),
                  child: DefaultTextField(
                    hintText: 'Enter your email',
                    label: "Email",
                    icon: Icons.email,
                    textController: emailController,
                    type: TextInputType.emailAddress,
                    // Add validation for the email field
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // Simple email regex validation
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: myheight * (12 / 853)),
                  child: DefaultTextField(
                    hintText: 'Enter your password',
                    label: "Password",
                    icon: Icons.lock,
                    isPasswordField: true,
                    type: TextInputType.visiblePassword,
                    textController: passwordController,
                    // Add validation for the password field
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: myheight * (70 / 853)),
                  child: DefaultButton(
                      colored: true,
                      onClick: () {
                        // Validate the form before navigating
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Homepage(),
                            ),
                          );
                        }
                      },
                      text: 'Login'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: myheight * (12 / 853)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have account? ',
                        style: TextStyle(color: Color(0xff4E5856), fontSize: 14),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Signup(),
                                ));
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
