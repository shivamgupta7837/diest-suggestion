import 'package:diet_suggestion/screens/result.dart';
import 'package:diet_suggestion/services/api.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

enum _MealPref { veg, nonveg, vegan }

class _HomePageState extends State<HomePage> {
  bool _isDiabetic = false;
  var _mealType = _MealPref.veg;
  String selectedGender = "Female";
  String heightUnit = "Meter";
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Calculate BMI",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "with AI Meal Planner",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  // Gender Selection
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      genderOption("Male", Icons.male),
                      const SizedBox(width: 10),
                      genderOption("Female", Icons.female),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Age Input
                  inputField("Age", ageController),
                  const SizedBox(height: 10),

                  // Weight Input
                  Row(
                    children: [
                      Expanded(child: inputField("Weight in KG", weightController)),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Height Input
                  Row(
                    children: [
                      Expanded(child: inputField("Height", heightController)),
                      const SizedBox(width: 10),
                      dropdownField(heightUnit, ["Meter", "Ft"], (value) {
                        setState(() => heightUnit = value);
                      }),
                    ],
                  ),

                  SizedBox(
                    height:160,
                    child: ListView(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text("Veg"),
                          leading: Radio<_MealPref>(
                            value: _MealPref.veg,
                            groupValue: _mealType,
                            onChanged: (_MealPref? value) {
                              setState(() {
                                _mealType = value!;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text("Non Veg"),
                          leading: Radio<_MealPref>(
                            value: _MealPref.nonveg,
                            groupValue: _mealType,
                            onChanged: (_MealPref? value) {
                              setState(() {
                                _mealType = value!;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text("Vegan"),
                          leading: Radio<_MealPref>(
                            value: _MealPref.vegan,
                            groupValue: _mealType,
                            onChanged: (_MealPref? value) {
                              setState(() {
                                _mealType = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  CheckboxListTile(
                    value: _isDiabetic, onChanged: (value){
                    setState(() {
                      _isDiabetic = value!;
                    });
                  },
                  title: Text("Dibaetic"),
                  ),
                  SizedBox(height: 50),
                  // Calculate BMI Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 50,
                      ),
                    ),
                    onPressed: () {
                      if(ageController.text.isEmpty || weightController.text.isEmpty || heightController.text.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.deepPurple,
                            content: Text("Please fill all the fields",style: TextStyle(color: Colors.white),),
                          ),
                        );
                        return;
                      }else{
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => BmiResult(
                                heightCtrl: heightController,
                                weightCtrl: weightController,
                                dietPref: _mealType.toString(),
                                isdibatics: _isDiabetic,
                                unit: heightUnit,
                              ),
                        ),
                      );}

                        // final _apiService =  ApiService();
                        // _apiService.getMeal("prompt");
                    },
                    child: const Text(
                      "Calculate your BMI",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget for Gender Selection
  Widget genderOption(String gender, IconData icon) {
    bool isSelected = selectedGender == gender;
    return GestureDetector(
      onTap: () => setState(() => selectedGender = gender),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepPurple : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.grey),
            const SizedBox(width: 5),
            Text(
              gender,
              style: TextStyle(color: isSelected ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for Text Input Field
  Widget inputField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.deepPurpleAccent[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Widget for Dropdown Selection
  Widget dropdownField(
    String value,
    List<String> items,
    Function(String) onChanged,
  ) {
    return DropdownButton<String>(
      value: value,
      onChanged: (newValue) => onChanged(newValue!),
      items:
          items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
    );
  }
}
