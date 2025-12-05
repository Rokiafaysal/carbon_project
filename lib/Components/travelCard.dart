import 'package:carbon/Components/appColor.dart';
import 'package:carbon/Components/defaultButton.dart';
import 'package:carbon/Components/dropDown.dart';
import 'package:carbon/Components/progressBar.dart';
import 'package:flutter/material.dart';

class Travelcard extends StatefulWidget {
  final bool showButton;
  final VoidCallback onClick;
  final String? text;
  final TextEditingController transportation;
  final TextEditingController monthlyDistance;
  final TextEditingController flyingFrequency;
  final TextEditingController vehicle;

  const Travelcard({
    super.key,
    this.showButton = true,
    required this.onClick,
    this.text,
    required this.transportation,
    required this.monthlyDistance,
    required this.flyingFrequency,
    required this.vehicle,
  });

  @override
  State<Travelcard> createState() => _TravelcardState();
}

double prog = 1.0;

class _TravelcardState extends State<Travelcard> {
  @override
  void initState() {
    super.initState();
    prog = 0;
  }

  @override
  Widget build(BuildContext context) {
    double mywidth = MediaQuery.of(context).size.width;
    double myheight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
        left: mywidth * 0.01, // Responsive horizontal padding
                right: mywidth * 0.01, // Responsive horizontal padding

        top: myheight * 0.02, // Responsive vertical padding
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Your Travel usage",
            style: TextStyle(
              fontSize: 20,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Tell us what you aim to achieve with Bookly.",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff6A6F73),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffF3F3F3),
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: mywidth * 0.04,
              vertical: myheight * 0.02,
            ),
            child: Column(
         //     //: //.start,
              children: [
                // Transportation Type Dropdown
                Padding(
                  padding: EdgeInsets.only(bottom: myheight * 0.02),
                  child: CustomDropdown(
                    hintText: 'Public',
                    initialValue: widget.transportation.text,
                    items: const [
                      'Public',
                      'Private',
                      'Walk and bicycle',
                    ],
                    onChanged: (value) {
                      print("Selected : $value");
                    },
                    text: 'Transportation',
                  ),
                ),

                // Monthly Distance Traveled Progress Bar
                Padding(
                  padding: EdgeInsets.only(bottom: myheight * 0.03),
                  child: Column(
                    //: //.start,
                    children: [
                      const Text(
                        'What is the monthly distance traveled by the vehicle in kilometers?',
                        style: TextStyle(fontSize: 14, color: Color(0xff393939)),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onHorizontalDragUpdate: (val) {
                          setState(() {
                            prog += val.primaryDelta! / 300;
                            prog = prog.clamp(0.0, 1.0);
                            widget.monthlyDistance.text =
                                ((prog * 5000).ceil()).toString();
                          });
                        },
                        child: GradientProgressBar(
                          progress: prog,
                          height: 20,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "${(prog * 5000).ceil()} Kilometers",
                          style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),

                // Vehicle Type Dropdown
                Padding(
                  padding: EdgeInsets.only(bottom: myheight * 0.02),
                  child: CustomDropdown(
                    hintText:'hybrid' ,
                    initialValue: widget.vehicle.text,
                    items: const [
                      'Petrol',
                      'hybrid',
                      'lpg',
                      'diesel',
                      'electric'
                    ],
                    onChanged: (value) {
                      print("Selected : $value");
                    },
                    text: 'Vehicle type',
                  ),
                ),

                // Flying Frequency Dropdown
                Padding(
                  padding: EdgeInsets.only(bottom: myheight * 0.03),
                  child: CustomDropdown(
                    hintText: 'never',
                    initialValue: widget.flyingFrequency.text,
                    items: const [
                      'Never',
                      'Rarely',
                      'Frequently',
                      'Very Frequently',
                    ],
                    onChanged: (value) {
                      print("Selected : $value");
                    },
                    text: 'Flying Frequency',
                  ),
                ),

                // Calculate Button
                if (widget.showButton)
                  Padding(
                    padding: EdgeInsets.only(top: myheight * 0.03),
                    child: DefaultButton(
                      colored: true,
                      onClick: widget.onClick,
                      text: widget.text ?? 'Calculate',
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
