import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Collection {
  static const String config = 'config';
  static const String users = 'USERS';
  static const String qrsInfo = 'QRCODE';
  static const String history = 'HISTORY';
  static const String favourites = 'FAVOURITES';
}

class FirebaseClient {
  
  final firestore = FirebaseFirestore.instance;

  CollectionReference get userDB => firestore.collection(Collection.users);
  CollectionReference get historyDB => firestore.collection(Collection.history);
  CollectionReference get favouritesDB => firestore.collection(Collection.favourites);
  CollectionReference get qrsInfoDB => firestore.collection(Collection.qrsInfo);

  CollectionReference get configDB => firestore.collection(Collection.config);

  Reference get storageReference =>
      FirebaseStorage.instance.ref().child("free");
  
  Reference get myQRStorageRef =>
      FirebaseStorage.instance.ref().child("users").child(FirebaseAuth.instance.currentUser!.uid).child("QR");

  String? get userId => FirebaseAuth.instance.currentUser?.uid;

  logout()async{
    await FirebaseAuth.instance.signOut();
  }

  delete()async{
    await FirebaseAuth.instance.currentUser!.delete();
  }

}