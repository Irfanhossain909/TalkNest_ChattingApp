import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talknest/models/user_model.dart';

class AuthController extends GetxController {
  RxBool isSequred = RxBool(true);
  var userModel = UserModel().obs;
  final ImagePicker _picker = ImagePicker();
  var selectedImage = File('').obs;

  Future<void> pickedImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );
      if (image != null) {
        selectedImage.value = File(image.path);
        update();
        userModel.value.profilePicture = selectedImage.value.path;
      } else {
        print("No image selected.");
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }
}
