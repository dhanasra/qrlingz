import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Collection {
  static const String config = 'config';
}

class FirebaseClient {
  
  final firestore = FirebaseFirestore.instance;

  CollectionReference get configDB => firestore.collection(Collection.config);

  Reference get storageReference =>
      FirebaseStorage.instance.ref().child("free");

}