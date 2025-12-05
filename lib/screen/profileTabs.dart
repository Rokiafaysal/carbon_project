import 'package:carbon/screen/SignUP.dart';
import 'package:flutter/material.dart';

class Profiletabs extends StatelessWidget {
  const Profiletabs({super.key});

  @override
  Widget build(BuildContext context) {
       var mywidth = MediaQuery.of(context).size.width;
    var myheight = MediaQuery.of(context).size.height;
    return Padding(
        padding:  EdgeInsets.only(top: myheight*0.06),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile.png'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Username',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              'user@gmail.com',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            Padding(
              padding:  EdgeInsets.only(left: mywidth*0.04,right: mywidth*0.04,top: myheight*0.04),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffFEFEFE),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 48,
                      offset: const Offset(0, 4),
                      color: const Color(0xffA7AEC1).withOpacity(0.4)
                    )
                  ]
                ),
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Edit Profile'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                  },
                ),
              ),
            ),
            // الوضع الداكن
            Padding(
              padding:  EdgeInsets.only(left: mywidth*0.04,right: mywidth*0.04,top: myheight*0.02),
              child: Container(
                 decoration: BoxDecoration(
                    color: const Color(0xffFEFEFE),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 80,
                        offset: const Offset(0, 4),
                        color: const Color(0xffA7AEC1).withOpacity(0.4)
                      )
                    ]
                  ),
                child: const ListTile(
                                    leading: Icon(Icons.dark_mode_rounded),

                  title: Text('Dark mode'),
                  // value: isDarkMode,
                  // onChanged: (value) {
                  //   setState(() {
                  //     isDarkMode = value;
                  //   });
                  // },
                ),
              ),
            ),
            // زر تسجيل الخروج
            Padding(
              padding:  EdgeInsets.only(left: mywidth*0.04,right: mywidth*0.04,top: myheight*0.02),
              child: Container(
                 decoration: BoxDecoration(
                      color: const Color(0xffFEFEFE),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 80,
                          offset: const Offset(0, 4),
                          color: const Color(0xffA7AEC1).withOpacity(0.4)
                        )
                      ]
                    ),
                child: ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) => Signup(),));
                  },
                ),
              ),
            ),
          ],
        ),
      );
    
  }
}