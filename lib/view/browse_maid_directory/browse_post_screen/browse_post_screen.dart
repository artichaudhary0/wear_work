import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:wear_work/auth/firestore.dart';
import 'package:wear_work/utils/extension.dart';

import '../../../controller/provider.dart';
import '../../../model/user_model.dart' as model;

class BrowsePostScreen extends StatefulWidget {
  const BrowsePostScreen({super.key});

  @override
  State<BrowsePostScreen> createState() => _BrowsePostScreenState();
}

class _BrowsePostScreenState extends State<BrowsePostScreen> {
  TextEditingController descriptionController = TextEditingController();
  Uint8List? _file;
  _selectImage(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text("Create a Post"),
          children: [
            SimpleDialogOption(
              padding: const EdgeInsets.all(
                20,
              ),
              child: const Text("Take a Photo"),
              onPressed: () async {
                Navigator.pop(context);
                Uint8List file = await AppExtension.pickedImage(
                    imageSource: ImageSource.camera);
                setState(() {
                  _file = file;
                });
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(
                20,
              ),
              child: const Text("Choose From Gallery"),
              onPressed: () async {
                Navigator.pop(context);
                Uint8List file = await AppExtension.pickedImage(
                    imageSource: ImageSource.gallery);
                setState(() {
                  _file = file;
                });
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(
                20,
              ),
              child: const Text("Cancel"),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void postImage(
    String uId,
    String userName,
    String profileImage,
  ) async {
    try {
      String postId = const Uuid().v1();
      String res = await FirebaseMethod().uploadPost(
        descriptionController.text,
        _file!,
        uId,
        userName,
        profileImage
      );
      if (res == "success") {
        AppExtension.snackBar(
          context,
          "Posted",
        );
        clearImage();
      } else {
        print("hellgoooo");
        AppExtension.snackBar(
          context,
          res,
        );
      }
    } catch (error) {
      print("fail");
      AppExtension.snackBar(
        context,
        error.toString(),
      );
    }
  }

  void clearImage() {
    setState(() {
      _file = null;
      descriptionController.clear();
    });
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    return _file == null
        ? IconButton(
            onPressed: () {
              _selectImage(context);
            },
            icon: const Icon(Icons.upload))
        : Scaffold(
            appBar: AppBar(
              title: const Text('Post To'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: clearImage,
              ),
              actions: [
                TextButton(
                  onPressed: () => postImage(
                    userProvider.getUser.uid,
                    userProvider.getUser.username,
                    userProvider.getUser.photoUrl,
                  ),
                  child: const Text("Post"),
                )
              ],
            ),
            body: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: AspectRatio(
                        aspectRatio: 487 / 451,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: MemoryImage(_file!),
                              fit: BoxFit.fill,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: TextField(
                        controller: descriptionController,
                        decoration: const InputDecoration(
                          hintText: "Write a caption...",
                          border: InputBorder.none,
                        ),
                        maxLines: 8,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
  }
}
