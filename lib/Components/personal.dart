import 'package:carbon/Components/appColor.dart';
import 'package:carbon/Components/defaultButton.dart';
import 'package:carbon/Components/dropDown.dart';
import 'package:carbon/Components/heightTextField.dart';
import 'package:flutter/material.dart';

class PersonCard extends StatefulWidget {
  final bool showButton;
  final VoidCallback onClick;
  final String? text;
  final String selectedGender;
  final String bodyType;
  final String selectedDiet;
  final String selectedSocialActivity;
  final ValueChanged<String> onBodyTypeChanged;

  final ValueChanged<String> onGenderChanged;
  final ValueChanged<String> onDietChanged;
  final ValueChanged<String> onSocialActivityChanged;

  const PersonCard({
    super.key,

    required this.selectedGender,
    required this.selectedDiet,
    required this.selectedSocialActivity,
    required this.onGenderChanged,
    required this.onDietChanged,
    required this.onSocialActivityChanged,
    this.showButton = true,
    required this.onClick,
    this.text, required this.bodyType, required this.onBodyTypeChanged,
  });

  @override
  State<PersonCard> createState() => _PersonCardState();
}

class _PersonCardState extends State<PersonCard> {
  @override
  Widget build(BuildContext context) {
    double mywidth = MediaQuery.of(context).size.width;
    double myheight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Your personal usage",
            style: TextStyle(
              fontSize: 20,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Tell us what you aim to achieve.",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff6A6F73),
            ),
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
                  // Padding(
                  //   padding: EdgeInsets.only(top: myheight * (16 / 853)),
                  //   child: NumberInputWidget(
                  //     label: "Height",
                  //     initialValue: int.tryParse(widget.heightController.text) ?? 0,
                  //     isVisible: true,
                  //     controller: widget.heightController,
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(top: myheight * (16 / 853)),
                  //   child: NumberInputWidget(
                  //     label: "Width",
                  //     initialValue: int.tryParse(widget.widthController.text) ?? 0,
                  //     isVisible: true,
                  //     controller: widget.widthController,
                  //   ),
                  // ),
                  // Gender dropdown
                  Padding(
                    padding: EdgeInsets.only(top: myheight * (16 / 853)),
                    child: CustomDropdown(
                      hintText: 'female',
                      text: widget.selectedGender.isNotEmpty
                          ? widget.selectedGender
                          : 'Select Gender',
                      initialValue: widget.selectedGender,
                      items: const ['Female', 'Male'],
                      onChanged: widget.onGenderChanged,
                    ),
                  ),


                  //body

 Padding(
                    padding: EdgeInsets.only(top: myheight * (16 / 853)),
                    child: CustomDropdown(
                      hintText: 'normal',
                      text: widget.bodyType.isNotEmpty
                          ? widget.bodyType
                          : 'Select Body Type',
                      initialValue: widget.bodyType,
                      items: const ['overWight', 'underWeight','normal','obese'],
                      onChanged: widget.onBodyTypeChanged,
                    ),
                  ),


                  // Diet dropdown
                  Padding(
                    padding: EdgeInsets.only(top: myheight * (16 / 853)),
                    child: CustomDropdown(
                      hintText: 'Omnivore',
                      text: widget.selectedDiet.isNotEmpty
                          ? widget.selectedDiet
                          : 'Select Diet',
                      initialValue: widget.selectedDiet,
                      items: const [
                        'Omnivore',
                        'Pescatarian',
                        'Vegetarian',
                        'Vegan'
                      ],
                      onChanged: widget.onDietChanged,
                    ),
                  ),
                  // Social Activity dropdown
                  Padding(
                    padding: EdgeInsets.only(top: myheight * (16 / 853), bottom: 10),
                    child: CustomDropdown(
                      hintText: 'never',
                      text: widget.selectedSocialActivity.isNotEmpty
                          ? widget.selectedSocialActivity
                          : 'Select Activity',
                      initialValue: widget.selectedSocialActivity,
                      items: const ['Never', 'Often', 'Sometimes'],
                      onChanged: widget.onSocialActivityChanged,
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
      ),
    );
  }
}
