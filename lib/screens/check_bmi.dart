// import 'package:diet_suggestion/screens/convertor.dart';
// import 'package:diet_suggestion/screens/result.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// class CheckBmi extends StatefulWidget {
//   String? maleAvatar;
//   String? femaleAvatar;
//   String? otherAvatar;
//   bool? isMale;
//   bool? isFemale;
//   bool? isOther;
//   CheckBmi({
//     this.maleAvatar,
//     this.femaleAvatar,
//     this.otherAvatar,
//     this.isMale,
//     this.isFemale,
//     this.isOther,
//   });

//   @override
//   State<CheckBmi> createState() => _CheckBmiState();
// }

// class _CheckBmiState extends State<CheckBmi> {
//   final _formKey = GlobalKey<FormState>();

//   final heightController = TextEditingController();
//   final weightController = TextEditingController();

//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     heightController.dispose();
//     weightController.dispose();
//     super.dispose();
//   }

//   String _dietPreference = "Veg";
//   bool _isDiabetic = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//         title: const Text(
//           "Bmi Calculator",
//           style: TextStyle(
//             color: Colors.black,
//             fontStyle: FontStyle.italic,
//             fontSize: 24,
//           ),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               Container(
//                 // height: isOther==false ? 200 : MediaQuery.of(context).size.height * 0.3,
//                 height: MediaQuery.of(context).size.height * 0.25,
//                 margin: EdgeInsets.only(bottom: 20),
//                 child: checkMaleOrFeamle(),
//               ),
//               const Text(
//                 "Enter Your Details",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontStyle: FontStyle.italic,
//                   fontSize: 24,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.only(left: 25.0, right: 30),
//                 child: TextFormField(
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Enter Your Height";
//                     }
//                   },
//                   controller: heightController,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(
//                     hintText: "Enter your height in meters",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.only(left: 25.0, right: 30),
//                 child: TextFormField(
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Enter Your weight ";
//                     }
//                   },
//                   controller: weightController,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(
//                     hintText: "Enter your weight in Kg",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 15),
//               Padding(
//                 padding: const EdgeInsets.only(left: 25.0, right: 30),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: ExpansionTile(
//                     title: const Text("Diet Preference"),
//                     children: <Widget>[
//                       ListTile(
//                         title: const Text("Veg"),
//                         leading: Radio(
//                           value: "Veg",
//                           groupValue: _dietPreference,
//                           onChanged: (value) {
//                             setState(() {
//                               _dietPreference = value.toString();
//                             });
//                             print(_dietPreference);
//                           },
//                         ),
//                       ),
//                       ListTile(
//                         title: const Text("Non-Veg"),
//                         leading: Radio(
//                           value: "Non-Veg",
//                           groupValue: _dietPreference,
//                           onChanged: (value) {
//                             setState(() {
//                               _dietPreference = value.toString();
//                             });
//                             print(_dietPreference);
//                           },
//                         ),
//                       ),
//                       ListTile(
//                         title: const Text("Vegan"),
//                         leading: Radio(
//                           value: "Vegan",
//                           groupValue: _dietPreference,
//                           onChanged: (value) {
//                             setState(() {
//                               _dietPreference = value.toString();
//                             });
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 15),
//               Padding(
//                 padding: const EdgeInsets.only(left: 25.0, right: 30),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: CheckboxListTile(
//                     title: const Text("Are you diabetic?"),
//                     value: _isDiabetic,
//                     onChanged: (bool? value) {
//                       setState(() {
//                         _isDiabetic = value!;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.88,
//                 height: MediaQuery.of(context).size.height * 0.06,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     TextEditingController height = heightController;
//                     TextEditingController weight = weightController;
//                     final isFormValid = _formKey.currentState!.validate();
//                     if (isFormValid) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder:
//                               (context) => BmiResult(
//                                 height: height,
//                                 weight: weight,
//                                 dietPref: _dietPreference,
//                                 isdibatics: _isDiabetic,
//                               ),
//                         ),
//                       );
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(elevation: 8,backgroundColor: Colors.blue[900]),
//                   child: const Text(
//                     "Check your BMI",
//                     style: TextStyle(fontSize: 20,color: Colors.white),
//                   ),
//                 ),
//               ),

//               SizedBox(height: 70),
//               GestureDetector(
//                 child: const Text(
//                   "Don't know your height in meters ?",
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontStyle: FontStyle.italic,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 onTap:
//                     () => Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => Convertor()),
//                     ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   dynamic checkMaleOrFeamle() {
//     if (widget.isMale == true) {
//       return Lottie.asset(widget.maleAvatar!);
//     } else if (widget.isFemale == true) {
//       return Lottie.asset(widget.femaleAvatar!);
//     }
//     return Image.asset(widget.otherAvatar!);
//   }
// }
