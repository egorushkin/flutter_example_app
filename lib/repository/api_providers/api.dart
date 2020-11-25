import 'dart:convert';

import 'package:flutter_example_app/di/app_module.dart';
import 'package:flutter_example_app/repository/api_providers/endpoints.dart';
import 'package:flutter_example_app/repository/models/track.dart';
import 'package:dio/dio.dart';

class Api {

  final Dio _dio = inject<Dio>();

  Future<TracksResponse> getTracks(String trackName) async {
    try {
      Response response = await _dio.get(getTracksUrl(trackName));
      final decodedJson = jsonDecode(response.data);
      return TracksResponse.fromJson(decodedJson);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return TracksResponse.withError(_handleError(error));
    }
  }

  String _handleError(Exception exception) {
    String errorDescription = "";
    if (exception is DioError) {
      DioError dioError = exception;
      switch (dioError.type) {
        case DioErrorType.CANCEL:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.DEFAULT:
          errorDescription =
              "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.RESPONSE:
          errorDescription =
              "Received invalid status code: ${dioError.response.statusCode}";
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    return errorDescription;
  }
}
