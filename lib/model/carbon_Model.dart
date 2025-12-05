class CarbonEmissionData {
   String ?bodyType;
   String ?sex;
   String ?diet;
   String ?howOftenShower;
   String ?heatingEnergySource;
   String ?transport;
   String ?vehicleType;
    String ?socialActivity;
   double ?monthlyGroceryBill;
   double ?frequencyOfTravelingByAir;
   double ?monthlyDistanceKm;
   String ?wasteBagSize;
    double ?wasteBagWeeklyCount;
   double ?howLongTvPcDailyHour;
   double ?howManyNewClothesMonthly;
   double ?howLongInternetDailyHour;
   String ?energyEfficiency;
   String ?recycling;
   String ?cookingWith;

  CarbonEmissionData({
     this.bodyType,
     this.sex,
     this.diet,
     this.howOftenShower,
     this.heatingEnergySource,
     this.transport,
     this.vehicleType,
     this.socialActivity,
     this.monthlyGroceryBill,
     this.frequencyOfTravelingByAir,
     this.monthlyDistanceKm,
     this.wasteBagSize,
     this.wasteBagWeeklyCount,
     this.howLongTvPcDailyHour,
     this.howManyNewClothesMonthly,
     this.howLongInternetDailyHour,
     this.energyEfficiency,
     this.recycling,
     this.cookingWith,
  });

  Map<String, dynamic> toJson() {
    return {
      'Body_Type': bodyType,
      'Sex': sex,
      'Diet': diet,
      'How_Often_Shower': howOftenShower,
      'Heating_Energy_Source': heatingEnergySource,
      'Transport': transport,
      'Vehicle_Type': vehicleType,
      'Social_Activity': socialActivity,
      'Monthly_Grocery_Bill': monthlyGroceryBill,
      'Frequency_of_Traveling_by_Air': frequencyOfTravelingByAir,
      'MonthlyDistanceKm': monthlyDistanceKm,
      'Waste_Bag_Size': wasteBagSize,
      'Waste_Bag_Weekly_Count': wasteBagWeeklyCount,
      'How_Long_TV_PC_Daily_Hour': howLongTvPcDailyHour,
      'How_Many_New_Clothes_Monthly': howManyNewClothesMonthly,
      'How_Long_Internet_Daily_Hour': howLongInternetDailyHour,
      'Energy_efficiency': energyEfficiency,
      'Recycling': recycling,
      'Cooking_With': cookingWith,
    };
  }
}
