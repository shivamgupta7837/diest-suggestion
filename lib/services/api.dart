import 'dart:convert';
import 'package:diet_suggestion/models/ai_meal_model.dart';
import 'package:http/http.dart' as http;

class ApiService {

Future<List<Meals>> getMeal({required bool dibatics,required String type}) async {
  var headers = {
    'Content-Type': 'application/json',
  };
  var request = http.Request(
    'POST',
    Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyCVHALKeotR4oZlbGp6C-OooMih-CpuXz8', // Replace YOUR_API_KEY
    ),
  );
  request.body = json.encode({
    "contents": [
      {
        "parts": [
          {
            "text":
               dibatics==true? "Generate a JSON array containing 10 $type Indian meal objects. Each object should have the following keys: 'mealId' (unique integer), 'mealName' (string), 'ingredients' (array of strings), and 'estimatedMakingCost' (float, representing the cost in INR). The meals should be common and varied across Indian regional cuisines and person have dibaties and name of list should be meal and also i need preparationTime,servings,caloriesPerServing,proteinG, carbohydratesG,fatsG.in indigriudent list there shiuld be quantity (kg),indigrident name and units also and description of meal should be there along with  meal cooking time.":"Generate a JSON array containing 10 $type Indian meal objects. Each object should have the following keys: 'mealId' (unique integer), 'mealName' (string), 'ingredients' (array of strings), and 'estimatedMakingCost' (float, representing the cost in INR). The meals should be common and varied across Indian regional cuisines name of list should be meal and also i need preparationTime,servings,caloriesPerServing,proteinG, carbohydratesG,fatsG.in indigriudent list there shiuld be quantity (kg),indigrident name and units also and description of meal should be there along with  meal cooking time.",
          },
        ],
      },
    ],
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    String responseBody = await response.stream.bytesToString();
    try {
      Map<String, dynamic> jsonData = json.decode(responseBody);
      List<dynamic> candidates = jsonData['candidates'];

      if (candidates.isNotEmpty) {
        Map<String, dynamic> firstCandidate = candidates[0];
        Map<String, dynamic> content = firstCandidate['content'];
        List<dynamic> parts = content['parts'];

        if (parts.isNotEmpty) {
          Map<String, dynamic> firstPart = parts[0];
          String text = firstPart['text'];

          // Extract the JSON part from the text string.
          int startIndex = text.indexOf('```json\n');
          int endIndex = text.lastIndexOf('\n```');
          if (startIndex != -1 && endIndex != -1) {
            String jsonContent = text.substring(startIndex + 8, endIndex); // 8 is the length of ```json\n
            Map<String, dynamic> mealData = json.decode(jsonContent);

            List meals = mealData['meal']??[];
            print(meals);
            if (meals.isNotEmpty) {
              Map<String, dynamic> meal = meals[0];
            //  print(meals);
              List<Meals> mealData = [];
            
          for (var i = 0; i < meals.length; i++) {

            mealData.add(Meals.fromJson(meals[i]));
          }

     return mealData;
            } else {
              print('No meals found in the JSON.');
            }
          } else {
            print('Could not extract JSON content.');
          }
        } else {
          print('No parts found in the content.');
        }
      } else {
        print('No candidates found in the JSON.');
      }
    } catch (e) {
      print('Error parsing JSON: $e');
      print('Response Body: $responseBody'); //Print the response if parsing fails.
    }
  } else {
    print('Request failed with status: ${response.statusCode}');
    String responseBody = await response.stream.bytesToString();
    print('Response Body: $responseBody');
  }
  return [];
}
}

void get() {}
