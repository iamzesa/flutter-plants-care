import 'package:firstapp/models/plant.dart';

class PlantList {
  List<Plant> plants;

  PlantList({ this.plants });

  factory PlantList.fromJson(List<dynamic> json) {
    List<Plant> plants = List<Plant>();
    plants = json.map((plant) => Plant.fromJson(plant)).toList();

    return PlantList(plants: plants);
  }
}