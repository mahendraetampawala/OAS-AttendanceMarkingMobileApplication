import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:oas_app/models/requests/signin_request.dart';
import 'package:oas_app/models/responses/signin_response.dart';
import 'package:oas_app/utils/api_url.dart';
import 'package:oas_app/utils/api_utils.dart';

class AuthAPIManager {
  static final AuthAPIManager defaultAuthAPIManager = new AuthAPIManager();

  Future<SigninResponse?> signinRequest(SigninRequest? requestBody) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse(APIUtils.generateUrl(APIURL.SIGN_IN)));
    request.fields.addAll(requestBody!.toJson());
    request.headers.addAll(APIUtils.REQUEST_HEADER_UNAUTHENTICATED);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return new SigninResponse.fromJson(jsonDecode(res));
    } else {
      print(response.reasonPhrase);
    }
    return null;
  }

//   Future<SignupResponse?> resendOtpRequest(
//       ResendOtpRequest? requestBody) async {
//     var request = http.MultipartRequest(
//         'POST', Uri.parse(APIUtils.generateUrl(APIURL.RESEND_OTP)));
//     request.fields.addAll(requestBody!.toJson());
//     request.headers.addAll(APIUtils.REQUEST_HEADER_UNAUTHENTICATED);
//     http.StreamedResponse response = await request.send();
//     if (response.statusCode == 200) {
//       var res = await response.stream.bytesToString();
//       return new SignupResponse.fromJson(jsonDecode(res));
//     } else {
//       print(response.reasonPhrase);
//     }
//     return null;
//   }

//   Future<OnlyErrorResponse?> verifyOtpRequest(
//       VerifyOtpRequest? requestBody) async {
//     var request = http.MultipartRequest(
//         'POST', Uri.parse(APIUtils.generateUrl(APIURL.VERIFY_OTP)));
//     request.fields.addAll(requestBody!.toJson());
//     request.headers.addAll(APIUtils.REQUEST_HEADER_UNAUTHENTICATED);
//     http.StreamedResponse response = await request.send();
//     if (response.statusCode == 200) {
//       var res = await response.stream.bytesToString();
//       return new OnlyErrorResponse.fromJson(jsonDecode(res));
//     } else {
//       print(response.reasonPhrase);
//     }
//     return null;
//   }

//   Future<OnlyErrorResponse?> changePassword(
//     ChangePasswordRequest requestBody,
//   ) async {
//     var request = http.Request(
//       'POST',
//       Uri.parse(
//         APIUtils.generateUrl(
//           APIURL.CHANGE_PASSWORD,
//         ),
//       ),
//     );
//     request.body = json.encode(requestBody.toJson());
//     request.headers.addAll(APIUtils.REQUEST_HEADER_AUTHENTICATED);

//     http.StreamedResponse response = await request.send();

//     if (response.statusCode == 200) {
//       return new OnlyErrorResponse.fromJson(
//         jsonDecode(
//           await response.stream.bytesToString(),
//         ),
//       );
//     } else {
//       print(response.reasonPhrase);
//     }
//     return null;
//   }

//   Future<OnlyErrorResponse?> changeNickName(
//     ChangeNickNameRequest requestBody,
//   ) async {
//     var request = http.Request(
//       'POST',
//       Uri.parse(
//         APIUtils.generateUrl(
//           APIURL.CHANGE_NICKNAME,
//         ),
//       ),
//     );
//     request.body = json.encode(requestBody.toJson());
//     request.headers.addAll(APIUtils.REQUEST_HEADER_AUTHENTICATED);

//     http.StreamedResponse response = await request.send();

//     if (response.statusCode == 200) {
//       return new OnlyErrorResponse.fromJson(
//         jsonDecode(
//           await response.stream.bytesToString(),
//         ),
//       );
//     } else {
//       print(response.reasonPhrase);
//     }
//     return null;
//   }
}
