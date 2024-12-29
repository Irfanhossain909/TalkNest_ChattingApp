import 'package:talknest/utils/config.dart';

class ApiEndPoints {
  static String apiUrl = '${AppConfig.baseUrl}/api';
  static Uri register = Uri.parse('$apiUrl/register');
  static Uri login = Uri.parse('$apiUrl/login');
}