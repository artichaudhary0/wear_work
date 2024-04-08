import 'app_constants.dart';

Map<String, bool> babySelectedTiles = {};
Map<String, bool> foodTypeSelectedTiles = {};
Map<String, bool> elderServiceSelectedTiles = {};
Map<String, bool> eventSelectedTiles = {};
Map<String, bool> homeSelectedTiles = {};
Map<String, bool> poolSelectedTiles = {};
Map<String, bool> vehicleSelectedTiles = {};
WorkingTime? selectedWorkingTime = WorkingTime.morning;
TimeEnum? selectedDuration = TimeEnum.week;
DateTime? selectedDate;
bool mealType1 = false;
bool mealType2 = false;
bool mealType3 = false;
FoodType? selectedFood = FoodType.veg;
UserType currentUserType = UserType.Hiring;
Map<String, bool> hiringSelectedTiles = {};
Map<String, bool> registrationSelectedTiles = {};
