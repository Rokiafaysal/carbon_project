import 'package:carbon/Components/CalculatedCard.dart';
import 'package:carbon/Components/Consumption.dart';
import 'package:carbon/Components/energyCard.dart';
import 'package:carbon/Components/personal.dart';
import 'package:carbon/Components/travelCard.dart';
import 'package:carbon/Components/wasteCard.dart';
import 'package:carbon/model/Api_Fun.dart';
import 'package:carbon/model/carbon_Model.dart';
import 'package:flutter/material.dart';

class AllCategories extends StatefulWidget {
    static CarbonEmissionData carbonEmissionData=CarbonEmissionData();

  @override
  _AllCategoriesState createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  

  TextEditingController heightController = TextEditingController();
  TextEditingController widthController = TextEditingController();

    final TextEditingController bodyTypeController = TextEditingController();
final   TextEditingController tvController=TextEditingController();

  final TextEditingController genderController = TextEditingController();
  final TextEditingController dietController = TextEditingController();
  final TextEditingController socialActivityController = TextEditingController();
  final TextEditingController bagSizeController = TextEditingController();
  final TextEditingController bagCountController = TextEditingController();
  final TextEditingController recycleMaterialController = TextEditingController();
  final TextEditingController powerSourceController = TextEditingController();
  final TextEditingController cookingSystemController = TextEditingController();
  final TextEditingController energyEfficiencyController = TextEditingController();
  final TextEditingController clothesBuying = TextEditingController();
  final TextEditingController grocerySpending = TextEditingController();
  final TextEditingController showerFrequency = TextEditingController();
  final TextEditingController flyingFrequency = TextEditingController();
  final TextEditingController monthlyDistance = TextEditingController();
  final TextEditingController transportation = TextEditingController();

final TextEditingController InternetController=TextEditingController();

  final TextEditingController vehicleController=TextEditingController();

  final List<Widget> _cards = [];

  @override
  void initState() {
    super.initState();
    _cards.addAll([
      PersonCard(
        text: 'Next',
        onBodyTypeChanged: (value) => bodyTypeController.text=value,

        bodyType:bodyTypeController.text ,
        selectedGender: genderController.text,
        selectedDiet: dietController.text,
        selectedSocialActivity: socialActivityController.text,
        onGenderChanged: (value) => genderController.text = value,
        onDietChanged: (value) => dietController.text = value,
        onSocialActivityChanged: (value) => socialActivityController.text = value,
        onClick: () {
          AllCategories.carbonEmissionData.bodyType= bodyTypeController.text;
          AllCategories.carbonEmissionData.sex=genderController.text;
          AllCategories.carbonEmissionData.diet=dietController.text;
          AllCategories.carbonEmissionData.socialActivity=socialActivityController.text;
          
          
          
          /*= CarbonEmissionData(
            bodyType: "Slim", // Example static value, can be updated based on input
            sex: genderController.text,
            diet: dietController.text,
            socialActivity: socialActivityController.text,
          );*/
          _navigateNext();
        },
      ),
      WasteCard(
        text: 'Next',
        selectedBagSize: bagSizeController.text,
        initialProgress: double.tryParse(bagCountController.text) ?? 0.0,
        selectedRecycleMaterial: recycleMaterialController.text,
        onBagSizeChanged: (value) => bagSizeController.text = value,
        onProgressChanged: (value) => bagCountController.text = value.toString(),
        onRecycleMaterialChanged: (value) => recycleMaterialController.text = value,
        onClick: () {

AllCategories.carbonEmissionData.wasteBagSize=bagSizeController.text;
AllCategories.carbonEmissionData.wasteBagWeeklyCount=double.parse( bagCountController.text);
AllCategories.carbonEmissionData.recycling=recycleMaterialController.text;
          // CarbonEmissionData data = CarbonEmissionData(
          // 
          //   wasteBagSize: bagSizeController.text,
          //   wasteBagWeeklyCount: double.tryParse(bagCountController.text) ?? 0.0,
          //   recycling: recycleMaterialController.text,
          // );
          _navigateNext();
        },
      ),
      Energycard(
         initialProgressInternet: double.tryParse(InternetController.text) ?? 0.0,
  onProgressChangedInternet: (value) => InternetController.text = value.toString(),
          initialProgress: double.tryParse(tvController.text) ?? 0.0,
onProgressChanged:(value) => tvController.text = value.toString(), 
        text: 'Next',
        powerSourceController: powerSourceController,
        cookingSystemController: cookingSystemController,
        energyEfficiencyController: energyEfficiencyController,
        onClick: () {
          AllCategories.carbonEmissionData.howLongTvPcDailyHour=double.parse(tvController.text.toString());
AllCategories.carbonEmissionData.howLongInternetDailyHour=double.parse(InternetController.text.toString());
          AllCategories.carbonEmissionData.heatingEnergySource=powerSourceController.text;
          AllCategories.carbonEmissionData.energyEfficiency=energyEfficiencyController.text;
          AllCategories.carbonEmissionData.cookingWith=cookingSystemController.text;
          // CarbonEmissionData data = CarbonEmissionData(
          //   heatingEnergySource: powerSourceController.text,
          //   energyEfficiency: energyEfficiencyController.text,
          //   cookingWith: cookingSystemController.text,
          // );
          _navigateNext();
        },
      ),
      ConsumptionCard(
        text: 'Next',
        clothesBuying: clothesBuying,
        grocerySpending: grocerySpending,
        showerFrequency: showerFrequency,
        onClick: () {
          AllCategories.carbonEmissionData.monthlyGroceryBill=double.parse(grocerySpending.text);
          AllCategories.carbonEmissionData.howOftenShower=(showerFrequency.text);
          AllCategories.carbonEmissionData.howManyNewClothesMonthly=double.parse(clothesBuying.text);
          // CarbonEmissionData data = CarbonEmissionData(
          //   monthlyGroceryBill: double.parse(grocerySpending.text),
          //   howManyNewClothesMonthly: double.parse(clothesBuying.text),
          // );
          _navigateNext();
        },
      ),
      Travelcard(
        vehicle: vehicleController,
        flyingFrequency: flyingFrequency,
        monthlyDistance: monthlyDistance,
        transportation: transportation,
        onClick: () {
          double monthlyDistanceValue = double.parse(monthlyDistance.text);


AllCategories.carbonEmissionData.frequencyOfTravelingByAir=1.0;
          AllCategories.carbonEmissionData.transport=transportation.text;
          AllCategories.carbonEmissionData.monthlyDistanceKm=monthlyDistanceValue;
          AllCategories.carbonEmissionData.vehicleType=vehicleController.text;
          // Final data collection when the user clicks on the final card
          // CarbonEmissionData data = CarbonEmissionData(
          //   transport: transportation.text,
          //   monthlyDistanceKm: monthlyDistanceValue,
          //  
          // );
          
          calculateCarbonEmission(AllCategories.carbonEmissionData);
        },
      ),
    ]);
  }
  /* 
  carbonEmission
  
  */
  String predictionValue = '';

  Future<void> calculateCarbonEmission(CarbonEmissionData data) async {
    try {
      String result = await ApiFun.sendCarbonEmissionData(data);
      setState(() {
        predictionValue = result;
      });



showDialog(
        context: context,
        builder: (context) => Calculatedcard(
          predictionValue: predictionValue,
        ),
      );
      // showDialog(
      //   context: context,
      //   builder: (context) => AlertDialog(
      //     title: const Text("Result"),
      //     content: Text("Prediction: $result"),
      //     actions: [
      //       TextButton(
      //         onPressed: () => Navigator.pop(context),
      //         child: const Text("OK"),
      //       ),
      //     ],
      //   ),
      // );
    } catch (e) {
      print("Error sending carbon emission data: $e");
    }
  }

  void _navigateNext() {
    if (_currentPage < _cards.length - 1) {
      setState(() {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height, 
          child: PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _cards.length,
            itemBuilder: (context, index) {
              return SizedBox.expand(
                child: _cards[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
