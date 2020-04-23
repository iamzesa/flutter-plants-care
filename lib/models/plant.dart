class Plant {
  int id;
  String name;
  String description;
  String photo;

  Plant({ this.id, this.name, this.description, this.photo});

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      photo: json["photo"]
    );
  }
}