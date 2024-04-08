import 'package:cloud_firestore/cloud_firestore.dart';

class UsersModel{
  final String uid;
  final String username;
  final String email;
  final String password;
  final String bio;
  final List followers;
  final List following;
  final String photoUrl;

  UsersModel({
    required this.uid,
    required this.username,
    required this.email,
    required this.password,
    required this.bio,
    required this.followers,
    required this.following,
    required this.photoUrl,
  });

  Map<String,dynamic> toJson() =>
      {
        "uid":uid,
        "username" : username,
        "email" : email,
        "password" : password,
        "bio" : bio,
        "followers" : followers,
        "following" : following,
        "photoUrl" : photoUrl,
      };
  static UsersModel fromSnap(DocumentSnapshot snap){
    var snapShot = snap.data() as Map<String, dynamic>;
    return UsersModel(
      uid: snapShot['uid'],
      username: snapShot['username'],
      email: snapShot['email'],
      password: snapShot['password'],
      bio: snapShot['bio'],
      followers: snapShot['followers'],
      following: snapShot['following'],
      photoUrl: snapShot['photoUrl'],
    );
  }

}