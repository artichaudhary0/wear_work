import 'package:cloud_firestore/cloud_firestore.dart';

class UserPost {
  final String description;
  final String uid;
  final String username;
  final String postId;
  final DateTime datePublish;
  final String photoUrl;
  final String profileImage;
  final likes;

  UserPost({
    required this.description,
    required this.uid,
    required this.username,
    required this.postId,
    required this.datePublish,
    required this.photoUrl,
    required this.profileImage,
    required this.likes,
  });

  Map<String, dynamic> toJson() => {
        "description": description,
        "uid": uid,
        "username": username,
        "postId": postId,
        'likes': likes,
        "datePublish": datePublish,
        "photoUrl": photoUrl,
        "profileImage": profileImage,
      };
  static UserPost fromSnap(DocumentSnapshot snap) {
    var snapShot = snap.data() as Map<String, dynamic>;
    return UserPost(
      description: snapShot['description'],
      uid: snapShot['uid'],
      likes: snapShot["likes"],
      username: snapShot['username'],
      postId: snapShot['postId'],
      datePublish: snapShot['datePublish'],
      photoUrl: snapShot['photoUrl'],
      profileImage: snapShot['profileImage'],
    );
  }
}
