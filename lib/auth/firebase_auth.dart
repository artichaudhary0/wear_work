import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wear_work/model/user_model.dart';
import 'package:wear_work/utils/extension.dart';

// class AuthRepository {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   void signUp(
//     String email,
//     String password,
//     String cpassword,
//     String userName,
//     BuildContext context,
//   ) async {
//     if (email == "" || password == "" || userName == "") {
//       AppExtension.snackBar(
//         context,
//         "Empty field...Please Enter all fields",
//       );
//     } else if (password != cpassword) {
//       AppExtension.snackBar(
//         context,
//         "password and cpassword does not match",
//       );
//     } else {
//       try {
//         UserCredential user = await _auth.createUserWithEmailAndPassword(
//           email: email,
//           password: password,
//         );
//         if (user.user != null) {
//           Map<String, dynamic> user = {
//             'email': email,
//             'password': password,
//             'userName': userName,
//           };
//           _firestore.collection("users").add(user);
//
//           Navigator.pushNamed(
//             _scaffoldKey.currentContext!,
//             "/jobTypeScreen",
//           );
//         }
//       } on FirebaseAuthException catch (e) {
//         print(e.code.toString());
//         AppExtension.snackBar(
//           context,
//           e.code.toString(),
//         );
//       }
//     }
//   }
//
//   void signIn(String email, String password, BuildContext context) async {
//     if (email == "" || password == "") {
//       AppExtension.snackBar(
//         context,
//         "Enter all fields",
//       );
//     } else {
//       try {
//         UserCredential user = await _auth.signInWithEmailAndPassword(
//           email: email,
//           password: password,
//         );
//         if (user.user != null) {
//           Navigator.pushNamed(
//             context,
//             "/jobTypeScreen",
//           );
//           print(user);
//         }
//       } on FirebaseAuthException catch (e) {
//         AppExtension.snackBar(
//           context,
//           e.code.toString(),
//         );
//       }
//     }
//   }
//

//
//   void saveUserDetails(BuildContext context) async {
//     try {
//       await _firestore.collection("users").doc(_auth.currentUser!.uid);
//       Navigator.pushNamed(context, "/loginScreen");
//     } on FirebaseAuthException catch (e) {
//       AppExtension.snackBar(
//         context,
//         e.code.toString(),
//       );
//     }
//   }
// }

import 'dart:developer' as log;
import 'dart:typed_data';
import 'package:wear_work/utils/storage_method.dart';

import '../model/user_model.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<model.UsersModel> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firebaseFirestore.collection("users").doc(currentUser.uid).get();
    return model.UsersModel.fromSnap(snap);
  }

  Future<void> signOut(BuildContext context) async {
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

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        // registering user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        //calling userModel
        UsersModel userModel = UsersModel(
          uid: cred.user!.uid,
          username: username,
          email: email,
          password: password,
          bio: bio,
          followers: [],
          photoUrl: photoUrl,
          following: [],
        );

        // adding user in our database
        await _firebaseFirestore.collection("users").doc(cred.user!.uid).set(
              userModel.toJson(),
            );

        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (e) {
      log.log("Error during user creation: $e");

      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          res = "Email is already in use.";
        } else if (e.code == 'weak-password') {
          res = "Weak password. Please use a stronger password.";
        } else {
          res = "User creation failed. Please try again later.";
        }
      } else {
        res = "Unexpected error during user creation.";
      }
      return res;
    }
    return res;
  }

  Future<String> signInUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // registering usew2r in auth with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } on FirebaseAuthException catch (e) {
      log.log("Error during user creation: $e");
    }
    return res;
  }
}
