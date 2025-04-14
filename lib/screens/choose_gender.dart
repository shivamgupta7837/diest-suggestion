// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'check_bmi.dart';

// class ChooseGender extends StatelessWidget {
//   String manAvatar = 'assets/images/maleAvatar.json';
//   String womanAvatar = 'assets/images/womanAvatar.json';
//   String otherAvatar = 'assets/images/others.png';
//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: false,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: Colors.white,
//           elevation: 0,
//           // centerTitle: true,
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               Text(
//                 "SELECT YOUR ",
//                 style: TextStyle(
//                     color: Colors.black54,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 22),
//               ),
//               Text(
//                 "GENDER",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 22),
//               ),
//             ],
//           ),
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             male(context),
//             female(context),
//             others(context),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget male(BuildContext context) {
//     return GestureDetector(
//       child: Container(
//           margin: const EdgeInsets.only(left: 80, top: 20, bottom: 10),
//           height: MediaQuery.of(context).size.height * 0.25,
//           width: MediaQuery.of(context).size.width * 0.60,
//           decoration: const BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black54,
//                   offset: Offset(3.0, 2.0),
//                   blurRadius: 7.0,
//                 )
//               ],
//               borderRadius: BorderRadius.all(Radius.circular(30)),
//               color: Colors.white),
//           child: Column(
//             children: [
//               Container(height: 160, child: Lottie.asset(manAvatar)),
//                SizedBox(height: MediaQuery.of(context).size.height * 0.006),
//               const Text("Male",
//                   style: TextStyle(
//                       fontSize: 27,
//                       color: Colors.black,poljiukhnjbnbj m
//                       fontWeight: FontWeight.w500,
//                       fontStyle: FontStyle.italic))
//             ],
//           )),
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) =>
//                     CheckBmi(maleAvatar: manAvatar, isMale: true)));
//       },
//     );
//   }

//   Widget female(BuildContext context) {
//     return GestureDetector(
//         child: Container(
//             margin: const EdgeInsets.only(left: 80, top: 20, bottom: 8),
//             height: MediaQuery.of(context).size.height * 0.25,
//             width: MediaQuery.of(context).size.width * 0.60,
//             decoration: const BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black54,
//                     offset: const Offset(3.0, 2.0),
//                     blurRadius: 7.0,
//                   )
//                 ],
//                 borderRadius: BorderRadius.all(Radius.circular(30)),
//                 color: Colors.white),
//             child: Column(
//               children: [
//                 SizedBox(height: 160, child: Lottie.asset(womanAvatar)),
//                   SizedBox(height: MediaQuery.of(context).size.height * 0.006),
//                 const Text("Female",
//                     style: TextStyle(
//                         fontSize: 27,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w500,
//                         fontStyle: FontStyle.italic))
//               ],
//             )),
//         onTap: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) =>
//                       CheckBmi(femaleAvatar: womanAvatar, isFemale: true)));
//         });
//   }

//   Widget others(BuildContext context) {
//     return GestureDetector(
//       child: Container(
//           margin: const EdgeInsets.only(left: 80, top: 20, bottom: 8),
//           height: MediaQuery.of(context).size.height * 0.25,
//           width: MediaQuery.of(context).size.width * 0.60,
//           decoration: const BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black54,
//                   offset: Offset(3.0, 2.0),
//                   blurRadius: 7.0,
//                 )
//               ],
//               borderRadius: BorderRadius.all(Radius.circular(30)),
//               color: Colors.white),
//           child: Column(
//             children: [
//               Container(
//                   margin: const EdgeInsets.only(top: 22),
//                   height: 120,
//                   child: Image.asset(otherAvatar)),
//              SizedBox(height: MediaQuery.of(context).size.height * 0.006),
//   SizedBox(height: MediaQuery.of(context).size.height * 0.02),
//               const Text("Others",
//                   style: TextStyle(
//                       fontSize: 27,
//                       color: Colors.black,
//                       fontWeight: FontWeight.w500,
//                       fontStyle: FontStyle.italic))
//             ],
//           )),
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) =>
//                     CheckBmi(otherAvatar: otherAvatar, isOther: true)));
//       },
//     );
//   }
// }
