class AiMealModel {
  List<Meals>? meals;

  AiMealModel({this.meals});

  factory AiMealModel.fromJson(Map<String, dynamic> json) {
    return AiMealModel(
      meals: (json['meals'] as List<dynamic>?)
          ?.map((v) => Meals.fromJson(v as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'meals': meals?.map((v) => v.toJson()).toList(),
    };
  }
}

class Meals {
  var mealId;
  var mealName;
  var description;
  var preparationTime;
  var mealCookingTime;
  var servings;
  var caloriesPerServing;
  var proteinG;
  var carbohydratesG;
  var fatsG;
  List<Ingredients>? ingredients;
  var estimatedMakingCost;

  Meals({
    this.mealId,
    this.mealName,
    this.description,
    this.preparationTime,
    this.mealCookingTime,
    this.servings,
    this.caloriesPerServing,
    this.proteinG,
    this.carbohydratesG,
    this.fatsG,
    this.ingredients,
    this.estimatedMakingCost,
  });

  factory Meals.fromJson(Map<String, dynamic> json) {
    return Meals(
      mealId: json['mealId'],
      mealName: json['mealName'],
      description: json['description'],
      preparationTime: json['preparationTime'],
      mealCookingTime: json['mealCookingTime'],
      servings: json['servings'],
      caloriesPerServing: json['caloriesPerServing'],
      proteinG: json['proteinG'],
      carbohydratesG: json['carbohydratesG'],
      fatsG: json['fatsG'],
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((v) => Ingredients.fromJson(v as Map<String, dynamic>))
          .toList(),
      estimatedMakingCost: json['estimatedMakingCost'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mealId': mealId,
      'mealName': mealName,
      'description': description,
      'preparationTime': preparationTime,
      'mealCookingTime': mealCookingTime,
      'servings': servings,
      'caloriesPerServing': caloriesPerServing,
      'proteinG': proteinG,
      'carbohydratesG': carbohydratesG,
      'fatsG': fatsG,
      'ingredients': ingredients?.map((v) => v.toJson()).toList(),
      'estimatedMakingCost': estimatedMakingCost,
    };
  }
}

class Ingredients {
  var quantity;
  var ingredientName;
  var units;

  Ingredients({this.quantity, this.ingredientName, this.units});

  factory Ingredients.fromJson(Map<String, dynamic> json) {
    return Ingredients(
      quantity: json['quantity'],
      ingredientName: json['ingredientName'],
      units: json['units'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quantity': quantity,
      'ingredientName': ingredientName,
      'units': units,
    };
  }
}