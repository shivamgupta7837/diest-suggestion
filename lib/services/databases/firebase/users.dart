import 'package:cloud_firestore/cloud_firestore.dart';

class MyFireStore{
  final CollectionReference _groceriesObj =
      FirebaseFirestore.instance.collection("users");
}