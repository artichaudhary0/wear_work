enum Gender {
  male,
  female,
  other,
}

enum FoodType {
  veg,
  nonVeg,
}

enum BedRidden {
  yes,
  no,
}

enum VehicleType {
  twoVehicle,
  fourVehicle,
}

enum TimeEnum {
  week,
  halfMonth,
  fullMonth,
}

enum WorkingTime {
  morning,
  afternoon,
  evening,
}

class Skill {
  final String name;
  final String description;

  Skill({required this.name, required this.description});
}

List<Skill> selectedSkills = [];

void addSkill(Skill skill) {
  selectedSkills.add(skill);
}

void removeSkill(Skill skill) {
  selectedSkills.remove(skill);
}

enum UserType {
  Hiring,
  Registration,
  Browsing,
}
