// ignore_for_file: file_names

import 'package:carbon/Components/defaultButton.dart';
import 'package:carbon/screen/SignUP.dart';
import 'package:carbon/screen/loginScreen.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
      var mywidth = MediaQuery.of(context).size.width;
      var myheight= MediaQuery.of(context).size.height;

    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top:myheight*0.15,left: mywidth*0.04,right: mywidth*0.04),
          child: Column(
            children: [
          
          
              Image.asset("assets/coLarge.png"),
          
              Padding(
                padding:  EdgeInsets.only(top: myheight*0.35),
                child: DefaultButton(colored: true, onClick:() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Signup(),));

                }, text: 'Register')
              ),
        
              Padding(
                padding:  EdgeInsets.only(top: myheight*0.02),
                child: DefaultButton(colored: false,
                color: const Color(0xff0D7C66),
                 onClick: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Loginscreen(),));

                }, text: "Login",fontsize: 16,)
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}