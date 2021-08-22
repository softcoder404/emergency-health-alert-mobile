import 'dart:convert';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:health_emergency_report/core/helpers/response_helper.dart';
import 'package:http/http.dart' as http;

class LocationService {
  static Future<Position> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          return Future.error(
              'Location permissions are denied (actual value: $permission).');
        }
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  static Future<NetworkResponse> getReverseGeocoding(Position position) async {
    final String _url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=AIzaSyD-aiB6T9iD9V_ujom0m2G4See2bNS5b7w";

    final _client = http.Client();
    var result = NetworkResponse.warning();
    try {
      final response = await _client.get(Uri.parse(_url));

      final data = json.decode(response.body);

      if ((response.statusCode == HttpStatus.ok ||
              response.statusCode == HttpStatus.created) &&
          data is Map) {
        //do something
        if (data['status'] != "OK") {
          if (data['error_message'] is String) {
            result.message = data['error_message'];
          }
        } else if (data['results'] is List) {
          result = NetworkResponse.success(
            message: "Reversed geocoding fetched successfully",
            data: data['results'][0]['formatted_address'],
          );
        }
      } else if (response.statusCode >= HttpStatus.badRequest) {
        result.message = data['error_message'];
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
