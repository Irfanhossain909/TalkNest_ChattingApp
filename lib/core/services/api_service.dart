import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:talknest/models/user_model.dart';
import 'package:talknest/utils/endpoints.dart';

class ApiServices {
  // Function to register a new user by sending a POST request
  static Future<http.StreamedResponse> register(UserModel data) async {
    // Create a multipart request to send data
    final request = http.MultipartRequest('POST', ApiEndPoints.register);

    // Add form fields to the request
    request.fields.addAll({
      'email': data.email!,           // User's email
      'phone': data.phone!,           // User's phone number
      'password': data.password!,     // User's password
      'name': data.name!,             // User's name
      'date_of_birth': data.dateOfBirth!, // User's date of birth
    });

    // Add the profile picture to the request
    request.files.add(await http.MultipartFile.fromPath(
      'profile_picture', data.profilePicture!, // User's profile picture
    ));

    // Add headers for the request
    request.headers.addAll({
      'Accept' : 'application/json', // Accept JSON response
    });

    // Send the request and return the response
    final response = await request.send();
    return response;
  }

  static Future<http.Response> login (UserModel data) async{
    return await http.post(
      ApiEndPoints.login,
      headers: {
        'Accept' : 'application/json'
      },
      body: data.toLogin(),
    );
  }
}
