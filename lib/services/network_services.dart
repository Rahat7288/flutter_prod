import 'dart:async';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  late Dio dio;
  String baseUrl = "https://api.example.com";

  ApiService() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? token = prefs.getString('accessToken');
        if (token != null) {
          options.headers["Authorization"] = "Bearer $token";
        }
        return handler.next(options);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          bool success = await _refreshToken();
          if (success) {
            RequestOptions requestOptions = e.requestOptions;
            return handler.resolve(await _retry(requestOptions));
          }
        }
        return handler.next(e);
      },
    ));
  }

  /// Function to refresh the token
  Future<bool> _refreshToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? refreshToken = prefs.getString('refreshToken');

      if (refreshToken == null) return false;

      var response =
          await dio.post('/auth/refresh', data: {'refreshToken': refreshToken});

      if (response.statusCode == 200) {
        String newAccessToken = response.data['accessToken']?.toString() ?? "";
        await prefs.setString('accessToken', newAccessToken);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  /// Retries the request after a successful token refresh
  Future<Response> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  /// 🚀 **GET request with optional query parameters**
  Future<Response> get(String endpoint, {Map<String, dynamic>? params}) async {
    try {
      Response response = await dio.get(endpoint, queryParameters: params);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// 🚀 **POST request with request body**
  Future<Response> post(String endpoint, dynamic data) async {
    try {
      Response response = await dio.post(endpoint, data: data);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// 🚀 **PUT (Update) request with request body**
  Future<Response> put(String endpoint, dynamic data) async {
    try {
      Response response = await dio.put(endpoint, data: data);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// 🚀 **DELETE request**
  Future<Response> delete(String endpoint) async {
    try {
      Response response = await dio.delete(endpoint);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// ✅ **Handles API Response Codes**
  Response _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response;
      case 400:
        throw Exception("Bad Request: ${response.data}");
      case 401:
        throw Exception("Unauthorized: ${response.data}");
      case 403:
        throw Exception("Forbidden: ${response.data}");
      case 404:
        throw Exception("Not Found: ${response.data}");
      case 500:
        throw Exception("Server Error: Please try again later.");
      default:
        throw Exception("Unknown Error: ${response.statusMessage}");
    }
  }

  /// ❌ **Handles Dio Errors and Converts them into Exceptions**
  Exception _handleError(DioException e) {
    if (e.response != null) {
      return Exception(
          "Error ${e.response?.statusCode}: ${e.response?.statusMessage}");
    } else {
      return Exception("Network Error: ${e.message}");
    }
  }
}
