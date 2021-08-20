import 'dart:convert';
import 'dart:io';
import 'package:health_emergency_report/core/helpers/response_helper.dart';
import 'package:http/http.dart' as http;

class AuthenticationService {
  static final String baseUrl =
      'https://us-central1-transcent-cargo-32364.cloudfunctions.net/v1';

  static Future<NetworkResponse> register(payload) async {
    final _client = http.Client();
    final url = '$baseUrl/auth/register';

    var result = NetworkResponse.warning();
    try {
      final response = await _client.post(
        Uri.parse(url),
        body: json.encode(payload),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        encoding: Encoding.getByName('utf-8'),
      );
      final data = json.decode(response.body);

      if (response.statusCode == HttpStatus.ok && data is Map) {
        if (!data['success']) {
          if (data['message'] is String) {
            result.message = data['message'];
          }
        } else if (data['data'] is Map) {
          result = NetworkResponse.success(
            data: data['data'],
            message: data['message'],
          );
        }
      } else if (response.statusCode >= HttpStatus.badRequest) {
        result.message = data['message'];
      }
    } on SocketException {
      result.message = 'No Internet Connection!';
    } catch (error, trace) {
      result.handleError(error, trace);
    } finally {
      _client.close();
    }

    return result;
  }

  static Future<NetworkResponse> login(dynamic user) async {
    final String endPoint = '/auth/login';
    final url = baseUrl + endPoint;
    final _client = http.Client();
    var result = NetworkResponse.warning();
    try {
      //do some logic
      final response = await _client.post(
        Uri.parse(url),
        body: json.encode(user),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );

      final data = json.decode(response.body);
      if (response.statusCode == HttpStatus.ok && data is Map) {
        if (!data['success']) {
          if (data['message'] is String) {
            result.message = data['message'];
          }
        } else if (data['data'] is Map) {
          result = NetworkResponse.success(
            data: data['data'],
            message: data['message'],
          );
        }
      } else if (response.statusCode >= HttpStatus.badRequest) {
        result.message = data['message'];
      }
    } on SocketException {
      result.message = 'No Internet Connection!';
    } catch (error, trace) {
      result.handleError(error, trace);
    } finally {
      _client.close();
    }

    return result;
  }

  static Future<NetworkResponse> resetPassword(String email) async {
    final String endPoint = '/auth/resetPassword';
    final url = baseUrl + endPoint;
    final _client = http.Client();
    var result = NetworkResponse.warning();
    try {
      //do some logic
      final response = await _client.post(
        Uri.parse(url),
        body: json.encode({"email": email}),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );

      final data = json.decode(response.body);
      if (response.statusCode == HttpStatus.ok && data is Map) {
        if (!data['success']) {
          if (data['message'] is String) {
            result.message = data['message'];
          }
        } else if (data['data'] is Map) {
          result = NetworkResponse.success(
            message: data['message'],
          );
        }
      } else if (response.statusCode >= HttpStatus.badRequest) {
        result.message = data['message'];
      }
    } on SocketException {
      result.message = 'No Internet Connection!';
    } catch (error, trace) {
      result.handleError(error, trace);
    } finally {
      _client.close();
    }

    return result;
  }

  
  static Future<NetworkResponse> updateUserAccount(
      Map<String, dynamic> payload) async {
    final String endPoint = '/user/update';
    final url = baseUrl + endPoint;
    final _client = http.Client();
    var result = NetworkResponse.warning();
    try {
      final response = await _client.post(
        Uri.parse(url),
        body: json.encode(payload),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );

      final data = json.decode(response.body);
      if (response.statusCode == HttpStatus.ok && data is Map) {
        if (!data['success']) {
          if (data['message'] is String) {
            result.message = data['message'];
          }
        } else if (data['data'] is Map) {
          result = NetworkResponse.success(
            data: data['data'],
            message: data['message'],
          );
        }
      } else if (response.statusCode >= HttpStatus.badRequest) {
        result.message = data['message'];
      }
    } on SocketException {
      result.message = 'No Internet Connection!';
    } catch (error, trace) {
      result.handleError(error, trace);
    } finally {
      _client.close();
    }
    return result;
  }

  static Future<NetworkResponse> changePassword(
      Map<String, dynamic> payload) async {
    final String endPoint = '/user/password';
    final url = baseUrl + endPoint;
    final _client = http.Client();
    var result = NetworkResponse.warning();
    try {
      final response = await _client.post(
        Uri.parse(url),
        body: json.encode(payload),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );

      final data = json.decode(response.body);
      if (response.statusCode == HttpStatus.ok && data is Map) {
        if (!data['success']) {
          if (data['message'] is String) {
            result.message = data['message'];
          }
        } else if (data['data'] is Map) {
          result = NetworkResponse.success(
            data: data['data'],
            message: data['message'],
          );
        }
      } else if (response.statusCode >= HttpStatus.badRequest) {
        result.message = data['message'];
      }
    } on SocketException {
      result.message = 'No Internet Connection!';
    } catch (error, trace) {
      result.handleError(error, trace);
    } finally {
      _client.close();
    }
    return result;
  }
}
