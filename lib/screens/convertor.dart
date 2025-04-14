// import 'package:flutter/material.dart';

// class Convertor extends StatefulWidget {
//   const Convertor({super.key});

//   @override
//   State<Convertor> createState() => _ConvertorState();
// }

// class _ConvertorState extends State<Convertor> {
//   @override
//   TextEditingController heightController = TextEditingController();
//   TextEditingController result = TextEditingController();
//   Widget build(BuildContext context) {
//     footToMeter() {
//      final height =  heightController;
//      final meter =  double.parse(height.text) * 0.3048;
//      result.text = meter.toString();

//   }
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         centerTitle: true,
//         title: Text("Convertor",style: TextStyle(color: Colors.black),),
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back,color: Colors.black,),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 8),
//               const Text(
//                 "Enter Your Details",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontStyle: FontStyle.italic,
//                     fontSize: 24),
//               ),
//            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
//            Padding(
//             padding: const EdgeInsets.only(left: 25.0, right: 30),
//             child: TextField(
//               controller: heightController,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 label: Text("Enter height in feet"),
//                   hintText: "Enter your height ",
//                   border: OutlineInputBorder()),
//             ),
//           ),
//            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
//           Padding(
//             padding: const EdgeInsets.only(left: 25.0, right: 30),
//             child: TextField(
//               enabled: false,
//                readOnly: true,
//               controller: result,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                   hintText: "Result is ", border: OutlineInputBorder()),
//             ),
//           ),
//            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
//          SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.88,
//                 height: MediaQuery.of(context).size.height * 0.06,
//                 child: ElevatedButton(
//                   onPressed: () {
//                       footToMeter();
//                   },
//                   style: ElevatedButton.styleFrom(
//                       elevation: 8),
//                   child: const Text(
//                     "Check your BMI",
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ),
//               ),
//         ],
//       ),
//     );
//   }
// }
