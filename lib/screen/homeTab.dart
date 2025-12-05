import 'package:carbon/Components/appColor.dart';
import 'package:carbon/Components/card.dart';
import 'package:carbon/Components/defaultButton.dart';
import 'package:carbon/screen/calculateCarbon.dart';
import 'package:carbon/screen/chatScreen.dart';
import 'package:flutter/material.dart';

class Hometab extends StatelessWidget {
  const Hometab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {'image': 'assets/person.png', 'text': 'Person'},
      {'image': 'assets/all.png', 'text': 'All categories'},

      {'image': 'assets/waste.png', 'text': 'Waste'},
      {'image': 'assets/Energy.png', 'text': 'Energy'},
      {'image': 'assets/Consumption.png', 'text': 'Consumption'},
      {'image': 'assets/travel.png', 'text': 'Travel'},

      // Add more items here
    ];
    var mywidth = MediaQuery.of(context).size.width;
    var myheight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: myheight * (290 / 853),
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Stack(
                children: [
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
                          CircleAvatar(
                            backgroundColor: AppColors.gray1,
                            radius: mywidth * (40 / 853),
                            child: Image.asset('assets/user.png'),
                          ),
                          Text(
                            ' Hi, User name',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: mywidth * (17 / 393),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: mywidth * 0.44),
                            child: SizedBox(
                              width: mywidth * (24 / 393),
                              height: myheight * (24 / 853),
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ChatScreen(),
                                        ));
                                  },
                                  child: Image.asset('assets/chat.png')),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Positioned container to show on top of the background container
                  Positioned(
                    top: myheight * (130 / 853),
                    left: mywidth * 0.08,
                    child: Container(
                      width: mywidth * (336 / 393),
                      height: myheight * (160 / 853),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 195, 194, 196).withOpacity(0.1),
                            blurRadius: 10.02,
                            offset: const Offset(0, 12.52),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: mywidth * (336 / 393),
                            height: myheight * (160 / 853),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/bg.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: mywidth * (22 / 393),
                                top: myheight * (16 / 853)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'carbon\n',
                                        style: TextStyle(
                                            color: const Color(0xff171717),
                                            fontSize: mywidth * (18 / 393)),
                                      ),
                                      TextSpan(
                                        text: 'consumption for\n',
                                        style: TextStyle(
                                            color: const Color(0xff171717),
                                            fontSize: mywidth * (18 / 393)),
                                      ),
                                      TextSpan(
                                        text: 'this month is ',
                                        style: TextStyle(
                                            color: const Color(0xff171717),
                                            fontSize: mywidth * (18 / 393)),
                                      ),
                                      TextSpan(
                                        text: '282 ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.dark2,
                                            fontSize: mywidth * (22 / 393)),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: myheight * 0.02),
                                  child: DefaultButton(
                                    colored: true,
                                    onClick: () {},
                                    text: 'Sea details',
                                    width: mywidth * (85 / 393),
                                    height: myheight * (36 / 853),
                                    fontsize: 12,
                                  ),
                                )
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
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              top: myheight * 0.05,
              left: mywidth * 0.04,
              right: mywidth * 0.04),
          child: Text(
            'Choose category to calculate your carbon footprint',
            style: TextStyle(
              fontSize: mywidth * (18 / 393),
              fontWeight: FontWeight.bold,
              color: const Color(0xff3F3E3F),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: mywidth * 0.06, vertical: 0.006),
          child: SingleChildScrollView(
            child: GridView.builder(
              padding: EdgeInsets.only(top: myheight * (16 / 853),bottom: 16),
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: myheight * (1.43 / 853),
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return CardCbon(
                    text: items[index]['text']!,
                    image: items[index]['image']!,
                    onClick: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Calculatecarbon(
                              category: items[index]['text']!,
                            ),
                          ));
                    });
              },
            ),
          ),
        ),
      ],
    );
  }
}

