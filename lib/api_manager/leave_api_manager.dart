import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:oas_app/models/requests/leave_request.dart';
import 'package:oas_app/models/responses/leaves_list_response.dart';
import 'package:oas_app/models/responses/only_error_response.dart';
import 'package:oas_app/utils/api_url.dart';
import 'package:oas_app/utils/api_utils.dart';

class LeaveApiManager {
  static final LeaveApiManager defaultApiManager = new LeaveApiManager();

  Future<LeavesListResponse?> getLeaves() async {
    var request = http.MultipartRequest(
      'GET',
      Uri.parse(
        APIUtils.generateUrl(
          APIURL.LEAVE_GET_ALL,
        ),
      ),
    );
    // request.fields.addAll(requestBody!.toJson());
    request.headers.addAll(APIUtils.REQUEST_HEADER_AUTHENTICATED);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      Map<String, dynamic> m = jsonDecode(res);
      return LeavesListResponse.fromJson(m);
    } else {
      print(response.reasonPhrase);
    }
    return null;
  }

  Future<OnlyErrorResponse?> savePost(
    LeaveRequest requestBody,
  ) async {
    var request = http.Request(
      'POST',
      Uri.parse(
        APIUtils.generateUrl(
          APIURL.LEAVE_REQUEST,
        ),
      ),
    );
    request.body = json.encode(requestBody.toJson());
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
    return null;
  }
}
