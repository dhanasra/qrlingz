import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Collection {
  static const String config = 'config';
  static const String users = 'USERS';
}

class FirebaseClient {
  
  final firestore = FirebaseFirestore.instance;

  CollectionReference get userDB => firestore.collection(Collection.users);

  CollectionReference get configDB => firestore.collection(Collection.config);

  Reference get storageReference =>
      FirebaseStorage.instance.ref().child("free");

  String? get userId => FirebaseAuth.instance.currentUser?.uid;

  logout()async{
    await FirebaseAuth.instance.signOut();
  }

  delete()async{
    await FirebaseAuth.instance.currentUser!.delete();
  }

}