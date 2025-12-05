import 'package:carbon/Components/appColor.dart';
import 'package:carbon/Components/defaultButton.dart';
import 'package:carbon/Components/dropDown.dart';
import 'package:carbon/Components/progressBar.dart';
import 'package:flutter/material.dart';

class WasteCard extends StatefulWidget {
  final bool showButton; 
  final VoidCallback onClick;
  final String? text;

  // Controllers and state variables passed as parameters
  final String selectedBagSize;
  final double initialProgress;
  final String selectedRecycleMaterial;

  // Callback functions to update state variables
  final ValueChanged<String> onBagSizeChanged;
  final ValueChanged<double> onProgressChanged;
  final ValueChanged<String> onRecycleMaterialChanged;

  const WasteCard({
    super.key,
    required this.selectedBagSize,
    required this.initialProgress,
    required this.selectedRecycleMaterial,
    required this.onBagSizeChanged,
    required this.onProgressChanged,
    required this.onRecycleMaterialChanged,
    this.showButton = true,
    required this.onClick,
    this.text,
  });

  @override
  State<WasteCard> createState() => _WasteCardState();
}

class _WasteCardState extends State<WasteCard> {
  late double progress;

  @override
  void initState() {
    super.initState();
    progress = widget.initialProgress;
  }

  @override
  Widget build(BuildContext context) {
    double mywidth = MediaQuery.of(context).size.width;
    double myheight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Your Waste Usage",
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
                // Waste Bag Size Dropdown
                Padding(
                  padding: EdgeInsets.only(top: myheight * (16 / 853)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: myheight * (8 / 853)),
                        child: const Text(
                          'What is the size of your waste bag?',
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff393939)),
                        ),
                      ),
                      CustomDropdown(
                        hintText: 'small',
                        text: 'Bag Size',
                        initialValue: widget.selectedBagSize,
                        items: const ['Small', 'Medium', 'Large', 'Extra Large'],
                        onChanged: widget.onBagSizeChanged,
                      ),
                    ],
                  ),
                ),

                // Waste Bag Quantity Slider
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: myheight * (8 / 853)),
                        child: const Text(
                          'How many waste bags do you trash out in a week?',
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff393939)),
                        ),
                      ),
                      GestureDetector(
                        onHorizontalDragUpdate: (val) {
                          setState(() {
                            progress += val.primaryDelta! / 300; // Adjust 300 to change sensitivity
                            progress = progress.clamp(0.0, 1.0); // Clamp progress between 0.0 and 1.0
                          });
                          widget.onProgressChanged(progress);
                        },
                        child: GradientProgressBar(
                          progress: progress,
                          height: 20,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${(progress * 10).ceil()} Bags",
                            style: const TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Recycle Material Dropdown
                Padding(
                  padding: EdgeInsets.only(top: myheight * (16 / 853), bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: myheight * (8 / 853)),
                        child: const Text(
                          'Do you recycle any materials below?',
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff393939)),
                        ),
                      ),
                      CustomDropdown(
                        hintText: 'Plastic',
                        text: 'Recycle Material',
                        initialValue: widget.selectedRecycleMaterial,
                        items: const ['Plastic', 'Paper', 'Metal', 'Glass'],
                        onChanged: widget.onRecycleMaterialChanged,
                      ),
                    ],
                  ),
                ),

                // Button
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
