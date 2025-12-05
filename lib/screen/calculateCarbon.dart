import 'package:carbon/Components/Consumption.dart';
import 'package:carbon/Components/categories.dart';
import 'package:carbon/Components/energyCard.dart';
import 'package:carbon/Components/travelCard.dart';
import 'package:carbon/Components/wasteCard.dart';
import 'package:flutter/material.dart';
import 'package:carbon/Components/CalculatedCard.dart';
import 'package:carbon/Components/personal.dart';
import 'package:carbon/model/Api_Fun.dart';
import 'package:carbon/model/carbon_Model.dart';

class Calculatecarbon extends StatefulWidget {
  final String category;

  const Calculatecarbon({super.key, required this.category});

  @override
  _CalculatecarbonState createState() => _CalculatecarbonState();
}

class _CalculatecarbonState extends State<Calculatecarbon> {
  final TextEditingController bodyTypeController = TextEditingController();

  final TextEditingController genderController = TextEditingController();
  final TextEditingController dietController = TextEditingController();
  final TextEditingController socialActivityController = TextEditingController();

  //  Wa
  final TextEditingController bagSizeController = TextEditingController();
  final TextEditingController bagCountController = TextEditingController();
  final TextEditingController recycleMaterialController = TextEditingController();


    //energy
  final TextEditingController powerSourceController = TextEditingController();
final   TextEditingController tvController=TextEditingController();
  final TextEditingController cookingSystemController = TextEditingController();
  final TextEditingController energyEfficiencyController = TextEditingController();
final TextEditingController InternetController=TextEditingController();
//con
  final TextEditingController clothesBuying = TextEditingController();
  final TextEditingController grocerySpending = TextEditingController();
  final TextEditingController showerFrequency = TextEditingController();

//travel
final TextEditingController vehicleController= TextEditingController();
  final TextEditingController flyingFrequency = TextEditingController();
  final TextEditingController monthlyDistance = TextEditingController();
  final TextEditingController transportation = TextEditingController();

  String predictionValue = '';

  Future<void> calculateCarbonEmission(CarbonEmissionData data) async {
    try {
      String result = await ApiFun.sendCarbonEmissionData(data);
      setState(() {
        predictionValue = result;
      });

      // Show the result in a dialog
      showDialog(
        context: context,
        builder: (context) => Calculatedcard(
          predictionValue: predictionValue,
        ),
      );
    } catch (e) {
      print("Error sending carbon emission data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> categoryWidgets = {
      'Person': PersonCard(

       bodyType:bodyTypeController.text ,
        selectedGender: genderController.text,
        selectedDiet: dietController.text,
        selectedSocialActivity: socialActivityController.text,
        onGenderChanged: (value) => genderController.text = value,
        onDietChanged: (value) => dietController.text = value,
        onBodyTypeChanged: (value) => bodyTypeController.text=value,
        onSocialActivityChanged: (value) => socialActivityController.text = value,
        onClick: () {
          CarbonEmissionData data1 = CarbonEmissionData(
            bodyType: bodyTypeController.text,
            sex: genderController.text,
            diet: dietController.text,
            howOftenShower: "",
            heatingEnergySource: "",
            transport: "",
            vehicleType: "",
            socialActivity: socialActivityController.text.toString(),
            monthlyGroceryBill: 1.0,
            frequencyOfTravelingByAir: 1.0,
            monthlyDistanceKm: 1.0,
            wasteBagSize: "",
            wasteBagWeeklyCount: 1.0,
            howLongTvPcDailyHour: 5.6,
            howManyNewClothesMonthly: 12.9,
            howLongInternetDailyHour: 2.8,
            energyEfficiency: "",
            recycling: "No",
            cookingWith: "Gas",
          );

          calculateCarbonEmission(data1);
        },
      ),
      'All categories': AllCategories(),
      
      'Waste': WasteCard(
        selectedBagSize: bagSizeController.text,
        initialProgress: double.tryParse(bagCountController.text) ?? 0.0,
        selectedRecycleMaterial: recycleMaterialController.text,
        onBagSizeChanged: (value) => bagSizeController.text = value,
        onProgressChanged: (value) => bagCountController.text = value.toString(),
        onRecycleMaterialChanged: (value) =>
            recycleMaterialController.text = value,
        onClick: () {
          CarbonEmissionData dataWaste = CarbonEmissionData(
            bodyType: "",
            sex: '',
            diet: '',
            howOftenShower: "",
            heatingEnergySource: "",
            transport: "",
            vehicleType: "",
            socialActivity: '',
            monthlyGroceryBill: 00.0,
            frequencyOfTravelingByAir: 0.0,
            monthlyDistanceKm: 000.0,
            wasteBagSize: bagSizeController.text,
            wasteBagWeeklyCount: double.tryParse(bagCountController.text),
            howLongTvPcDailyHour: 0.0,
            howManyNewClothesMonthly: 0.0,
            howLongInternetDailyHour: 0.0,
            energyEfficiency: "",
            recycling: recycleMaterialController.text,
            cookingWith: "",
          );

          calculateCarbonEmission(dataWaste);
        },
      ),
'Energy': Energycard(
  initialProgressInternet: double.tryParse(InternetController.text) ?? 0.0,
  onProgressChangedInternet: (value) => InternetController.text = value.toString(),
          initialProgress: double.tryParse(tvController.text) ?? 0.0,
onProgressChanged:(value) => tvController.text = value.toString(), 

   powerSourceController: powerSourceController,
    cookingSystemController: cookingSystemController, 
    energyEfficiencyController: energyEfficiencyController,

    
  onClick: (){
     CarbonEmissionData dataEnergy = CarbonEmissionData(
            bodyType: "",
            sex: '',
            diet:'',
            howOftenShower: "",
            heatingEnergySource: powerSourceController.text.toString(),
            transport: "",
            vehicleType: "",
            socialActivity: '',
            monthlyGroceryBill: 1,
            frequencyOfTravelingByAir: 1,
            monthlyDistanceKm: 1.0,
            wasteBagSize: '',
            wasteBagWeeklyCount: 1.0,
            howLongTvPcDailyHour:  double.parse( tvController.text.toString()),
            howManyNewClothesMonthly: 1.0,
            howLongInternetDailyHour:double.parse(InternetController.text.toString()),
            energyEfficiency:energyEfficiencyController.text.toString(),
            recycling: '',
            cookingWith: cookingSystemController.text.toString(),
          );

          calculateCarbonEmission(dataEnergy);
  },
  
    )




 ,'Consumption':ConsumptionCard(
  clothesBuying: clothesBuying,
  grocerySpending:grocerySpending ,
showerFrequency:showerFrequency ,
  onClick: (){


 CarbonEmissionData dataCon = CarbonEmissionData(
            bodyType: "",
            sex: '',
            diet:'',
            howOftenShower:showerFrequency.text.toString() ,
            heatingEnergySource: '',
            transport: "",
            vehicleType: "",
            socialActivity: '',
            monthlyGroceryBill:double.parse(grocerySpending.text),
            frequencyOfTravelingByAir: 1.0,
            monthlyDistanceKm: 1.0,
            wasteBagSize: '',
            wasteBagWeeklyCount: 1.0,
            howLongTvPcDailyHour: 1.0,
            howManyNewClothesMonthly:double.parse(clothesBuying.text),
            howLongInternetDailyHour: 1.0,
            energyEfficiency:'',
            recycling: '',
            cookingWith:'' ,
          );

          calculateCarbonEmission(dataCon);



 }),


 'Travel':Travelcard(
  flyingFrequency:flyingFrequency ,
  monthlyDistance: monthlyDistance,
  transportation:transportation ,
  vehicle:  vehicleController,
 onClick: () {
  double monthlyDistanceValue = double.parse(monthlyDistance.text);

  CarbonEmissionData data = CarbonEmissionData(
    bodyType: "Slim",
    sex: 'Male',
    diet: 'Vegetarian',
    howOftenShower: 'Daily',
    heatingEnergySource: 'Electric',
    transport:transportation.text.toString(),
    vehicleType: vehicleController.text,
    socialActivity: 'Regular',
    monthlyGroceryBill: 20.0,
    frequencyOfTravelingByAir: 16.8,
    monthlyDistanceKm: monthlyDistanceValue,
    wasteBagSize: 'Large',
    wasteBagWeeklyCount: 9.0,
    howLongTvPcDailyHour: 5.6,
    howManyNewClothesMonthly: 200,
    howLongInternetDailyHour: 2.8,
    energyEfficiency: 'High',
    recycling: 'No',
    cookingWith: 'Gas',
  );

  calculateCarbonEmission(data);
}
)

    };

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 67.0, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 1.0, bottom: 20),
                  child: Icon(Icons.arrow_back),
                ),
              ),
              categoryWidgets[widget.category] ??
                  const Center(child: Text("Unknown category")),
            ],
          ),
        ),
      ),
    );
  }
}
