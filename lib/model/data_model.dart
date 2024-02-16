class DataModel {
  String name;
  String img;
  int price;
  int people;
  int stars;
  String description;
  String location;

  DataModel({
    required this.name,
    required this.img,
    required this.price,
    required this.people,
    required this.stars,
    required this.description,
    required this.location,
  });

  factory DataModel.fromJson(Map<String, dynamic>  e){
    return DataModel(
        name: e['name'],
        img: e['img'],
        price: e['price'],
        people: e['people'],
        stars: e['stars'],
        description: e['description'],
        location: e['location']
    );
  }
}