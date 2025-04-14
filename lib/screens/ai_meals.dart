import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_suggestion/models/ai_meal_model.dart';
import 'package:diet_suggestion/models/enums.dart';
import 'package:diet_suggestion/screens/map/google_maps.dart';
import 'package:diet_suggestion/services/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AiMeals extends StatefulWidget {
  AiMeals({
    super.key,
    required this.catagories,
    required this.mealType,
    required this.isdibatics,
  });
  final bodyType catagories;
  final bool isdibatics;
  final mealType;


  @override
  State<AiMeals> createState() => _AiMealsState();
}

class _AiMealsState extends State<AiMeals> {
  final _apiService =  ApiService();
  String personType = "";
  String mType = "";
  // final List<AiMealModel> meals = [];
  // Stream<QuerySnapshot<Map<String, dynamic>>>? mealFromDataBase;

  @override
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.deepPurple, title: Text('Meals',style: TextStyle(color: Colors.white),),leading: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back,color: Colors.white,size: 16,)),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<Meals>>(
          future:_apiService.getMeal(dibatics: widget.isdibatics,type: widget.mealType),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
          

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No meals found.'));
            }
           
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final meal = snapshot.data![index];
                return Card(
                  color: Colors.deepPurple,
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      meal.mealName.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                    subtitle: Text("Estimate Prepration Cost: ₹ ${meal.estimatedMakingCost.toString()}",style: TextStyle(color: Colors.white),),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MealDetailScreen(meal: meal),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class MealDetailScreen extends StatelessWidget {
  final Meals meal;

  MealDetailScreen({required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          meal.mealName.toString(),
          style: GoogleFonts.roboto(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              meal.description.toString(),
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text('Preparation Time: ', style: TextStyle(fontSize: 14,fontWeight:FontWeight.w500 )),
                Flexible(
                  child: Text(
                    " ${meal.preparationTime.toString()} minutes",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Cooking Time: ', style: TextStyle(fontSize: 14,fontWeight:FontWeight.w500)),

                Flexible(
                  child: Text(
                    "${meal.mealCookingTime.toString()} minutes",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('Servings: ', style: TextStyle(fontSize: 14,fontWeight:FontWeight.w500)),
                Text('${meal.servings}', style: TextStyle(fontSize: 14)),
              ],
            ),
            Row(
              children: [
                Text('Calories per Serving: ', style: TextStyle(fontSize: 14,fontWeight:FontWeight.w500)),
                Text(
                  '${meal.caloriesPerServing.toString()} kcal',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            Row(
              children: [
                Text('Protein: ', style: TextStyle(fontSize: 14,fontWeight:FontWeight.w500)),
                Text('${meal.proteinG.toString()}g', style: TextStyle(fontSize: 14)),
              ],
            ),
            Row(
              children: [
                Text('Carbohydrates: ', style: TextStyle(fontSize: 14,fontWeight:FontWeight.w500)),
                Text('${meal.carbohydratesG}g', style: TextStyle(fontSize: 14)),
              ],
            ),
            Row(
              children: [
                Text('Fats:', style: TextStyle(fontSize: 14,fontWeight:FontWeight.w500)),
                Text('${meal.fatsG}g', style: TextStyle(fontSize: 14)),
              ],
            ),
           
            SizedBox(height: 16),
            Text(
              'Ingredients:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            _buildIngredientsTable(meal.ingredients),

            SizedBox(height: 8),
                          ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.black,
                      fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.7, 50)),
                  onPressed: () async {
                    
                   Navigator.push(context, MaterialPageRoute(builder: (context) => ShopListScreen()));
                  },
                  child:                      Text(
                        "Top Rated Grocery Store",
                        style: GoogleFonts.alexandria(
                            color: Colors.black, fontSize: 16),
                      ),
                  )
          ],
        ),
      ),
    );
  }

  Widget _buildIngredientsTable(List<Ingredients>? ingredients) {
    print(ingredients![0].ingredientName);
    return  ingredients![0].ingredientName==null?Container(
      child: Center(child: Text("Ingredients not found"),),
    ):Table(
      border: TableBorder.all(color: Colors.grey),
      columnWidths: {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.green[100]),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Ingredient',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Quantity',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: Text(
            //     'Unit',
            //     style: TextStyle(fontWeight: FontWeight.bold),
            //   ),
            // ),
          ],
        ),
        ...ingredients!.map((ingredient) {
          return TableRow(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(ingredient.ingredientName.toString()),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(ingredient.quantity.toString()),
              ),
            
            ],
          );
        }).toList(),
      ],
    );
  }
}

