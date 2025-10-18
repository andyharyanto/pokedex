import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  final Dio _dio;

  ApiService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: "https://pokedex.alansantos.dev/api/",
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
          ),
        ) {
    !kReleaseMode ? _dio.interceptors.add(HttpFormatter()) : null;
  }

  Future<dynamic> getList(String path) async {
    try {
      final response = await _dio.get(path);
      return response.data;
    } on DioException catch (e) {
      final message = e.response?.data?['message'] ?? e.message;
      throw Exception(message);
    }
  }

  Future<Map<String, dynamic>> get(String path) async {
    try {
      final response = await _dio.get(path);
      return response.data;
    } on DioException catch (e) {
      final message = e.response?.data?['message'] ?? e.message;
      throw Exception(message);
    }
  }
}
