import 'package:flutter_dotenv/flutter_dotenv.dart';

class GoogleApiKeys {
  static final String iOS = env['iOSGoogleApiKey'];
  static final String android = env['AndroidGoogleApiKey'];
}
