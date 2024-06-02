import 'package:flutter_dotenv/flutter_dotenv.dart';
enum Environment { development, staging, production }
class AppConfig{
  AppConfig._();
  static Environment environment = Environment.development;

  static String get apiUrl {
    switch (environment) {
      case Environment.production:
        return 'https://api.production.com';
      case Environment.staging:
        return 'https://api.staging.com';
      case Environment.development:
      default:
        return 'https://api.development.com';
    }
  }
  static final String baseUrl = dotenv.get('BASE_URL', fallback: null);
  static final String sebaSocketUrl = dotenv.get('seba_socket_url', fallback: null);
}