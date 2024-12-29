import 'package:http/http.dart' as http;
import 'package:talknest/models/user_model.dart';
import 'package:talknest/utils/endpoints.dart';

class ApiServices {
  static Future<http.StreamedResponse> register(UserModel data) async {
    final request = http.MultipartRequest('POST', ApiEndPoints.register);
    request.fields.addAll({
      'email': data.email!,
      'phone': data.phone!,
      'password': data.password!,
      'name': data.name!,
      'date_of_birth': data.dateOfBirth!,
    });

    request.files.add(await http.MultipartFile.fromPath(
        'profile_picture', data.profilePicture!),);

    request.headers.addAll({
      'Accept' : 'application/json',
    });

    final response = await request.send();
    return response;
  }

}