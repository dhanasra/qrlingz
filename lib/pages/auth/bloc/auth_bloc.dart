import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../network/firebase_client.dart';
import '../../../network/models/user_data.dart';
import '../../../utils/global.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignupEvent>(_onSignup);
    on<LoginEvent>(_onLogin);
    on<GoogleLoginEvent>(_onGoogleLogin);
    on<GithubLoginEvent>(_onGithubLogin);
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseClient _client = FirebaseClient();
  
  _onSignup(SignupEvent event, Emitter emit)async{
    try{
      emit(Loading());
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password
      );
      var userId = userCredential.user!.uid;
      var data = {
        "id": userId,
        "firstName": event.fname,
        "lastName": event.lname,
        "email": event.email
      };
      await _client.userDB.doc(userId).set(data);
      Global.user = UserData.fromMap(data);
      
      emit(Success());
    }catch(e){
      if(e is FirebaseAuthException){
        emit(Error(msg: e.message));
        return;
      }

      emit(Error(msg: "Something went wrong! Try again later"));
    }
  }

  _onLogin(LoginEvent event, Emitter emit)async{
    try{
      emit(Loading());
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password
      );
      var userId = userCredential.user?.uid;
      var data = (await _client.userDB.doc(userId).get()).data();
      Global.user = UserData.fromMap(data);
      emit(Success());
    }catch(e){
      if(e is FirebaseAuthException){
        emit(Error(msg: e.message));
        return;
      }

      emit(Error(msg: "Something went wrong! Try again later"));
    }
  }

  _onGoogleLogin(GoogleLoginEvent event, Emitter emit)async{
    try{
      emit(Loading());
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential? userCred = await FirebaseAuth.instance.signInWithCredential(credential);
      var user = userCred.user!;

      var userRef = await _client.userDB.doc(user.uid).get();

      if(userRef.exists){
        Global.user = UserData.fromMap(userRef.data());
      }else{
        var names = user.displayName?.split(" ");
        var fname = names!=null && names.isNotEmpty ? names[0]: "Guest";
        var lname = names!=null && names.length>1 ? names[1]: "";

        var data = {
          "id": user.uid,
          "firstName": fname,
          "lastName": lname,
          "email": user.email,
          "picture": userCred.additionalUserInfo?.profile?["picture"]
        };
        await _client.userDB.doc(user.uid).set(data);
        Global.user = UserData.fromMap(data);
      }
      emit(Success());
    }catch(e){
      emit(Error());
    }
  }

  _onGithubLogin(GithubLoginEvent event, Emitter emit)async{
    try{
      emit(Loading());

      GithubAuthProvider githubProvider = GithubAuthProvider();

      UserCredential? userCred = await FirebaseAuth.instance.signInWithProvider(githubProvider);
      var user = userCred.user!;

      var userRef = await _client.userDB.doc(user.uid).get();

      if(userRef.exists){
        Global.user = UserData.fromMap(userRef.data());
      }else{
        var names = user.displayName?.split(" ");
        var fname = names!=null && names.isNotEmpty ? names[0]: "Guest";
        var lname = names!=null && names.length>1 ? names[1]: "";

        var data = {
          "id": user.uid,
          "firstName": fname,
          "lastName": lname,
          "email": user.email,
          "picture": userCred.additionalUserInfo?.profile?["picture"]
        };
        await _client.userDB.doc(user.uid).set(data);
        Global.user = UserData.fromMap(data);
      }
      emit(Success());
    }catch(e){
      emit(Error());
    }
  }

}
