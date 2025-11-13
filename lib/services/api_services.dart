import 'package:dio/dio.dart';
import 'package:tmdb_flutter/services/api_response.dart';

import 'api_client.dart';

class ApiService {
  final Dio _dio = ApiClient().dio;

  Future<Response> getRequest(
    String endpoint, {
    Map<String, dynamic>? query,
  }) async {
    return await _dio.get(endpoint, queryParameters: query);
  }

  Future<Response> postRequest(String endpoint, {dynamic data}) async {
    return await _dio.post(endpoint, data: data);
  }

  Future<Response> putRequest(String endpoint, {dynamic data}) async {
    return await _dio.put(endpoint, data: data);
  }

  Future<Response> patchRequest(String endpoint, {dynamic data}) async {
    return await _dio.patch(endpoint, data: data);
  }

  Future<Response> deleteRequest(String endpoint, {dynamic data}) async {
    return await _dio.delete(endpoint, data: data);
  }

  Future<Response> uploadFile(
    String endpoint,
    String filePath, {
    Map<String, dynamic>? data,
  }) async {
    FormData formData = FormData.fromMap({
      ...?data,
      "file": await MultipartFile.fromFile(filePath),
    });
    return await _dio.post(endpoint, data: formData);
  }

  Future<ApiResponse> safeGet(String endpoint) async {
  try {
    final response = await _dio.get(endpoint);
    return ApiResponse.success(response.data);
  } on DioException catch (e) {
    return ApiResponse.error(e.message ?? "Unknown Error");
  }
}
}
