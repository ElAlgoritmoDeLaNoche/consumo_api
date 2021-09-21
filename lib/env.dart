import 'package:flutter_dotenv/flutter_dotenv.dart';
// api_url viene de .env

class Env {
  String API_URL = env['api_url'];
}
