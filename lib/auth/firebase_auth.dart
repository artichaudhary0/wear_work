import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wear_work/utils/extension.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void signUp(
    String email,
    String password,
    String cpassword,
    String userName,
    BuildContext context,
  ) async {
    if (email == "" || password == "" || userName == "") {
      AppExtension.snackBar(
        context,
        "Empty field...Please Enter all fields",
      );
    } else if (password != cpassword) {
      AppExtension.snackBar(
        context,
        "password and cpassword does not match",
      );
    } else {
      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (user.user != null) {
          Map<String, dynamic> user = {
            'email': email,
            'password': password,
            'userName': userName,
          };
          _firestore.collection("users").add(user);

          Navigator.pushNamed(
            _scaffoldKey.currentContext!,
            "/jobTypeScreen",
          );
        }
      } on FirebaseAuthException catch (e) {
        print(e.code.toString());
        AppExtension.snackBar(
          context,
          e.code.toString(),
        );
      }
    }
  }

  void signIn(String email, String password, BuildContext context) async {
    if (email == "" || password == "") {
      AppExtension.snackBar(
        context,
        "Enter all fields",
      );
    } else {
      try {
        UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (user.user != null) {
          Navigator.pushNamed(
            context,
            "/jobTypeScreen",
          );
          print(user);
        }
      } on FirebaseAuthException catch (e) {
        AppExtension.snackBar(
          context,
          e.code.toString(),
        );
      }
    }
  }

  void signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      Navigator.pushNamed(context, "/loginScreen");
    } on FirebaseAuthException catch (e) {
      AppExtension.snackBar(
        context,
        e.code.toString(),
      );
    }
  }

  void saveUserDetails(BuildContext context) async {
    try {
      await _firestore.collection("users").doc(_auth.currentUser!.uid);
      Navigator.pushNamed(context, "/loginScreen");
    } on FirebaseAuthException catch (e) {
      AppExtension.snackBar(
        context,
        e.code.toString(),
      );
    }
  }
}
