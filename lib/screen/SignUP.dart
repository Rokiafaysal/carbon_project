import 'package:carbon/Components/appColor.dart';
import 'package:carbon/Components/defaultButton.dart';
import 'package:carbon/Components/defaultTextField.dart';
import 'package:carbon/screen/ConfirmationScreen.dart';
import 'package:carbon/screen/loginScreen.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double mywidth = MediaQuery.of(context).size.width;
    double myheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: myheight * 0.14,
              left: mywidth * 0.04,
              right: mywidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create Account ',
                style: TextStyle(
                    color: AppColors.primaryDark,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(top: myheight * (70 / 853)),
                child: Form(
                  key: _formKey, // Attach the form key
                  child: Column(
                    children: [
                      DefaultTextField(
                        hintText: 'Enter your first name',
                        label: "First Name",
                        icon: Icons.person,
                        textController: firstnameController,
                        type: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'First name is required';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: myheight * (12 / 853)),
                        child: DefaultTextField(
                          hintText: 'Enter your last name',
                          label: "Last Name",
                          icon: Icons.person,
                          textController: lastnameController,
                          type: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Last name is required';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: myheight * (12 / 853)),
                        child: DefaultTextField(
                          hintText: 'Enter your email',
                          label: "Email",
                          icon: Icons.email,
                          textController: emailController,
                          type: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            }
                            // Basic email validation
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return 'Enter a valid email address';
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
                          textController: passwordController,
                          type: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: myheight * (70 / 853)),
                child: DefaultButton(
                  colored: true,
                  onClick: () {
                    if (_formKey.currentState!.validate()) {
                      // Navigate if validation passes
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Confirmationscreen(),
                        ),
                      );
                    }
                  },
                  text: 'Register',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: myheight * (12 / 853)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have account? ',
                      style: TextStyle(
                          color: Color(0xff4E5856), fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Loginscreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
