import 'package:web/web.dart' as web;

class CookiesUtils {
  static void setAuthCookie() {
    web.document.cookie =
        'login=true; max-age=3600; path=/; SameSite=Strict; Secure';
  }

  static bool hasAuthCookie() {
    return web.document.cookie.contains('login=true');
  }
}
