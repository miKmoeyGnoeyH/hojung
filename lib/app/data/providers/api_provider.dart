import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiProvider {
  final String baseUrl = dotenv.get('API_BASEURL');
}