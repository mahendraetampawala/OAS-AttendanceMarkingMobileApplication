import 'package:oas_app/models/attendance.dart';
import 'package:oas_app/models/error.dart';
import 'package:oas_app/models/leave.dart';

class AttendancesListResponse {
  Error? error;
  List<Attendance>? attendances;

  AttendancesListResponse();

  AttendancesListResponse.all({
    required this.attendances,
    required this.error,
  });

  AttendancesListResponse.attendancesOnly({
    required this.attendances,
  });

  AttendancesListResponse.errorOnly({
    required this.error,
  });

  factory AttendancesListResponse.fromJson(Map<String, dynamic> m) {
    AttendancesListResponse response = new AttendancesListResponse();
    if (m['error'] != null) {
      response.error = new Error.fromJson(m['error']);
    }
    if (m['attendances'] != null) {
      List l = m['attendances'];
      response.attendances =
          List<Attendance>.from(l.map((model) => Attendance.fromJson(model)));
    }
    return response;
  }
}
