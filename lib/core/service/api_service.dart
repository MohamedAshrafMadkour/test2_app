import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});

  Future<Map<String, dynamic>> get(String url) async {
    final response = await dio.get(url);
    return response.data;
  }

  Future<Map<String, dynamic>> getFavAndCartAndProfile(
    String url,
    Map<String, dynamic> data,
  ) async {
    final response = await dio.get(url, data: data);
    return response.data;
  }

  Future post({required String url, required Map<String, dynamic> data}) async {
    final response = await dio.post(url, data: data);
    return response.data;
  }

  Future delete({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    final response = await dio.delete(url, data: data);
    return response.data;
  }

  Future put({required String url, required Map<String, dynamic> data}) async {
    final response = await dio.put(url, data: data);
    return response.data;
  }
}
//https://elwekala.onrender.com/favorite