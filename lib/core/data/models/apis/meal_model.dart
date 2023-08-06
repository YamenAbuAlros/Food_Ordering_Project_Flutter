class MealModel {
  int? id;
  String? name;
  String? categoryName;
  int? price;
  int? categoryId;
  String? description;
  List<String>? images;

  MealModel(
      {this.id,
      this.name,
      this.categoryName,
      this.price,
      this.categoryId,
      this.description,
      this.images});

  MealModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryName = json['categoryName'];
    price = json['price'];
    categoryId = json['categoryId'];
    description = json['description'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['categoryName'] = categoryName;
    data['price'] = price;
    data['categoryId'] = categoryId;
    data['description'] = description;
    data['images'] = images;
    return data;
  }
}


// class MealModel {
//   int? id;
//   String? name;
//   String? logo;
//   List<Meals>? meals;

//   MealModel({this.id, this.name, this.logo, this.meals});

//   MealModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     logo = json['logo'];
//     if (json['meals'] != null) {
//       meals = <Meals>[];
//       json['meals'].forEach((v) {
//         meals!.add(Meals.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['logo'] = logo;
//     if (meals != null) {
//       data['meals'] = meals!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }


