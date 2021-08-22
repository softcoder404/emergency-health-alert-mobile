import 'dart:convert';
import 'dart:io';
import 'package:health_emergency_report/core/helpers/response_helper.dart';
import 'package:health_emergency_report/core/model/emergency_history_model.dart';
import 'package:http/http.dart' as http;

class EmergencyService {
  static final String baseUrl =
      'https://emergencyhealthalertsystem.herokuapp.com';

  static Future<NetworkResponse> report(Map<String, dynamic> payload) async {
    final _client = http.Client();
    final url = '$baseUrl/emergency/report';

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

  static Future<NetworkResponse> cancelRequest(String _id) async {
    final String endPoint = '/emergency/$_id';
    final url = baseUrl + endPoint;
    final _client = http.Client();
    var result = NetworkResponse.warning();
    try {
      //do some logic
      final response = await _client.delete(
        Uri.parse(url),
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

  static Future<NetworkResponse> getUserEmergencyHistory(String uid) async {
    final String endPoint = '/emergency/user/$uid';
    final url = baseUrl + endPoint;
    final _client = http.Client();
    var result = NetworkResponse.warning();
    try {
      //do some logic
      final response = await _client.get(
        Uri.parse(url),
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
        } else if (data['data'] is List) {
          List<EmergencyHistoryModel> _data = [];
          data['data'].forEach(
              (json) => _data.add(EmergencyHistoryModel.fromJson(json)));
          result = NetworkResponse.success(
            message: data['message'],
            data: _data,
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

  static Future<NetworkResponse> getAllEmergencyHistory() async {
    final String endPoint = '/emergency';
    final url = baseUrl + endPoint;
    final _client = http.Client();
    var result = NetworkResponse.warning();
    try {
      //do some logic
      final response = await _client.get(
        Uri.parse(url),
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
        } else if (data['data'] is List) {
          List<EmergencyHistoryModel> _data = [];
          data['data'].forEach(
              (json) => _data.add(EmergencyHistoryModel.fromJson(json)));
          result = NetworkResponse.success(
            message: data['message'],
            data: _data,
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

  static Future<NetworkResponse> confirmEmergencyRequest(String _id) async {
    final String endPoint = '/emergency/confirm/$_id';
    final url = baseUrl + endPoint;
    final _client = http.Client();
    var result = NetworkResponse.warning();
    try {
      final response = await _client.get(
        Uri.parse(url),
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
