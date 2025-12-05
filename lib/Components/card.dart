import 'package:flutter/material.dart';

class CardCbon extends StatelessWidget {
  final  String text;
  final String  image;
  final VoidCallback onClick;
  const CardCbon({super.key, required this.text, required this.image, required this.onClick,});

  @override
  Widget build(BuildContext context) {
    
     var mywidth = MediaQuery.of(context).size.width;
    var myheight = MediaQuery.of(context).size.height;
    return  GestureDetector(
      onTap: onClick,
      child: Container(
                    width: mywidth * (164 / 393),
                    height: myheight * (108 / 853),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 2),
                          blurRadius: 48,
                          color: Colors.black.withOpacity(0.0595),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(image), 
                        Padding(
                          padding:  EdgeInsets.only(top: myheight*0.01),
                          child: Text(text,style: TextStyle(fontSize: mywidth*(14/393)),),
                        ), // Dynamically load the text
                      ],
                    ),
                  ),
    );}
}