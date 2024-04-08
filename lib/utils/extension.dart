import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AppExtension{

  static snackBar(BuildContext context,String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue.shade100,
        content: Text(
          message.toUpperCase(),
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
 static pickedImage({required ImageSource imageSource}) async {
    ImagePicker _picker = ImagePicker();

    final XFile? picked = await _picker.pickImage(
      source: imageSource,
    );
    if (picked != null) {
      return await picked.readAsBytes();
    } else {
      print("No image is selected");
    }
  }


}