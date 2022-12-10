import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:oas_app/models/requests/attendance_request.dart';
import 'package:oas_app/models/responses/attendances_list_response.dart';
import 'package:oas_app/models/responses/only_error_response.dart';
import 'package:oas_app/utils/api_url.dart';
import 'package:oas_app/utils/api_utils.dart';
import 'package:oas_app/utils/app_utils.dart';

class AttendanceApiManager {
  static final AttendanceApiManager defaultApiManager =
      new AttendanceApiManager();

  Future<OnlyErrorResponse?> markAttendances() async {
    AttendanceRequest _request = new AttendanceRequest();
    _request.requestedEmployeeId = AppUtils.defaultUser!.id;
    _request.formType = 0;
    var now = new DateTime.now();
    var dateFormatter = new DateFormat('yyyy-MM-dd');
    var timeFormatter = new DateFormat('HH:mm:dd');
    _request.date = dateFormatter.format(now);
    _request.time = timeFormatter.format(now);

    var request = http.Request(
      'POST',
      Uri.parse(
        APIUtils.generateUrl(
          APIURL.ATTENDANCE_CHECK_REQUEST,
        ),
      ),
    );
    request.body = json.encode(_request.toJson());
    request.headers.addAll(APIUtils.REQUEST_HEADER_AUTHENTICATED);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return new OnlyErrorResponse.fromJson(
        jsonDecode(
          await response.stream.bytesToString(),
        ),
      );
    } else {
      print(response.reasonPhrase);
    }
    print("Attendance Mark has been successfull");
    return null;
  }

  Future<AttendancesListResponse?> getAttendancess() async {
    var request = http.MultipartRequest(
      'GET',
      Uri.parse(
        APIUtils.generateUrl(
          APIURL.ATTENDANCE_GET_ALL,
        ),
      ),
    );
    // request.fields.addAll(requestBody!.toJson());
    request.headers.addAll(APIUtils.REQUEST_HEADER_AUTHENTICATED);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      print(res);
      Map<String, dynamic> m = jsonDecode(res);
      return AttendancesListResponse.fromJson(m);
    } else {
      print(response.reasonPhrase);
    }
    return null;
  }
}
