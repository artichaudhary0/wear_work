import 'package:flutter/foundation.dart';
import 'package:wear_work/auth/firebase_auth.dart';
import 'package:wear_work/model/user_model.dart';

class UserProvider with ChangeNotifier {
  UsersModel? _userModel;
  UsersModel get getUser => _userModel!;

  Future<void> refreshUser() async {
    UsersModel user = await AuthMethods().getUserDetails();
    _userModel = user;
    notifyListeners();
  }
}
