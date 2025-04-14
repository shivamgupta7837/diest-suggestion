import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_suggestion/screens/map/google_maps.dart';
import 'package:diet_suggestion/screens/splash_Screen.dart';
import 'package:flutter/material.dart';   
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'firebase_options.dart';

void main()async {
try {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseFirestore.instance.settings =
        const Settings(persistenceEnabled: true);
   
  } catch (e) {
    print("Error from main function: $e");
  }

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
    primarySwatch: Colors.deepPurple,
      ),
      home: SplashScreen(),
      // home: ShopListScreen(),
      // home: AddData(),
    );
  }
}



// class AddData extends StatelessWidget {
//   const AddData({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: ElevatedButton(
//               onPressed: addMealsToFirestore,
//               child: Text("Add Data"),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// void addMealsToFirestore() async {
//   // Reference to the Firestore collection
//   CollectionReference meals = FirebaseFirestore.instance.collection('AI_meals').doc("mIR8FJMWMZL519FXXzMk").collection("vegan");

//   // Data to be added
//   List<Map<String, dynamic>> mealData =[
//   {
//     "meal_id": 31,
//     "meal_name": "Vegan Paneer Tikka",
//     "description": "Grilled tofu cubes marinated in spices, a vegan alternative to paneer tikka.",
//     "preparation_time": 15,
//     "cooking_time": 20,
//     "servings": 4,
//     "calories_per_serving": 200,
//     "protein_g": 12,
//     "carbohydrates_g": 10,
//     "fats_g": 10,
//     "body_type": "normal_weight",
//     "ingredients": [
//       { "name": "Tofu", "quantity": 200, "unit": "grams" },
//       { "name": "Vegan Yogurt", "quantity": 100, "unit": "grams" },
//       { "name": "Garlic", "quantity": 2, "unit": "cloves" },
//       { "name": "Ginger", "quantity": 1, "unit": "inch" },
//       { "name": "Turmeric Powder", "quantity": 0.5, "unit": "teaspoon" },
//       { "name": "Salt", "quantity": 1, "unit": "teaspoon" }
//     ]
//   },
//   {
//     "meal_id": 32,
//     "meal_name": "Vegan Biryani",
//     "description": "Fragrant basmati rice cooked with mixed vegetables and aromatic spices.",
//     "preparation_time": 20,
//     "cooking_time": 30,
//     "servings": 4,
//     "calories_per_serving": 300,
//     "protein_g": 8,
//     "carbohydrates_g": 50,
//     "fats_g": 10,
//     "body_type": "over_weight",
//     "ingredients": [
//       { "name": "Basmati Rice", "quantity": 200, "unit": "grams" },
//       { "name": "Mixed Vegetables", "quantity": 150, "unit": "grams" },
//       { "name": "Onion", "quantity": 1, "unit": "medium" },
//       { "name": "Tomato", "quantity": 2, "unit": "medium" },
//       { "name": "Vegan Yogurt", "quantity": 100, "unit": "grams" },
//       { "name": "Garam Masala", "quantity": 1, "unit": "teaspoon" },
//       { "name": "Turmeric Powder", "quantity": 0.5, "unit": "teaspoon" },
//       { "name": "Salt", "quantity": 1, "unit": "teaspoon" }
//     ]
//   },
//   {
//     "meal_id": 33,
//     "meal_name": "Vegan Dal Tadka",
//     "description": "A comforting lentil curry tempered with cumin and garlic.",
//     "preparation_time": 10,
//     "cooking_time": 20,
//     "servings": 4,
//     "calories_per_serving": 200,
//     "protein_g": 10,
//     "carbohydrates_g": 25,
//     "fats_g": 8,
//     "body_type": "under_weight",
//     "ingredients": [
//       { "name": "Yellow Lentils", "quantity": 150, "unit": "grams" },
//       { "name": "Tomato", "quantity": 2, "unit": "medium" },
//       { "name": "Onion", "quantity": 1, "unit": "medium" },
//       { "name": "Garlic", "quantity": 3, "unit": "cloves" },
//       { "name": "Cumin Seeds", "quantity": 1, "unit": "teaspoon" },
//       { "name": "Turmeric Powder", "quantity": 0.5, "unit": "teaspoon" },
//       { "name": "Salt", "quantity": 1, "unit": "teaspoon" }
//     ]
//   },
//   {
//     "meal_id": 34,
//     "meal_name": "Vegan Aloo Gobi",
//     "description": "A dry curry made with potatoes and cauliflower, spiced with turmeric and cumin.",
//     "preparation_time": 15,
//     "cooking_time": 25,
//     "servings": 4,
//     "calories_per_serving": 180,
//     "protein_g": 5,
//     "carbohydrates_g": 30,
//     "fats_g": 6,
//     "body_type": "normal_weight",
//     "ingredients": [
//       { "name": "Potatoes", "quantity": 200, "unit": "grams" },
//       { "name": "Cauliflower", "quantity": 200, "unit": "grams" },
//       { "name": "Onion", "quantity": 1, "unit": "medium" },
//       { "name": "Tomato", "quantity": 1, "unit": "medium" },
//       { "name": "Turmeric Powder", "quantity": 0.5, "unit": "teaspoon" },
//       { "name": "Cumin Seeds", "quantity": 1, "unit": "teaspoon" },
//       { "name": "Salt", "quantity": 1, "unit": "teaspoon" }
//     ]
//   },
//   {
//     "meal_id": 35,
//     "meal_name": "Vegan Pav Bhaji",
//     "description": "A spicy vegetable mash served with buttered buns, a popular street food.",
//     "preparation_time": 20,
//     "cooking_time": 30,
//     "servings": 4,
//     "calories_per_serving": 350,
//     "protein_g": 7,
//     "carbohydrates_g": 45,
//     "fats_g": 15,
//     "body_type": "over_weight",
//     "ingredients": [
//       { "name": "Potatoes", "quantity": 200, "unit": "grams" },
//       { "name": "Cauliflower", "quantity": 100, "unit": "grams" },
//       { "name": "Peas", "quantity": 50, "unit": "grams" },
//       { "name": "Tomato", "quantity": 2, "unit": "medium" },
//       { "name": "Onion", "quantity": 1, "unit": "medium" },
//       { "name": "Pav Bhaji Masala", "quantity": 2, "unit": "tablespoons" },
//       { "name": "Vegan Butter", "quantity": 2, "unit": "tablespoons" },
//       { "name": "Salt", "quantity": 1, "unit": "teaspoon" }
//     ]
//   },
//   {
//     "meal_id": 36,
//     "meal_name": "Vegan Rajma Chawal",
//     "description": "Kidney bean curry served with steamed rice, a North Indian staple.",
//     "preparation_time": 15,
//     "cooking_time": 30,
//     "servings": 4,
//     "calories_per_serving": 400,
//     "protein_g": 15,
//     "carbohydrates_g": 60,
//     "fats_g": 10,
//     "body_type": "under_weight",
//     "ingredients": [
//       { "name": "Kidney Beans", "quantity": 200, "unit": "grams" },
//       { "name": "Tomato", "quantity": 2, "unit": "medium" },
//       { "name": "Onion", "quantity": 1, "unit": "medium" },
//       { "name": "Garlic", "quantity": 3, "unit": "cloves" },
//       { "name": "Ginger", "quantity": 1, "unit": "inch" },
//       { "name": "Cumin Seeds", "quantity": 1, "unit": "teaspoon" },
//       { "name": "Turmeric Powder", "quantity": 0.5, "unit": "teaspoon" },
//       { "name": "Salt", "quantity": 1, "unit": "teaspoon" }
//     ]
//   },
//   {
//     "meal_id": 37,
//     "meal_name": "Vegan Chole Bhature",
//     "description": "Spicy chickpea curry served with deep-fried bread, a Punjabi favorite.",
//     "preparation_time": 20,
//     "cooking_time": 40,
//     "servings": 4,
//     "calories_per_serving": 500,
//     "protein_g": 12,
//     "carbohydrates_g": 70,
//     "fats_g": 20,
//     "body_type": "normal_weight",
//     "ingredients": [
//       { "name": "Chickpeas", "quantity": 200, "unit": "grams" },
//       { "name": "Tomato", "quantity": 2, "unit": "medium" },
//       { "name": "Onion", "quantity": 1, "unit": "medium" },
//       { "name": "Ginger", "quantity": 1, "unit": "inch" },
//       { "name": "Garlic", "quantity": 3, "unit": "cloves" },
//       { "name": "Chole Masala", "quantity": 2, "unit": "tablespoons" },
//       { "name": "Flour", "quantity": 200, "unit": "grams" },
//       { "name": "Salt", "quantity": 1, "unit": "teaspoon" }
//     ]
//   },
//   {
//     "meal_id": 38,
//     "meal_name": "Vegan Vegetable Pulao",
//     "description": "A one-pot rice dish cooked with mixed vegetables and mild spices.",
//     "preparation_time": 15,
//     "cooking_time": 25,
//     "servings": 4,
//     "calories_per_serving": 300,
//     "protein_g": 6,
//     "carbohydrates_g": 50,
//     "fats_g": 8,
//     "body_type": "over_weight",
//     "ingredients": [
//       { "name": "Basmati Rice", "quantity": 200, "unit": "grams" },
//       { "name": "Mixed Vegetables", "quantity": 150, "unit": "grams" },
//       { "name": "Onion", "quantity": 1, "unit": "medium" },
//       { "name": "Tomato", "quantity": 1, "unit": "medium" },
//       { "name": "Cumin Seeds", "quantity": 1, "unit": "teaspoon" },
//       { "name": "Turmeric Powder", "quantity": 0.5, "unit": "teaspoon" },
//       { "name": "Salt", "quantity": 1, "unit": "teaspoon" }
//     ]
//   },
//   {
//     "meal_id": 39,
//     "meal_name": "Vegan Methi Paratha",
//     "description": "Whole wheat flatbread stuffed with fenugreek leaves, served with vegan yogurt.",
//     "preparation_time": 20,
//     "cooking_time": 15,
//     "servings": 4,
//     "calories_per_serving": 250,
//     "protein_g": 8,
//     "carbohydrates_g": 35,
//     "fats_g": 8,
//     "body_type": "under_weight",
//     "ingredients": [
//       { "name": "Whole Wheat Flour", "quantity": 200, "unit": "grams" },
//       { "name": "Fenugreek Leaves", "quantity": 100, "unit": "grams" },
//       { "name": "Vegan Yogurt", "quantity": 100, "unit": "grams" },
//       { "name": "Salt", "quantity": 1, "unit": "teaspoon" }
//     ]
//   },
//   {
//     "meal_id": 40,
//     "meal_name": "Vegan Vegetable Korma",
//     "description": "A creamy and mildly spiced curry made with mixed vegetables and coconut milk.",
//     "preparation_time": 20,
//     "cooking_time": 30,
//     "servings": 4,
//     "calories_per_serving": 280,
//     "protein_g": 6,
//     "carbohydrates_g": 30,
//     "fats_g": 12,
//     "body_type": "normal_weight",
//     "ingredients": [
//       { "name": "Mixed Vegetables", "quantity": 200, "unit": "grams" },
//       { "name": "Coconut Milk", "quantity": 200, "unit": "ml" },
//       { "name": "Onion", "quantity": 1, "unit": "medium" },
//       { "name": "Tomato", "quantity": 1, "unit": "medium" },
//       { "name": "Cashews", "quantity": 10, "unit": "grams" },
//       { "name": "Turmeric Powder", "quantity": 0.5, "unit": "teaspoon" },
//       { "name": "Salt", "quantity": 1, "unit": "teaspoon" }
//     ]
//   }
// ];

//   // Add each meal to Firestore
//   for (var meal in mealData) {
//     await meals.add(meal).then((value) {
//       print("Meal added with ID: ${value.id}");
//     }).catchError((error) {
//       print("Failed to add meal: $error");
//     });
//   }
// }