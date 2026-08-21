import 'package:flutter_dotenv/flutter_dotenv.dart';

enum AppEnv {
  authPass("AUTH_PASSWORD");

  const AppEnv(this.key);

  final String key;
}

class AppEnvUtils {
  static String _get(String key) {
    return dotenv.get(AppEnv.authPass.key, fallback: '');
  }

  static String getAuthPass() {
    return _get(AppEnv.authPass.key);
  }
}
