import 'package:app/config/router.dart';
import 'package:app/utils/env.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiClient {
  final String _baseUrl = 'http://localhost:8001/api';

  late final Dio _dio;

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        responseType: ResponseType.json,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'X-API-Password': AppEnvUtils.getApiPass(),
        },
      ),
    );
  }

  void _showErrorDialog(String message) {
    final BuildContext? context = navigatorKey.currentContext;
    if (context == null) return;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Icon(Icons.error_outline, color: Colors.red),
          content: Text(message),
        );
      },
    );
  }

  void _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        _showErrorDialog('Connection timeout with the server.');
        break;
      case DioExceptionType.receiveTimeout:
        _showErrorDialog('Receive timeout in connection with the server.');
        break;
      case DioExceptionType.badResponse:
        _showErrorDialog(
          'Unexpected server response: ${error.response?.statusCode}',
        );
        break;
      case DioExceptionType.cancel:
        _showErrorDialog('Request to the server was cancelled.');
        break;
      default:
        _showErrorDialog('Something went wrong. Please try again.');
    }
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }
}
