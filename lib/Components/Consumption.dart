import 'package:carbon/Components/appColor.dart';
import 'package:carbon/Components/defaultButton.dart';
import 'package:carbon/Components/dropDown.dart';
import 'package:carbon/Components/progressBar.dart';
import 'package:flutter/material.dart';

class ConsumptionCard extends StatefulWidget {
  final bool ?showButton;
  final VoidCallback onClick;
  final String ?text;

  final TextEditingController showerFrequency;
  final TextEditingController grocerySpending;
  final TextEditingController clothesBuying;

  const ConsumptionCard({
    super.key,
     this.showButton,
    required this.onClick,
     this.text,
    required this.showerFrequency,
    required this.grocerySpending,
    required this.clothesBuying,
  });

  @override
  State<ConsumptionCard> createState() => _ConsumptionCardState();
}

double prog = 1.0;
double prog2 = 1.0;

class _ConsumptionCardState extends State<ConsumptionCard> {
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
        const Text("Your Consumption usage",
            style: TextStyle(
                fontSize: 20,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold)),
        const Text("Tell us what you aim to achieve with Bookly.",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff6A6F73),
            )),
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
                // Shower Frequency Dropdown
                Padding(
                  padding: EdgeInsets.only(top: myheight * (16 / 853)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: myheight * (8 / 853)),
                        child: const Text(
                          'How often do you take a shower?',
                          style: TextStyle(fontSize: 14, color: Color(0xff393939)),
                        ),
                      ),
                      CustomDropdown(
                        hintText: 'Daily',
                        initialValue: widget.showerFrequency.text.isEmpty
                            ? null
                            : widget.showerFrequency.text,
                        items: [
                          'Daily',
                          'Twice a day',
                          'More frequently',
                          'Less frequently'
                        ],
                        onChanged: (value) {
                          setState(() {
                            widget.showerFrequency.text = value!;
                          });
                        },
                        text: 'Shower Frequency',
                      ),
                    ],
                  ),
                ),

                // Monthly Grocery Spending Progress Bar
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: myheight * (8 / 853)),
                        child: const Text(
                          'Monthly grocery spending in \$',
                          style: TextStyle(fontSize: 14, color: Color(0xff393939)),
                        ),
                      ),
                      GestureDetector(
                        onHorizontalDragUpdate: (val) {
                          setState(() {
                            prog += val.primaryDelta! / 300;
                            prog = prog.clamp(0.0, 1.0);
                            widget.grocerySpending.text = (prog * 500).ceil().toString();
                          });
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
                            "${(prog * 500).ceil()} \$",
                            style: const TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Clothes Buying Monthly Progress Bar
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: myheight * (8 / 853)),
                        child: const Text(
                          'How many clothes do you buy monthly?',
                          style: TextStyle(fontSize: 14, color: Color(0xff393939)),
                        ),
                      ),
                      GestureDetector(
                        onHorizontalDragUpdate: (val) {
                          setState(() {
                            prog2 += val.primaryDelta! / 300;
                            prog2 = prog2.clamp(0.0, 1.0);
                            widget.clothesBuying.text = (prog2 * 30).ceil().toString();
                          });
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
                            "${(prog2 * 30).ceil()} ",
                            style: const TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Calculate Button
                  Padding(
                    padding: EdgeInsets.only(top: myheight * (30 / 853)),
                    child: DefaultButton(
                      colored: true,
                      onClick: widget.onClick,
                      text: widget.text ?? 'calculate',
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
