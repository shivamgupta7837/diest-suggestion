import 'package:diet_suggestion/home.dart';
import 'package:diet_suggestion/models/enums.dart';
import 'package:diet_suggestion/screens/ai_meals.dart';
import 'package:diet_suggestion/screens/choose_gender.dart';
import 'package:diet_suggestion/screens/convertor.dart';
import 'package:flutter/material.dart';

class BmiResult extends StatefulWidget {
  BmiResult({
    super.key,
    required this.unit,
    required this.heightCtrl,
    required this.weightCtrl,
    required this.dietPref,
    required this.isdibatics,
  });
  final String unit;
  String dietPref = "";
  bool isdibatics = false;

  var heightCtrl = TextEditingController();

  var weightCtrl = TextEditingController();

  @override
  State<BmiResult> createState() => _BmiResultState();
}

class _BmiResultState extends State<BmiResult> {
  bodyType bType = bodyType.normal_weight;

  double footToMeter() {
    return double.parse(widget.heightCtrl.text) * 0.3048;
  }

  double result = 0.0;

  @override
  void initState() {
    calculateBmi();
    super.initState();
  }

  calculateBmi() {
    if (widget.unit == "Meter") {
      final height = footToMeter();
      final weight = widget.weightCtrl;
      result = double.parse(weight.text) / (height * height).round();
    } else {
      final height = footToMeter();
      final weight = widget.weightCtrl;
      result = double.parse(weight.text) / (height * height).round();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/health.png", height: 250),
              SizedBox(
          
                height: MediaQuery.of(context).size.height * 0.12),
              Text(
                "BMI = ${result.toStringAsPrecision(2)} Kg/m^2",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: FittedBox(
                  child: Container(
                    child: Text(
                      bmi(result.toDouble()),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize:    18,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => AiMeals(
                            catagories: bType,
                            mealType: widget.dietPref,
                            isdibatics: widget.isdibatics,
                          ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Get Diet Suggestion',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Recheck BMI',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String bmi(var result) {
    if (result < 18.5) {
      bType = bodyType.under_weight;
      return "You are under weight, Normal BMI weight range \n between 18.5 - 24.9";
    } else if (result == 18.5 || result < 24.9 || result == 24.9) {
      bType = bodyType.normal_weight;
      return "Your BMI is normal";
    } else if (result == 24.9 || result < 29.9) {
      bType = bodyType.over_weight;
      return "You are over weight, Normal BMI weight range \n betwee 18.5 - 24.9";
    } else if (result > 30) {
      bType = bodyType.over_weight;
      return "Obesity \n Normal BMI weight range between 18.5 - 24.9";
    }
    return "Something went wrong";
  }
}
