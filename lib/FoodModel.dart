// import 'dart:convert';
//
// FoodData foodDataFromMap(String str) => FoodData.fromMap(json.decode(str));
//
// String foodDataToMap(FoodData data) => json.encode(data.toMap());
//
// class FoodData {
//   FoodData({
//     this.wweiaFoodCategory,
//     this.description,
//     this.foodAttributes,
//     this.foodCode,
//     this.inputFoods,
//     this.startDate,
//     this.endDate,
//     this.foodComponents,
//     this.foodClass,
//     this.fdcId,
//     this.publicationDate,
//     this.foodNutrients,
//     this.foodPortions,
//     this.dataType,
//   });
//
//   WweiaFoodCategory wweiaFoodCategory;
//   String description;
//   List<FoodAttribute> foodAttributes;
//   String foodCode;
//   List<InputFood> inputFoods;
//   String startDate;
//   String endDate;
//   List<dynamic> foodComponents;
//   String foodClass;
//   String fdcId;
//   String publicationDate;
//   List<FoodNutrient> foodNutrients;
//   List<FoodPortion> foodPortions;
//   String dataType;
//
//   FoodData copyWith({
//     WweiaFoodCategory wweiaFoodCategory,
//     String description,
//     List<FoodAttribute> foodAttributes,
//     String foodCode,
//     List<InputFood> inputFoods,
//     String startDate,
//     String endDate,
//     List<dynamic> foodComponents,
//     String foodClass,
//     String fdcId,
//     String publicationDate,
//     List<FoodNutrient> foodNutrients,
//     List<FoodPortion> foodPortions,
//     String dataType,
//   }) =>
//       FoodData(
//         wweiaFoodCategory: wweiaFoodCategory ?? this.wweiaFoodCategory,
//         description: description ?? this.description,
//         foodAttributes: foodAttributes ?? this.foodAttributes,
//         foodCode: foodCode ?? this.foodCode,
//         inputFoods: inputFoods ?? this.inputFoods,
//         startDate: startDate ?? this.startDate,
//         endDate: endDate ?? this.endDate,
//         foodComponents: foodComponents ?? this.foodComponents,
//         foodClass: foodClass ?? this.foodClass,
//         fdcId: fdcId ?? this.fdcId,
//         publicationDate: publicationDate ?? this.publicationDate,
//         foodNutrients: foodNutrients ?? this.foodNutrients,
//         foodPortions: foodPortions ?? this.foodPortions,
//         dataType: dataType ?? this.dataType,
//       );
//
//   factory FoodData.fromMap(Map<String, dynamic> json) => FoodData(
//     wweiaFoodCategory: WweiaFoodCategory.fromMap(json["wweiaFoodCategory"]),
//     description: json["description"],
//     foodAttributes: List<FoodAttribute>.from(json["foodAttributes"].map((x) => FoodAttribute.fromMap(x))),
//     foodCode: json["foodCode"],
//     inputFoods: List<InputFood>.from(json["inputFoods"].map((x) => InputFood.fromMap(x))),
//     startDate: json["startDate"],
//     endDate: json["endDate"],
//     foodComponents: List<dynamic>.from(json["foodComponents"].map((x) => x)),
//     foodClass: json["foodClass"],
//     fdcId: json["fdcId"].toString(),
//     publicationDate: json["publicationDate"],
//     foodNutrients: List<FoodNutrient>.from(json["foodNutrients"].map((x) => FoodNutrient.fromMap(x))),
//     foodPortions: List<FoodPortion>.from(json["foodPortions"].map((x) => FoodPortion.fromMap(x))),
//     dataType: json["dataType"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "wweiaFoodCategory": wweiaFoodCategory.toMap(),
//     "description": description,
//     "foodAttributes": List<dynamic>.from(foodAttributes.map((x) => x.toMap())),
//     "foodCode": foodCode,
//     "inputFoods": List<dynamic>.from(inputFoods.map((x) => x.toMap())),
//     "startDate": startDate,
//     "endDate": endDate,
//     "foodComponents": List<dynamic>.from(foodComponents.map((x) => x)),
//     "foodClass": foodClass,
//     "fdcId": fdcId,
//     "publicationDate": publicationDate,
//     "foodNutrients": List<dynamic>.from(foodNutrients.map((x) => x.toMap())),
//     "foodPortions": List<dynamic>.from(foodPortions.map((x) => x.toMap())),
//     "dataType": dataType,
//   };
// }
//
// class FoodAttribute {
//   FoodAttribute({
//     this.id,
//     this.value,
//     this.sequenceNumber,
//     this.foodAttributeType,
//     this.name,
//   });
//
//   int id;
//   String value;
//   String sequenceNumber;
//   FoodAttributeType foodAttributeType;
//   String name;
//
//   FoodAttribute copyWith({
//     int id,
//     String value,
//     String sequenceNumber,
//     FoodAttributeType foodAttributeType,
//     String name,
//   }) =>
//       FoodAttribute(
//         id: id ?? this.id,
//         value: value ?? this.value,
//         sequenceNumber: sequenceNumber ?? this.sequenceNumber,
//         foodAttributeType: foodAttributeType ?? this.foodAttributeType,
//         name: name ?? this.name,
//       );
//
//   factory FoodAttribute.fromMap(Map<String, dynamic> json) => FoodAttribute(
//     id: json["id"],
//     value: json["value"],
//     sequenceNumber: json["sequenceNumber"].toString() == null ? null : json["sequenceNumber"].toString(),
//     foodAttributeType: FoodAttributeType.fromMap(json["foodAttributeType"]),
//     name: json["name"] == null ? null : json["name"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "id": id,
//     "value": value,
//     "sequenceNumber": sequenceNumber == null ? null : sequenceNumber,
//     "foodAttributeType": foodAttributeType.toMap(),
//     "name": name == null ? null : name,
//   };
// }
//
// class FoodAttributeType {
//   FoodAttributeType({
//     this.id,
//     this.name,
//     this.description,
//   });
//
//   int id;
//   String name;
//   String description;
//
//   FoodAttributeType copyWith({
//     int id,
//     String name,
//     String description,
//   }) =>
//       FoodAttributeType(
//         id: id ?? this.id,
//         name: name ?? this.name,
//         description: description ?? this.description,
//       );
//
//   factory FoodAttributeType.fromMap(Map<String, dynamic> json) => FoodAttributeType(
//     id: json["id"],
//     name: json["name"],
//     description: json["description"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "id": id,
//     "name": name,
//     "description": description,
//   };
// }
//
// class FoodNutrient {
//   FoodNutrient({
//     this.nutrient,
//     this.type,
//     this.id,
//     this.amount,
//   });
//
//   Nutrient nutrient;
//   Type type;
//   int id;
//   double amount;
//
//   FoodNutrient copyWith({
//     Nutrient nutrient,
//     Type type,
//     int id,
//     double amount,
//   }) =>
//       FoodNutrient(
//         nutrient: nutrient ?? this.nutrient,
//         type: type ?? this.type,
//         id: id ?? this.id,
//         amount: amount ?? this.amount,
//       );
//
//   factory FoodNutrient.fromMap(Map<String, dynamic> json) => FoodNutrient(
//     nutrient: Nutrient.fromMap(json["nutrient"]),
//     type: typeValues.map[json["type"]],
//     id: json["id"] == null ? null : json["id"],
//     amount: json["amount"] == null ? null : json["amount"].toDouble(),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "nutrient": nutrient.toMap(),
//     "type": typeValues.reverse[type],
//     "id": id == null ? null : id,
//     "amount": amount == null ? null : amount,
//   };
// }
//
// class Nutrient {
//   Nutrient({
//     this.id,
//     this.number,
//     this.name,
//     this.rank,
//     this.unitName,
//   });
//
//   int id;
//   String number;
//   String name;
//   String rank;
//   String unitName;
//
//   Nutrient copyWith({
//     int id,
//     String number,
//     String name,
//     String rank,
//     String unitName,
//   }) =>
//       Nutrient(
//         id: id ?? this.id,
//         number: number ?? this.number,
//         name: name ?? this.name,
//         rank: rank ?? this.rank,
//         unitName: unitName ?? this.unitName,
//       );
//
//   factory Nutrient.fromMap(Map<String, dynamic> json) => Nutrient(
//     id: json["id"],
//     number: json["number"],
//     name: json["name"],
//     rank: json["rank"].toString(),
//     unitName:json["unitName"] ,
//   );
//
//   Map<String, dynamic> toMap() => {
//     "id": id,
//     "number": number,
//     "name": name,
//     "rank": rank,
//     "unitName": unitNameValues.reverse[unitName],
//   };
// }
//
// enum UnitName { G, KCAL, MG, UNIT_NAME_G }
//
// final unitNameValues = EnumValues({
//   "g": UnitName.G,
//   "kcal": UnitName.KCAL,
//   "mg": UnitName.MG,
//   "µg": UnitName.UNIT_NAME_G
// });
//
// enum Type { FOOD_NUTRIENT }
//
// final typeValues = EnumValues({
//   "FoodNutrient": Type.FOOD_NUTRIENT
// });
//
// class FoodPortion {
//   FoodPortion({
//     this.id,
//     this.portionDescription,
//     this.gramWeight,
//     this.sequenceNumber,
//     this.modifier,
//     this.measureUnit,
//   });
//
//   int id;
//   String portionDescription;
//   String gramWeight;
//   String sequenceNumber;
//   String modifier;
//   MeasureUnit measureUnit;
//
//   FoodPortion copyWith({
//     int id,
//     String portionDescription,
//     String gramWeight,
//     String sequenceNumber,
//     String modifier,
//     MeasureUnit measureUnit,
//   }) =>
//       FoodPortion(
//         id: id ?? this.id,
//         portionDescription: portionDescription ?? this.portionDescription,
//         gramWeight: gramWeight ?? this.gramWeight,
//         sequenceNumber: sequenceNumber ?? this.sequenceNumber,
//         modifier: modifier ?? this.modifier,
//         measureUnit: measureUnit ?? this.measureUnit,
//       );
//
//   factory FoodPortion.fromMap(Map<String, dynamic> json) => FoodPortion(
//     id: json["id"],
//     portionDescription: json["portionDescription"],
//     gramWeight: json["gramWeight"].toString(),
//     sequenceNumber: json["sequenceNumber"].toString(),
//     modifier: json["modifier"],
//     measureUnit: MeasureUnit.fromMap(json["measureUnit"]),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "id": id,
//     "portionDescription": portionDescription,
//     "gramWeight": gramWeight,
//     "sequenceNumber": sequenceNumber,
//     "modifier": modifier,
//     "measureUnit": measureUnit.toMap(),
//   };
// }
//
// class MeasureUnit {
//   MeasureUnit({
//     this.id,
//     this.name,
//     this.abbreviation,
//   });
//
//   int id;
//   String name;
//   String abbreviation;
//
//   MeasureUnit copyWith({
//     int id,
//     String name,
//     String abbreviation,
//   }) =>
//       MeasureUnit(
//         id: id ?? this.id,
//         name: name ?? this.name,
//         abbreviation: abbreviation ?? this.abbreviation,
//       );
//
//   factory MeasureUnit.fromMap(Map<String, dynamic> json) => MeasureUnit(
//     id: json["id"],
//     name: json["name"],
//     abbreviation: json["abbreviation"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "id": id,
//     "name": name,
//     "abbreviation": abbreviation,
//   };
// }
//
// class InputFood {
//   InputFood({
//     this.id,
//     this.foodDescription,
//     this.ingredientDescription,
//     this.ingredientWeight,
//     this.portionCode,
//     this.portionDescription,
//     this.sequenceNumber,
//     this.ingredientCode,
//     this.unit,
//     this.amount,
//   });
//
//   int id;
//   String foodDescription;
//   String ingredientDescription;
//   String ingredientWeight;
//   String portionCode;
//   String portionDescription;
//   String sequenceNumber;
//   String ingredientCode;
//   String unit;
//   String amount;
//
//   InputFood copyWith({
//     int id,
//     String foodDescription,
//     String ingredientDescription,
//     String ingredientWeight,
//     String portionCode,
//     String portionDescription,
//     String sequenceNumber,
//     String ingredientCode,
//     String unit,
//     String amount,
//   }) =>
//       InputFood(
//         id: id ?? this.id,
//         foodDescription: foodDescription ?? this.foodDescription,
//         ingredientDescription: ingredientDescription ?? this.ingredientDescription,
//         ingredientWeight: ingredientWeight ?? this.ingredientWeight,
//         portionCode: portionCode ?? this.portionCode,
//         portionDescription: portionDescription ?? this.portionDescription,
//         sequenceNumber: sequenceNumber ?? this.sequenceNumber,
//         ingredientCode: ingredientCode ?? this.ingredientCode,
//         unit: unit ?? this.unit,
//         amount: amount ?? this.amount,
//       );
//
//   factory InputFood.fromMap(Map<String, dynamic> json) => InputFood(
//     id: json["id"],
//     foodDescription: json["foodDescription"],
//     ingredientDescription: json["ingredientDescription"],
//     ingredientWeight: json["ingredientWeight"].toString(),
//     portionCode: json["portionCode"],
//     portionDescription: json["portionDescription"],
//     sequenceNumber: json["sequenceNumber"].toString(),
//     ingredientCode: json["ingredientCode"].toString(),
//     unit: json["unit"],
//     amount: json["amount"].toString(),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "id": id,
//     "foodDescription": foodDescription,
//     "ingredientDescription": ingredientDescription,
//     "ingredientWeight": ingredientWeight,
//     "portionCode": portionCode,
//     "portionDescription": portionDescription,
//     "sequenceNumber": sequenceNumber,
//     "ingredientCode": ingredientCode,
//     "unit": unit,
//     "amount": amount,
//   };
// }
//
// class WweiaFoodCategory {
//   WweiaFoodCategory({
//     this.wweiaFoodCategoryCode,
//     this.wweiaFoodCategoryDescription,
//   });
//
//   int wweiaFoodCategoryCode;
//   String wweiaFoodCategoryDescription;
//
//   WweiaFoodCategory copyWith({
//     int wweiaFoodCategoryCode,
//     String wweiaFoodCategoryDescription,
//   }) =>
//       WweiaFoodCategory(
//         wweiaFoodCategoryCode: wweiaFoodCategoryCode ?? this.wweiaFoodCategoryCode,
//         wweiaFoodCategoryDescription: wweiaFoodCategoryDescription ?? this.wweiaFoodCategoryDescription,
//       );
//
//   factory WweiaFoodCategory.fromMap(Map<String, dynamic> json) => WweiaFoodCategory(
//     wweiaFoodCategoryCode: json["wweiaFoodCategoryCode"],
//     wweiaFoodCategoryDescription: json["wweiaFoodCategoryDescription"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "wweiaFoodCategoryCode": wweiaFoodCategoryCode,
//     "wweiaFoodCategoryDescription": wweiaFoodCategoryDescription,
//   };
// }
//
// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }