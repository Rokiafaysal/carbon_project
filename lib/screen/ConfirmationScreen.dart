import 'package:carbon/Components/defaultButton.dart';
import 'package:carbon/screen/homePage.dart';
import 'package:flutter/material.dart';

class Confirmationscreen extends StatefulWidget {
  const Confirmationscreen({super.key});

  @override
  State<Confirmationscreen> createState() => _ConfirmationscreenState();
}

class _ConfirmationscreenState extends State<Confirmationscreen> {
  @override
  Widget build(BuildContext context) {
    
      var mywidth = MediaQuery.of(context).size.width;
      var myheight= MediaQuery.of(context).size.height;
    return  Scaffold(
      body: Padding(
          padding:  EdgeInsets.only(top:myheight*0.14,left: mywidth*0.04,right: mywidth*0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        
                          Center(child: SizedBox(
                            width: mywidth*(220/393),
                            height: myheight*(190/853),
                            child: Image.asset("assets/coLarge.png"))),

                            Padding(
                              padding:  EdgeInsets.only(top: myheight*(90/853)),
                              child: Text('Thanks for registration ',style: TextStyle(fontSize: mywidth*(22/393) ,fontWeight: FontWeight.bold),),
                            ),
                            
                            Text('continue by using our app   ',style: TextStyle(fontSize: mywidth*(18/393) ,fontWeight: FontWeight.w400, color: const Color(0xff64676C)),),
        
                 Padding(
                              padding:  EdgeInsets.only(top: myheight*(290/853)),
                   child: DefaultButton(colored: true, onClick: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Homepage(), ));
                   }, text: 'Get Start'),
                 )
          ],
        ),
      ),
    );
  }
}