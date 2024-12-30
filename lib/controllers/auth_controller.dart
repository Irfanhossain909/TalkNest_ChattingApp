import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talknest/core/services/api_service.dart';
import 'package:talknest/core/services/shared_services.dart';
import 'package:talknest/models/user_model.dart';
import 'package:talknest/view/home/home_screen.dart';

class AuthController extends GetxController {
  // Observable variable to toggle password visibility
  RxBool isSequred = RxBool(true);
  // Observable variable to track loading state
  RxBool isLoading = RxBool(false);
  // Observable user model to hold user data
  var userModel = UserModel().obs;
  // ImagePicker instance to pick images
  final ImagePicker _picker = ImagePicker();
  // Observable variable to store selected image file
  var selectedImage = File('').obs;

  // Method to pick an image from the gallery
  Future<void> pickedImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );
      // If an image is selected, update the observable variable and user model
      if (image != null) {
        selectedImage.value = File(image.path);
        update();
        userModel.value.profilePicture = selectedImage.value.path;
      } else {
        print("No image selected.");
      }
    } catch (e) {
      // Handle errors during image picking
      print("Error picking image: $e");
    }
  }

  // Method to handle user registration
  Future<void> registration() async {
    // Set loading state to true
    isLoading.value = true;

    // Call the API to register the user
    final response = await ApiServices.register(userModel.value);

    // Reset loading state
    isLoading.value = false;
    update();

    // If the response status code is not 200, show an error message
    if (response.statusCode != 200) {
      Get.snackbar('Error', response.reasonPhrase!);
      return;
    }

    // Decode the response stream
    final decode = jsonDecode(await response.stream.bytesToString());

    // Save the token using SharedServices
    await SharedServices.setData(SetType.string, 'token', decode['token']);

    // Navigate to the HomeScreen after successful registration
    Get.offAll(() => HomeScreen());
  }

  Future<void> login() async {
    // Set the loading state to true while the login request is in progress
    isLoading.value = true;

    // Send the login request using the provided user model
    final response = await ApiServices.login(userModel.value);

    // Set the loading state to false once the request is complete
    isLoading.value = false;

    // Decode the response body from JSON
    final decode = jsonDecode(response.body);

    // Check if the response status code is not 200 (indicating an error)
    if (response.statusCode != 200) {
      // Show an error message using a Snackbar if the login failed
      Get.snackbar('Error', decode['message']);
    }

    // Save the token returned by the API to shared preferences for later use
    await SharedServices.setData(SetType.string, 'token', decode['token']);

    // Navigate to the HomeScreen after successful login
    Get.offAll(() => HomeScreen());
  }

}
