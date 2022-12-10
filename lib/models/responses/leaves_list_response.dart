import 'package:oas_app/models/error.dart';
import 'package:oas_app/models/leave.dart';

class LeavesListResponse {
  Error? error;
  List<Leave>? leaves;

  LeavesListResponse();

  LeavesListResponse.all({
    required this.leaves,
    required this.error,
  });

  LeavesListResponse.leavesOnly({
    required this.leaves,
  });

  LeavesListResponse.errorOnly({
    required this.error,
  });

  factory LeavesListResponse.fromJson(Map<String, dynamic> m) {
    LeavesListResponse response = new LeavesListResponse();
    if (m['error'] != null) {
      response.error = new Error.fromJson(m['error']);
    }
    if (m['leaves'] != null) {
      List l = m['leaves'];
      response.leaves =
          List<Leave>.from(l.map((model) => Leave.fromJson(model)));
    }
    return response;
  }
}
