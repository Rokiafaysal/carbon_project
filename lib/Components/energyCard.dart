import 'package:flutter/material.dart';
import 'package:carbon/Components/appColor.dart';
import 'package:carbon/Components/defaultButton.dart';
import 'package:carbon/Components/dropDown.dart';
import 'package:carbon/Components/progressBar.dart';

class Energycard extends StatefulWidget {
  final bool showButton;
  final VoidCallback onClick;
  final String? text;


    final double initialProgress;
  final ValueChanged<double> onProgressChanged;

      final double initialProgressInternet;
  final ValueChanged<double> onProgressChangedInternet;

  // Accepting the user inputs as parameters
  final TextEditingController powerSourceController;
  final TextEditingController cookingSystemController;
  final TextEditingController energyEfficiencyController;
  


  const Energycard({
    super.key,
    this.showButton = true,
    required this.onClick,
    this.text,
    required this.powerSourceController,
    required this.cookingSystemController,
    required this.energyEfficiencyController, required this.initialProgress, required this.onProgressChanged, required this.initialProgressInternet, required this.onProgressChangedInternet,
  });

  @override
  State<Energycard> createState() => _EnergycardState();
}

double prog = 1.0;
double prog2 = 1.0;

class _EnergycardState extends State<Energycard> {
  @override
  void initState() {
    super.initState();
    prog = 0;
    prog2 = 0;
  }

  @override
  Widget build(BuildContext context) {
    double mywidth = MediaQuery.of(context).size.width;
    double myheight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Your Energy usage",
          style: TextStyle(fontSize: 20, color: AppColors.primaryColor, fontWeight: FontWeight.bold),
        ),
        const Text(
          "Tell us what you aim to achieve with Bookly.",
          style: TextStyle(fontSize: 14, color: Color(0xff6A6F73)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Container(
            width: mywidth,
            decoration: BoxDecoration(
              color: const Color(0xffF3F3F3),
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Power Source Dropdown
                Padding(
                  padding: EdgeInsets.only(top: myheight * (16 / 853)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: myheight * (8 / 853)),
                        child: const Text(
                          'What power source do you use for heating?',
                          style: TextStyle(fontSize: 14, color: Color(0xff393939)),
                        ),
                      ),
                      CustomDropdown(
                        hintText: 'Natural gas',
                        initialValue: widget.powerSourceController.text.isEmpty ? null : widget.powerSourceController.text,
                        items: const ['Natural gas', 'Electricity', 'Wood', 'Coal'],
                        onChanged: (value) {
                          setState(() {
                            widget.powerSourceController.text = value!;
                          });
                        },
                        text: 'Power Source',
                      ),
                    ],
                  ),
                ),
                // Cooking Systems Dropdown
                Padding(
                  padding: EdgeInsets.only(top: myheight * (16 / 853)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: myheight * (8 / 853)),
                        child: const Text(
                          'What cooking systems do you use?',
                          style: TextStyle(fontSize: 14, color: Color(0xff393939)),
                        ),
                      ),
                      CustomDropdown(
                        hintText: 'microwave',
                        initialValue: widget.cookingSystemController.text.isEmpty ? null : widget.cookingSystemController.text,
                        items: const ['microwave', 'oven', 'grill', 'airfryer', 'stove'],
                        onChanged: (value) {
                          setState(() {
                            widget.cookingSystemController.text = value!;
                          });
                        },
                        text: 'Cooking System',
                      ),
                    ],
                  ),
                ),
                // Energy Efficiency Dropdown
                Padding(
                  padding: EdgeInsets.only(top: myheight * (16 / 853)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: myheight * (8 / 853)),
                        child: const Text(
                          'Do you consider the energy efficiency of electronic devices?',
                          style: TextStyle(fontSize: 14, color: Color(0xff393939)),
                        ),
                      ),
                      CustomDropdown(
                        hintText: 'Yes',
                        initialValue: widget.energyEfficiencyController.text.isEmpty ? null : widget.energyEfficiencyController.text,
                        items: const ['No', 'Yes', 'Sometimes'],
                        onChanged: (value) {
                          setState(() {
                            widget.energyEfficiencyController.text = value;
                          });
                        },
                        text: 'Energy Efficiency',
                      ),
                    ],
                  ),
                ),
                // Progress Bar for PC/TV Hours
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: myheight * (8 / 853)),
                        child: const Text(
                          'How many hours a day do you spend in front of your PC/TV?',
                          style: TextStyle(fontSize: 14, color: Color(0xff393939)),
                        ),
                      ),
                      GestureDetector(
                        onHorizontalDragUpdate: (val) {
                          setState(() {

                            
                            prog += val.primaryDelta! / 300;
                            prog = prog.clamp(0.0, 1.0);
                          });
                                                    widget.onProgressChanged(prog);

                        },
                        child: GradientProgressBar(
                          progress: prog,
                          height: 20,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${(prog * 24).ceil()} Hours",
                            style: const TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Progress Bar for Internet Usage
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: myheight * (8 / 853)),
                        child: const Text(
                          'What is your daily internet usage in hours?',
                          style: TextStyle(fontSize: 14, color: Color(0xff393939)),
                        ),
                      ),
                      GestureDetector(
                        onHorizontalDragUpdate: (val) {
                          setState(() {
                            prog2 += val.primaryDelta! / 300;
                            prog2 = prog2.clamp(0.0, 1.0);
                          });
                                                                              widget.onProgressChangedInternet(prog2);

                        },
                        child: GradientProgressBar(
                          progress: prog2,
                          height: 20,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${(prog2 * 24).ceil()} Hours",
                            style: const TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Calculate Button
                if (widget.showButton)
                  Padding(
                    padding: EdgeInsets.only(top: myheight * (30 / 853)),
                    child: DefaultButton(
                      colored: true,
                      onClick: widget.onClick,
                      text: widget.text ?? 'Calculate',
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
