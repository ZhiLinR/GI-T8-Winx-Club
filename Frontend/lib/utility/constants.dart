import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String baseUrl = dotenv.env['NETWORK'].toString();
  static String accountEndpoint = '/api/accounts';
  static String itemEndpoint = '/api/items';
  static String taskEndpoint = '/api/tasks';
}
