import 'package:dio/dio.dart';

class DioBooleanNormalizerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.data is FormData) {
      final FormData formData = options.data;
      final fields = formData.fields;

      for (int i = 0; i < fields.length; i++) {
        final value = fields[i].value;
        if (value == 'true') {
          fields[i] = MapEntry(fields[i].key, '1');
        } else if (value == 'false') {
          fields[i] = MapEntry(fields[i].key, '0');
        }
      }
    } else if (options.data is Map<String, dynamic>) {
      options.data = _normalizeMap(options.data as Map<String, dynamic>);
    }

    super.onRequest(options, handler);
  }

  // Recursive helper to sanitize maps if you ever switch to JSON payloads
  Map<String, dynamic> _normalizeMap(Map<String, dynamic> map) {
    return map.map((key, value) {
      if (value is bool) {
        return MapEntry(key, value ? 1 : 0);
      } else if (value is Map<String, dynamic>) {
        return MapEntry(key, _normalizeMap(value));
      } else if (value is List) {
        return MapEntry(
          key,
          value.map((item) {
            if (item is Map<String, dynamic>) return _normalizeMap(item);
            if (item is bool) return item ? 1 : 0;
            return item;
          }).toList(),
        );
      }
      return MapEntry(key, value);
    });
  }
}
