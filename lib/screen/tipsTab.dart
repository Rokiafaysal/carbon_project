import 'package:carbon/Components/defaultButton.dart';
import 'package:carbon/screen/chatScreen.dart';
import 'package:flutter/material.dart';

class Tipstab extends StatelessWidget {
  const Tipstab({super.key});

  @override
  Widget build(BuildContext context) {
    var mywidth = MediaQuery.of(context).size.width;
    var myheight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: myheight * (305 / 853),
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Stack(
              children: [
                // Background container
                Container(
                  height: myheight * (270 / 853),
                  width: mywidth,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.topLeft,
                      stops: [0.24, 1.0],
                      colors: [
                        Color(0xff1C8876),
                        Color.fromARGB(255, 0, 88, 69),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: myheight * (70 / 853),
                      left: mywidth * 0.04,
                      right: mywidth * 0.04,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' Tips for usage of carbon',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: mywidth * (17 / 393),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: mywidth * 0.3),
                          child: SizedBox(
                            width: mywidth * (24 / 393),
                            height: myheight * (24 / 853),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>  ChatScreen(),));
                              },
                              child: Image.asset('assets/chat.png')),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: myheight * (140 / 853),
                  left: mywidth * 0.08,
                  child: Container(
                    width: mywidth * (336 / 393),
                    height: myheight * (150 / 853),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff6154AA).withOpacity(0.04),
                          blurRadius: 10.02,
                          offset: const Offset(0, 12.52),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: mywidth * (336 / 393),
                          height: myheight * (130 / 853),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/tipbg.png',
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: mywidth * (22 / 393),
                            top: myheight * (22 / 853),
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'Be careful !\n',
                                          style: TextStyle(
                                            color: const Color(0xffCD3422),
                                            fontSize: mywidth * (22 / 393),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '7 million deaths\nannually are linked to air\npollution from carbon ',
                                          style: TextStyle(
                                            color: const Color(0xff383939),
                                            fontSize: mywidth * (18 / 393),
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                              Image.asset('assets/fire.png'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: myheight * 0.00, left: mywidth * 0.06, right: mywidth * 0.04),
            child: Text(
              'Tips',
              style: TextStyle(
                fontSize: mywidth * (22 / 393),
                fontWeight: FontWeight.bold,
                color: const Color(0xff141414),
              ),
            ),
          ),

          SizedBox(
            height: myheight * 0.5, // Adjust height as needed
            child: ListView.builder(
              itemCount: 6,
              padding: const EdgeInsets.all(20.0),
              itemBuilder: (context, index) => Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Container(
                  height: myheight*(190/853),
                    width: mywidth * (340 / 393),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: const Color(0xffE4E7EC)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/tips.png'),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Connect with doctors &\nget suggestions',
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: myheight * 0.01),
                                child: const Text(
                                  'Connect now and\nget expert insights',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: myheight * 0.02),
                                child: DefaultButton(
                                  colored: true,
                                  onClick: () {
                                    
                                  },
                                  text: 'View details',
                                  width: mywidth * (104 / 393),
                                  height: myheight * (36 / 853),
                                  fontsize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
