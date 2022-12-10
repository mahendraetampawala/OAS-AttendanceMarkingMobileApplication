import 'package:geolocator/geolocator.dart';
import 'package:oas_app/api_manager/attendance_api_manager.dart';
import 'package:point_in_polygon/point_in_polygon.dart';

class GeoLocationService {
  static Point A = Point(y: 8.2615488, x: 80.2042939);
  static Point B = Point(y: 8.2615493, x: 80.2042863);
  static Point C = Point(y: 8.2615489, x: 80.2042877);
  static Point D = Point(y: 8.2615492, x: 80.204287);
  static bool requestSendStatus = true;

  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  static bool checkLoation(Point currentLocation) {
    final List<Point> points = <Point>[
      A,
      B,
      C,
      D,
    ];
    return Poly.isPointInPolygon(currentLocation, points);
  }

  static Future<void> startLocationChecking() async {
    for (var i = 0; i >= 0; i++) {
      Future.delayed(Duration(seconds: 1)).then((value) {
        GeoLocationService.determinePosition().then((value) {
          bool status = GeoLocationService.checkLoation(
              Point(y: value.latitude, x: value.longitude));
          status = true;
          if (status) {
            if (requestSendStatus) {
              AttendanceApiManager.defaultApiManager.markAttendances();
            } else {
              requestSendStatus = false;
            }
          }
        });
      });
    }
  }
}
